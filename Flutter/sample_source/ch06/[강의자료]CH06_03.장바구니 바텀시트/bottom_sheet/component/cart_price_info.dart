import 'package:flutter/material.dart';

import '../../../../../core/theme/custom/custom_font_weight.dart';
import '../../../../../core/theme/custom/custom_theme.dart';

class CartPriceInfo extends StatelessWidget {
  const CartPriceInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 12),
          const Divider(thickness: 1),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                decoration: BoxDecoration(
                  color: Color(0xFFF5C142),
                  borderRadius: BorderRadius.all(Radius.circular(9)),
                ),
                child: Text(
                  '적립',
                  style: textTheme.labelSmall.semiBold
                      ?.copyWith(color: colorScheme.background),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '로그인 후, 할인 및 적립 혜택 적용',
                style: textTheme.labelMedium
                    ?.copyWith(color: colorScheme.contentSecondary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
