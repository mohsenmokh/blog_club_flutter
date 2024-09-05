import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_2/gen/assets.gen.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          showSnackbar(context, 'Like button is clicked');
        },
        child: Container(
          width: 111,
          height: 48,
          decoration: BoxDecoration(
              color: themeData.colorScheme.primary,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    blurRadius: 20,
                    color: themeData.colorScheme.primary.withOpacity(0.5))
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.img.icons.thumbs.svg(),
              const SizedBox(
                width: 4,
              ),
              Text(
                '2.1k',
                style: themeData.textTheme.bodyLarge!
                    .copyWith(color: themeData.colorScheme.onPrimary),
              )
            ],
          ),
        ),
      ),
      backgroundColor: themeData.colorScheme.surface,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text(
                  'Article',
                  style: themeData.textTheme.titleLarge!.copyWith(fontSize: 18),
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
              SliverList(
                delegate: SliverChildListDelegate.fixed(
                  [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 16, 32, 24),
                      child: Text(
                        'Four Thing Every Woman Needs To Know ',
                        style: themeData.textTheme.titleLarge,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 0, 22, 32),
                      child: Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Assets.img.stories.story5.image(
                                  width: 48, height: 48, fit: BoxFit.cover)),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Richard Gervain',
                                    style: themeData.textTheme.bodyLarge!
                                        .copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15)),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '2m ago',
                                  style: themeData.textTheme.bodySmall,
                                )
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                showSnackbar(
                                    context, 'Share button is clicked');
                              },
                              icon: Icon(
                                CupertinoIcons.share,
                                color: themeData.colorScheme.primary,
                              )),
                          const SizedBox(
                            width: 8,
                          ),
                          IconButton(
                              onPressed: () {
                                showSnackbar(context, 'Bookmarked');
                              },
                              icon: Icon(CupertinoIcons.bookmark,
                                  color: themeData.colorScheme.primary))
                        ],
                      ),
                    ),
                    ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32)),
                        child: Assets.img.background.singlePost.image()),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
                      child: Text(
                        'A man’s sexuality is never your mind responsibility.',
                        style: themeData.textTheme.titleLarge!
                            .copyWith(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
                      child: Text(
                          style: themeData.textTheme.bodySmall,
                          'This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.'),
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 160,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                      themeData.colorScheme.surface,
                      themeData.colorScheme.surface.withOpacity(0)
                    ])),
              ))
        ],
      ),
    );
  }
}

void showSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    behavior: SnackBarBehavior.fixed,
  ));
}
