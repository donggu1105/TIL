import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';
import 'package:fast_app_base/screen/notification/w_notification_item.dart';
import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';
import 'package:nav/enum/enum_nav_ani.dart';

class NotificationDialog extends DialogWidget {
  final List<TossNotification> notifications;

  NotificationDialog(this.notifications, {super.key, super.animation = NavAni.Bottom});

  @override
  DialogState<NotificationDialog> createState() => _NotificationDialogState();
}

class _NotificationDialogState extends DialogState<NotificationDialog> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        ...widget.notifications
            .map((e) => NotificationItemWidget(onTap: () {
              print("wow");


              // widget.hide();
        }, notification: e))
            .toList(),
      ],
      ),
    );
  }
}
