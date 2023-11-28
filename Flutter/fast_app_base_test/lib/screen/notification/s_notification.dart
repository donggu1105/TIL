import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/notification/notifications_dummy.dart';
import 'package:fast_app_base/screen/notification/w_notification_item.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: context.appColors.appBarBackground,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          title: "알림".text.size(20).bold.make(),
          backgroundColor: context.appColors.appBarBackground,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        SliverList(
      delegate: SliverChildBuilderDelegate((context,index) => NotificationItemWidget(notification: notificationDummies[index]),
      childCount: notificationDummies.length
      ),
        )
      ],),
    );
  }
}
