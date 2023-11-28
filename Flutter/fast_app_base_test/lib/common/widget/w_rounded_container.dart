import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double radius;
  final Color? backgroundColor;

  const RoundedContainer({required this.child,
    super.key,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    this.radius = 20,
    this.backgroundColor,

  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? context.appColors.buttonBackground,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: child,
    );
  }
}
