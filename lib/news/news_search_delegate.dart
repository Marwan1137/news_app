import 'package:flutter/material.dart';
import 'package:news_app/models/news_response/news.dart';
import 'package:news_app/api/api_service.dart';
import 'package:news_app/models/news_response/news_response.dart';
import 'news_detail_screen.dart';

class NewsSearchDelegate extends SearchDelegate<News?> {
  @override
  String get searchFieldLabel => 'Search News';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: APIService.searchNews(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData ||
            snapshot.data?.news == null ||
            snapshot.data!.news!.isEmpty) {
          return const Center(child: Text('No results found.'));
        } else {
          final newsList = snapshot.data!.news!;
          return ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (context, index) {
              final newsItem = newsList[index];
              return ListTile(
                title: Text(newsItem.title ?? 'No Title'),
                subtitle: Text(newsItem.description ?? 'No Description'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsDetailScreen(news: newsItem),
                    ),
                  );
                },
              );
            },
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(); // You can implement suggestions if needed
  }

  Widget buildSearchField(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: searchFieldLabel,
          hintStyle: TextStyle(color: Colors.black54),
          border: InputBorder.none,
        ),
        onChanged: (value) {
          query = value;
        },
      ),
    );
  }
}
