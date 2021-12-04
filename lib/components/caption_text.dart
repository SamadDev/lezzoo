import 'package:flutter/material.dart';
class CaptionText extends StatelessWidget {
  final text;
  final function;

  CaptionText({this.text, this.function});

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 10, right: 13, left: 10),
      child: Row(
        children: [
          Text(text),
          Spacer(),
          Text(
            'هەموو',
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}