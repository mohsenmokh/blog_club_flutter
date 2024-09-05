import 'package:flutter/material.dart';

import 'package:flutter_application_2/gen/assets.gen.dart';
import 'package:flutter_application_2/onboarding.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const int loginTab = 0;
  static const int signUpTab = 1;
  int selectedTabIndex = loginTab;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 90, bottom: 32),
          child: Assets.img.icons.logo.svg(width: 110),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: themeData.colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                )),
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            selectedTabIndex = loginTab;
                          });
                        },
                        child: Text(
                          'LOGIN',
                          style: themeData.textTheme.bodyLarge!.copyWith(
                              color: selectedTabIndex == loginTab
                                  ? themeData.colorScheme.onPrimary
                                  : themeData.colorScheme.onPrimary
                                      .withOpacity(0.5)),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            selectedTabIndex = signUpTab;
                          });
                        },
                        child: Text(
                          'SIGN UP',
                          style: themeData.textTheme.bodyLarge!.copyWith(
                              color: selectedTabIndex == signUpTab
                                  ? themeData.colorScheme.onPrimary
                                  : themeData.colorScheme.onPrimary
                                      .withOpacity(0.5)),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32)),
                    color: themeData.colorScheme.surface,
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: SingleChildScrollView(
                          child: selectedTabIndex == loginTab
                              ? _Login(themeData: themeData)
                              : _SignUp(themeData: themeData)),
                    ),
                  ),
                ))
              ],
            ),
          ),
        )
      ],
    ));
  }
}

class _Login extends StatelessWidget {
  const _Login({
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Welcome back', style: themeData.textTheme.titleLarge),
        const SizedBox(
          height: 8,
        ),
        Text(
          'sign in with your account',
          style: themeData.textTheme.bodySmall!.copyWith(fontSize: 16),
        ),
        const SizedBox(
          height: 16,
        ),
        const TextField(
          decoration: InputDecoration(label: Text('Username')),
        ),
        const SizedBox(
          height: 16,
        ),
        const PasswordTextField(),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
            style: ButtonStyle(
                foregroundColor:
                    WidgetStateProperty.all(themeData.colorScheme.onPrimary),
                backgroundColor:
                    WidgetStateProperty.all(themeData.colorScheme.primary),
                minimumSize: WidgetStateProperty.all(
                    Size(MediaQuery.of(context).size.width, 60)),
                shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)))),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const OnBoardingScreen()));
            },
            child: const Text('LOGIN')),
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Forgot your password?',
              style: themeData.textTheme.bodySmall,
            ),
            const SizedBox(
              width: 8,
            ),
            TextButton(onPressed: () {}, child: const Text('Reset here'))
          ],
        ),
        const SizedBox(
          height: 32,
        ),
        Center(
          child: Text(
            'or sign in with'.toUpperCase(),
            style: themeData.textTheme.titleSmall!
                .copyWith(fontSize: 16, letterSpacing: 2),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(width: 36, height: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.facebook.image(width: 36, height: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.twitter.image(width: 36, height: 36)
          ],
        )
      ],
    );
  }
}

class _SignUp extends StatelessWidget {
  const _SignUp({
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Welcome to Blog Club', style: themeData.textTheme.titleLarge),
        const SizedBox(
          height: 8,
        ),
        Text(
          'sign in with your account',
          style: themeData.textTheme.bodySmall!.copyWith(fontSize: 16),
        ),
        const SizedBox(
          height: 16,
        ),
        const TextField(
          decoration: InputDecoration(label: Text('Fullname')),
        ),
        const SizedBox(
          height: 16,
        ),
        const TextField(
          decoration: InputDecoration(label: Text('Username')),
        ),
        const SizedBox(
          height: 16,
        ),
        const PasswordTextField(),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
            style: ButtonStyle(
                foregroundColor:
                    WidgetStateProperty.all(themeData.colorScheme.onPrimary),
                backgroundColor:
                    WidgetStateProperty.all(themeData.colorScheme.primary),
                minimumSize: WidgetStateProperty.all(
                    Size(MediaQuery.of(context).size.width, 60)),
                shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)))),
            onPressed: () {},
            child: const Text('Sign Up')),
        const SizedBox(
          height: 24,
        ),
        const SizedBox(
          height: 32,
        ),
        Center(
          child: Text(
            'or sign up with'.toUpperCase(),
            style: themeData.textTheme.titleSmall!
                .copyWith(fontSize: 16, letterSpacing: 2),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(width: 36, height: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.facebook.image(width: 36, height: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.twitter.image(width: 36, height: 36)
          ],
        )
      ],
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
          label: const Text('Password'),
          suffixIcon: TextButton(
              style: const ButtonStyle(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap),
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              child: obscureText ? const Text('Show') : const Text('Hide'))),
    );
  }
}
