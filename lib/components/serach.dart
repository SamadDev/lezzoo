import 'package:flutter/material.dart';
import 'package:lezzoo_assignment/components/Theme.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: AppTheme.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(8)),
        height: 45,
        child: TextField(

            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              enabled: false,
              disabledBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: colorTheme(context).dividerColor)),
              contentPadding: EdgeInsets.only(top: 7, right: 7),
              hintText: 'گەران...',
              hintStyle: Theme.of(context).textTheme.subtitle2,
              prefixIcon: Icon(
                Icons.search,
                size: 30,
                color: AppTheme.primaryColor,
              ),
            )));
  }
}