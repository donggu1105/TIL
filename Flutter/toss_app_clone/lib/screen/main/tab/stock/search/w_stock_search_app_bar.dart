import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:fast_app_base/common/widget/w_text_field_with_delete.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class StockSearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController controller;
  const StockSearchAppBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Tap(
              onTap: () => Nav.pop(context),
              child: SizedBox(
                width: 56,
                height: kToolbarHeight,
                child: const Arrow(
                  direction: AxisDirection.left,
                ),
              )),
          Expanded(
            child: TextFieldWithDelete(controller: controller,),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
