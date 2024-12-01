// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:news_app/drawer/category_details_screen_drawer.dart';

class CategorieDetailsScreen extends StatelessWidget {
  final String categoryTitle;
  static const String routName = '/categorydetails';

  const CategorieDetailsScreen({super.key, required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CategoryDetailsScreenDrawer(),
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
    );
  }
}
