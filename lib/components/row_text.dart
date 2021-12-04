import 'package:flutter/material.dart';
import 'package:lezzoo_assignment/components/Theme.dart';

class RowText extends StatelessWidget {
  late final String text1;
  late final String text2;
  late final icon;

  RowText({required this.text1, required this.text2, required this.icon});

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "$text1",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(color: AppTheme.primaryColor),
          ),
          Text(
            text2,
            style:
                Theme.of(context).textTheme.bodyText2!.copyWith(color: AppTheme.primaryColor),
          ),
          Icon(
            icon,
            color: AppTheme.primaryColor,
          )
        ],
      ),
    );
  }
}
