import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/article.dart';
import 'package:flutter_application_2/carousel/carousel_slider.dart';
import 'package:flutter_application_2/data.dart';
import 'package:flutter_application_2/gen/assets.gen.dart';

class HomeScreen extends StatelessWidget {
  final stories = AppDatabase.stories;
  final categories = AppDatabase.categories;
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 24, 32, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hi, Jonathan!',
                    style: themeData.textTheme.titleSmall,
                  ),
                  Assets.img.icons.notification.image(width: 24, height: 24),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 0, 24),
              child: Text(
                'Explore Today',
                style: themeData.textTheme.titleLarge,
              ),
            ),
            _StoryList(stories: stories, themeData: themeData),
            const SizedBox(
              height: 16,
            ),
            _CategoryList(categories: categories),
            _PostList(),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({
    required this.categories,
  });

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: categories.length,
        itemBuilder: (context, index, realIndex) {
          final category = categories[realIndex];
          return _CategoryItem(
              left: realIndex == 0 ? 32 : 8,
              right: realIndex == categories.length - 1 ? 32 : 8,
              category: category);
        },
        options: CarouselOptions(
            aspectRatio: 1.2,
            enableInfiniteScroll: false,
            scrollDirection: Axis.horizontal,
            viewportFraction: 0.8,
            initialPage: 0,
            scrollPhysics: const BouncingScrollPhysics(),
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            disableCenter: true));
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({
    required this.category,
    required this.left,
    required this.right,
  });

  final Category category;
  final double left;
  final double right;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            right: 70,
            left: 70,
            top: 100,
            bottom: 16,
            child: Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(blurRadius: 20, color: Color(0xaa0D253C)),
              ]),
            )),
        Positioned.fill(
          right: right,
          left: left,
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(32)),
            foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [Color(0xff0D253C), Colors.transparent])),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Image.asset(
                'assets/img/posts/large/${category.imageFileName}',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          left: 56,
          bottom: 48,
          child: Text(
            category.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .apply(color: Colors.white, fontSizeFactor: 0.75),
          ),
        )
      ],
    );
  }
}

class _StoryList extends StatelessWidget {
  const _StoryList({
    required this.stories,
    required this.themeData,
  });

  final List<StoryData> stories;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
          itemCount: stories.length,
          itemBuilder: (context, index) {
            final story = stories[index];
            return _StoryItem(story: story, themeData: themeData);
          }),
    );
  }
}

class _StoryItem extends StatelessWidget {
  const _StoryItem({
    required this.story,
    required this.themeData,
  });

  final StoryData story;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 2, 4, 0),
      child: Column(
        children: [
          Stack(
            children: [
              story.isViewed ? _profileImageViewed() : _profileImageNormal(),
              Positioned(
                  right: 0,
                  bottom: 0,
                  child: Image.asset(
                    'assets/img/icons/${story.iconFileName}',
                    width: 24,
                    height: 24,
                  ))
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            story.name,
            style: themeData.textTheme.bodySmall,
          )
        ],
      ),
    );
  }

  Widget _profileImageNormal() {
    return Container(
      width: 68,
      height: 68,
      decoration: BoxDecoration(
          gradient: const LinearGradient(begin: Alignment.topLeft, colors: [
            Color(0xff376AED),
            Color(0xff49B0E2),
            Color(0xff9CECFB),
          ]),
          borderRadius: BorderRadius.circular(24)),
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(22)),
        padding: const EdgeInsets.all(6),
        child: _profileImage(),
      ),
    );
  }

  Widget _profileImageViewed() {
    return SizedBox(
      width: 68,
      height: 68,
      child: DottedBorder(
        dashPattern: const [5, 3],
        strokeWidth: 2,
        borderType: BorderType.RRect,
        radius: const Radius.circular(24),
        color: const Color(0xff7B8BB2),
        padding: const EdgeInsets.all(7),
        child: _profileImage(),
      ),
    );
  }

  Widget _profileImage() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(17),
        child: Image.asset('assets/img/stories/${story.imageFileName}'));
  }
}

class _PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final posts = AppDatabase.posts;
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 42, 24, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Latest News',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .apply(fontSizeFactor: 0.9),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'More',
                    style: TextStyle(color: Color.fromARGB(255, 50, 94, 214)),
                  ))
            ],
          ),
          ListView.builder(
              itemCount: posts.length,
              itemExtent: 141,
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final post = posts[index];
                return PostItem(
                  post: post,
                );
              })
        ],
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  const PostItem({
    super.key,
    required this.post,
  });

  final PostData post;

  @override
  Widget build(BuildContext context) {
    const primaryTextColor = Color(0xff0D253C);
    return InkWell(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ArticleScreen())),
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(blurRadius: 10, color: Color(0x1a5282FF))
            ]),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/img/posts/small/${post.imageFileName}',
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      post.caption,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      post.title,
                      style: Theme.of(context).textTheme.bodySmall!.apply(
                            color: primaryTextColor,
                          ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Icon(
                          CupertinoIcons.hand_thumbsup,
                          color: primaryTextColor,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          post.likes,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .apply(fontSizeFactor: 0.9),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        const Icon(
                          CupertinoIcons.clock,
                          color: primaryTextColor,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          post.time,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .apply(fontSizeFactor: 0.9),
                        ),
                        Expanded(
                            child: Container(
                          alignment: Alignment.centerRight,
                          margin: const EdgeInsets.only(right: 16),
                          child: Icon(
                            post.isBookmarked
                                ? CupertinoIcons.bookmark_fill
                                : CupertinoIcons.bookmark,
                            size: 16,
                          ),
                        ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
