import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_2/data.dart';

import 'package:flutter_application_2/gen/assets.gen.dart';
import 'package:flutter_application_2/main.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();

  int page = 0;

  @override
  void initState() {
    _pageController.addListener(() {
      if (_pageController.page!.round() != page) {
        setState(() {
          page = _pageController.page!.round();
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final items = AppDatabase.onBoardingItems;
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 32,
                ),
                child: Assets.img.background.onboarding.image(),
              ),
            ),
            Container(
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32)),
                  color: themeData.colorScheme.surface,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 20, color: Colors.black.withOpacity(0.1))
                  ]),
              child: Column(children: [
                Expanded(
                    child: PageView.builder(
                        itemCount: items.length,
                        controller: _pageController,
                        itemBuilder: (context, index) {
                          final item = items[index];
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 32, right: 32, top: 32),
                            child: Column(
                              children: [
                                Text(
                                  item.title,
                                  style: themeData.textTheme.titleLarge,
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Text(
                                  item.description,
                                  style: themeData.textTheme.bodySmall,
                                )
                              ],
                            ),
                          );
                        })),
                Padding(
                  padding: const EdgeInsets.only(left: 32, right: 32),
                  child: SizedBox(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmoothPageIndicator(
                            effect: ExpandingDotsEffect(
                                dotHeight: 8,
                                dotWidth: 8,
                                activeDotColor: themeData.colorScheme.primary,
                                dotColor: themeData.colorScheme.primary
                                    .withOpacity(0.1)),
                            controller: _pageController,
                            count: items.length),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                    themeData.colorScheme.primary),
                                minimumSize:
                                    WidgetStateProperty.all(const Size(88, 60)),
                                shape: WidgetStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ))),
                            onPressed: () {
                              if (page == items.length - 1) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const MainScreen()));
                              } else {
                                _pageController.animateToPage(page + 1,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.decelerate);
                              }
                            },
                            child: Icon(
                              page == items.length - 1
                                  ? CupertinoIcons.check_mark
                                  : CupertinoIcons.arrow_right,
                              color: themeData.colorScheme.onPrimary,
                            ))
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
