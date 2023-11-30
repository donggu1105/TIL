import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

import '../../../../common/widget/w_arrow.dart';

class PointButton extends StatelessWidget {
  final int point;

  const PointButton({super.key, required this.point});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        "내 포인트".text.color(context.appColors.lessImportantText).make(),
        const EmptyExpanded(),
        "$point 원".text.bold.size(18).make(),
        width10,
        Arrow(color: context.appColors.lessImportant),


      ],
    );
  }
}
