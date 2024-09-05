// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_application_2/article.dart';

import 'package:flutter_application_2/gen/fonts.gen.dart';
import 'package:flutter_application_2/home.dart';

import 'package:flutter_application_2/profile.dart';
import 'package:flutter_application_2/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryTextColor = Color(0xff0D253C);
    const secondaryTextColor = Color(0xff2D4379);
    const primaryColor = Color(0xff376AED);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          snackBarTheme: const SnackBarThemeData(
              backgroundColor: primaryColor,
              contentTextStyle: TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 255, 255, 255))),
          appBarTheme: const AppBarTheme(
            titleSpacing: 32,
          ),
          colorScheme: const ColorScheme.light(
              primary: primaryColor,
              onPrimary: Colors.white,
              onSurface: primaryTextColor,
              onBackground: primaryTextColor,
              surface: Colors.white,
              background: Color(0xffFBFCFF)),
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(const TextStyle(
                      fontFamily: FontFamily.avenir,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: primaryColor)))),
          textTheme: const TextTheme(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 24,
                  fontFamily: FontFamily.avenir,
                  color: primaryTextColor),
              titleSmall: TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontWeight: FontWeight.w200,
                  color: secondaryTextColor,
                  fontSize: 18),
              bodySmall: TextStyle(
                  color: secondaryTextColor,
                  fontFamily: FontFamily.avenir,
                  fontSize: 14),
              bodyMedium: TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: primaryColor),
              bodyLarge: TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontSize: 16,
                  fontWeight: FontWeight.w700))),
      home: const SplashScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

const homeIndex = 0;
const articleIndex = 1;
const searchIndex = 2;
const menuIndex = 3;

final List<int> _history = [];

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<NavigatorState> _homeKey = GlobalKey();
  final GlobalKey<NavigatorState> _articleKey = GlobalKey();
  final GlobalKey<NavigatorState> _searchKey = GlobalKey();
  final GlobalKey<NavigatorState> _menuKey = GlobalKey();

  late final map = {
    homeIndex: _homeKey,
    articleIndex: _articleKey,
    searchIndex: _searchKey,
    menuIndex: _menuKey,
  };

  Future<bool> _onWillPop() async {
    final NavigatorState currentSelectedTabNavigatorState =
        map[selectedTabIndex]!.currentState!;
    if (currentSelectedTabNavigatorState.canPop()) {
      currentSelectedTabNavigatorState.pop();
      return false;
    } else if (_history.isNotEmpty) {
      setState(() {
        selectedTabIndex = _history.last;
        _history.removeLast();
      });
      return false;
    }

    return true;
  }

  int selectedTabIndex = homeIndex;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              bottom: 65,
              child: IndexedStack(
                index: selectedTabIndex,
                children: [
                  _navigator(_homeKey, homeIndex, HomeScreen()),
                  _navigator(_articleKey, articleIndex, const ArticleScreen()),
                  _navigator(_searchKey, searchIndex, const SearchScreen()),
                  _navigator(_menuKey, menuIndex, const ProfileScreen()),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: _BottomNavigation(
                  selectedIndex: selectedTabIndex,
                  selectedTabChanged: (int index) {
                    setState(() {
                      _history.remove(selectedTabIndex);
                      _history.add(selectedTabIndex);
                      selectedTabIndex = index;
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navigator(GlobalKey key, int index, Widget child) {
    return key.currentState == null && selectedTabIndex != index
        ? Container()
        : Navigator(
            key: key,
            onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (context) => Offstage(
                    offstage: selectedTabIndex != index, child: child)),
          );
  }
}

class _BottomNavigation extends StatelessWidget {
  final Function(int index) selectedTabChanged;
  final int selectedIndex;

  const _BottomNavigation(
      {required this.selectedTabChanged, required this.selectedIndex});
  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xff376AED);
    return SizedBox(
      height: 85,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    blurRadius: 20,
                    color: const Color(0xff9b8487).withOpacity(0.3))
              ]),
              height: 65,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _BottomNavigationItem(
                      isActive: selectedIndex == homeIndex,
                      onTap: () {
                        selectedTabChanged(homeIndex);
                      },
                      iconFileName: 'Home.png',
                      activeIconFileName: 'Home.png',
                      title: 'Home'),
                  _BottomNavigationItem(
                      isActive: selectedIndex == articleIndex,
                      onTap: () {
                        selectedTabChanged(articleIndex);
                      },
                      iconFileName: 'Articles.png',
                      activeIconFileName: 'Articles.png',
                      title: 'Article'),
                  Expanded(child: Container()),
                  _BottomNavigationItem(
                      isActive: selectedIndex == searchIndex,
                      onTap: () {
                        selectedTabChanged(searchIndex);
                      },
                      iconFileName: 'Search.png',
                      activeIconFileName: 'Search.png',
                      title: 'Search'),
                  _BottomNavigationItem(
                      isActive: selectedIndex == menuIndex,
                      onTap: () {
                        selectedTabChanged(menuIndex);
                      },
                      iconFileName: 'Menu.png',
                      activeIconFileName: 'Menu.png',
                      title: 'Menu')
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              height: 85,
              width: 65,
              alignment: Alignment.topCenter,
              child: Container(
                  height: 65,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32.5),
                      color: primaryColor,
                      border: Border.all(color: Colors.white, width: 4)),
                  child: Image.asset('assets/img/icons/plus.png')),
            ),
          )
        ],
      ),
    );
  }
}

class _BottomNavigationItem extends StatelessWidget {
  final String iconFileName;
  final String activeIconFileName;
  final String title;
  final bool isActive;
  final Function() onTap;

  const _BottomNavigationItem(
      {required this.iconFileName,
      required this.activeIconFileName,
      required this.title,
      required this.onTap,
      required this.isActive});
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/img/icons/$iconFileName'),
            const SizedBox(
              height: 4,
            ),
            Text(
              title,
              style: themeData.textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 10,
                  color: isActive
                      ? themeData.colorScheme.primary
                      : const Color(0xff7B8BB2)),
            )
          ],
        ),
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Search Screen'),
      ),
    );
  }
}
