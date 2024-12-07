// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:news_app/drawer/category_details_screen_drawer.dart';
import 'package:news_app/models/source.dart';
import 'package:news_app/tabs/source_tabs.dart';

class CategorieDetailsScreen extends StatefulWidget {
  final String categoryTitle;
  static const String routName = '/categorydetails';

  const CategorieDetailsScreen({super.key, required this.categoryTitle});

  @override
  State<CategorieDetailsScreen> createState() => _CategorieDetailsScreenState();
}

class _CategorieDetailsScreenState extends State<CategorieDetailsScreen> {
  List<Source> sources = List.generate(
    15,
    (index) => Source(id: '$index', name: 'source $index'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CategoryDetailsScreenDrawer(),
      appBar: AppBar(
        title: Text(widget.categoryTitle),
      ),
      body: Column(
        children: [
          SourceTabs(sources),
        ],
      ),
    );
  }
}
