// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';

class TabItem extends StatelessWidget {
  TabItem({super.key, required this.sourceName, required this.isSelected});

  String sourceName;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85,
      height: 40,
      decoration: BoxDecoration(
          color: isSelected ? appTheme.primary : appTheme.white,
          border: Border.all(color: appTheme.primary),
          borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Text(
          sourceName,
          style: TextStyle(
            color: isSelected ? appTheme.white : appTheme.primary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
