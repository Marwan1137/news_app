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
      height: 40,
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.primary : AppTheme.white,
        border: Border.all(color: AppTheme.primary),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Center(
          child: Text(
            sourceName,
            style: TextStyle(
              color: isSelected ? AppTheme.white : AppTheme.primary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
