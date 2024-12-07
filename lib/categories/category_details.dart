// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:news_app/api/api_service.dart';
import 'package:news_app/drawer/category_details_screen_drawer.dart';
import 'package:news_app/models/sources_response/source.dart';
import 'package:news_app/tabs/source_tabs.dart';
import 'package:news_app/widgets/error_indicator.dart';
import 'package:news_app/widgets/loading_indicator.dart';
import 'package:news_app/news/news_search_delegate.dart'; // Import the search delegate

class CategorieDetailsScreen extends StatefulWidget {
  final String categoryId;
  final String categoryTitle;
  static const String routName = '/categorydetails';

  const CategorieDetailsScreen(
      {super.key, required this.categoryId, required this.categoryTitle});

  @override
  _CategorieDetailsScreenState createState() => _CategorieDetailsScreenState();
}

class _CategorieDetailsScreenState extends State<CategorieDetailsScreen> {
  final bool _isSearching = false;
  String? _selectedSourceId;

  void _resetSourceSelection() {
    setState(() {
      _selectedSourceId = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CategoryDetailsScreenDrawer(),
      appBar: AppBar(
        toolbarHeight: 100,
        title: _isSearching
            ? Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    hintText: 'Search News',
                    hintStyle: TextStyle(color: Colors.black54),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
              )
            : Text(
                widget.categoryTitle,
                style: TextStyle(color: Colors.white),
              ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              _resetSourceSelection();
              showSearch(
                context: context,
                delegate: NewsSearchDelegate(),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: APIService.getSources(widget.categoryId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingIndicator();
          } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
            return const ErrorIndicator();
          } else {
            final sources = snapshot.data?.sources as List<Source>;
            return Row(
              children: [
                Expanded(
                  child: SourceTabs(
                    sources,
                    selectedSourceId: _selectedSourceId,
                    onSourceSelected: (sourceId) {
                      setState(() {
                        _selectedSourceId = sourceId;
                      });
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
