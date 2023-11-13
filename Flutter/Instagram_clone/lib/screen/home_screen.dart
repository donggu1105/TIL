import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const StoryArea(),
          FeedList(),
        ],
      ),
    );
  }
}

class StoryArea extends StatelessWidget {
  const StoryArea({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
          List.generate(10, (index) => UserStory(userName: "userName $index", imageUrl: "assets/images/my_image.png",))
        )
    );
  }
}

class UserStory extends StatelessWidget {
  final String userName;
  final String imageUrl;
  const UserStory({
    required this.userName,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/test.jpeg"),
                fit: BoxFit.cover,
              ),
              color: Colors.red,
              borderRadius: BorderRadius.circular(39),
            ),
          ),
          Text(userName),
        ],
      ),

    );
  }
}

class FeedData {

  final String userName;
  final int likeCount;
  final String content;

  FeedData({
    required this.userName,
    required this.likeCount,
    required this.content,
  });
}

final feedDataList = [
  FeedData(userName: 'User1', likeCount: 50, content: '오늘 점심은 맛있었다.'),
  FeedData(userName: 'User2', likeCount: 24, content: '오늘 아침은 맛있었다.'),
  FeedData(userName: 'User3', likeCount: 82, content: '오늘 저녁은 맛있었다.'),
  FeedData(userName: 'User4', likeCount: 92, content: '어제 점심은 맛있었다.'),
  FeedData(userName: 'User5', likeCount: 43, content: '어제 아침은 맛있었다.'),
  FeedData(userName: 'User6', likeCount: 72, content: '어제 저녁은 맛있었다.'),
  FeedData(userName: 'User7', likeCount: 3, content: '오늘 점심은 맛있었다.'),
  FeedData(userName: 'User8', likeCount: 0, content: '오늘 점심은 맛있었다.'),
  FeedData(userName: 'User9', likeCount: 24, content: '오늘 점심은 맛있었다.'),
];

class FeedList extends StatelessWidget {
  const FeedList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: feedDataList.length,
        itemBuilder: (context, index) => FeedItem(feedData: feedDataList[index]));
  }
}

class FeedItem extends StatelessWidget {
  final FeedData feedData;
  const FeedItem({required this.feedData, super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

