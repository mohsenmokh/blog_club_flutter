import 'package:flutter/material.dart';

import 'package:flutter_application_2/data.dart';
import 'package:flutter_application_2/gen/assets.gen.dart';
import 'package:flutter_application_2/home.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = AppDatabase.posts;
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            AppBar(
              titleSpacing: 32,
              backgroundColor: themeData.colorScheme.surface.withOpacity(0),
              title: Text(
                'Profile',
                style: themeData.textTheme.titleLarge!.copyWith(fontSize: 20),
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz_rounded)),
                const SizedBox(
                  width: 24,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 32),
                    decoration: BoxDecoration(
                        color: themeData.colorScheme.surface,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 20,
                              color: themeData.colorScheme.onSurface
                                  .withOpacity(0.1))
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                          child: Row(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Assets.img.stories.story1
                                      .image(width: 84, height: 84)),
                              const SizedBox(
                                width: 12,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '@javiedan',
                                    style: themeData.textTheme.bodySmall,
                                  ),
                                  Text(
                                    'Javi Daniel',
                                    style: themeData.textTheme.bodyLarge!
                                        .copyWith(fontSize: 17),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'UX Designer',
                                    style: themeData.textTheme.bodyLarge!
                                        .copyWith(
                                            color:
                                                themeData.colorScheme.primary,
                                            fontSize: 15),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(32, 32, 32, 8),
                          child: Text(
                            'About me',
                            style: themeData.textTheme.titleLarge!
                                .copyWith(fontSize: 22),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
                          child: Text(
                            'Madison Blackstone is a director of user experience design, with experience managing global teams.',
                            style: themeData.textTheme.titleSmall!.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      left: 80,
                      right: 80,
                      bottom: 0,
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              blurRadius: 40,
                              color: themeData.colorScheme.onSurface
                                  .withOpacity(0.8))
                        ]),
                      )),
                  Positioned(
                      bottom: 0,
                      left: 40,
                      right: 40,
                      child: Container(
                        height: 68,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: themeData.colorScheme.primary),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: const Color(0xff2151CD)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '52',
                                      style: themeData.textTheme.bodyLarge!
                                          .copyWith(
                                              color: themeData
                                                  .colorScheme.onPrimary,
                                              fontSize: 20),
                                    ),
                                    Text(
                                      'Post',
                                      style: themeData.textTheme.bodySmall!
                                          .copyWith(
                                              color: themeData
                                                  .colorScheme.onPrimary),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '250',
                                    style: themeData.textTheme.bodyLarge!
                                        .copyWith(
                                            color:
                                                themeData.colorScheme.onPrimary,
                                            fontSize: 20),
                                  ),
                                  Text(
                                    'Following',
                                    style: themeData.textTheme.bodySmall!
                                        .copyWith(
                                            color: themeData
                                                .colorScheme.onPrimary),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '4.5K',
                                    style: themeData.textTheme.bodyLarge!
                                        .copyWith(
                                            color:
                                                themeData.colorScheme.onPrimary,
                                            fontSize: 20),
                                  ),
                                  Text(
                                    'Followers',
                                    style: themeData.textTheme.bodySmall!
                                        .copyWith(
                                            color: themeData
                                                .colorScheme.onPrimary),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            Container(
              decoration: BoxDecoration(
                  color: themeData.colorScheme.surface,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 20,
                        color: themeData.colorScheme.onSurface.withOpacity(0.1))
                  ]),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Text(
                          'My Posts',
                          style: themeData.textTheme.titleLarge!.copyWith(
                              fontSize: 18, fontWeight: FontWeight.w800),
                        )),
                        IconButton(
                            onPressed: () {},
                            icon: Assets.img.icons.grid.svg()),
                        IconButton(
                            onPressed: () {},
                            icon: Assets.img.icons.table.svg())
                      ],
                    ),
                  ),
                  for (var i = 0; i < posts.length; i++)
                    PostItem(post: posts[i])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
