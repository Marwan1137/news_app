import 'package:flutter/material.dart';
import 'package:news_app/models/news_response/news.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  final List<News> newsData; // List of news articles to search from

  CustomSearchDelegate(this.newsData);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = newsData.where((news) {
      final sourceName = news.source?.name?.toLowerCase() ?? '';
      final title = news.title?.toLowerCase() ?? '';
      final description = news.description?.toLowerCase() ?? '';
      final content = news.content?.toLowerCase() ?? '';

      return sourceName.contains(query.toLowerCase()) ||
          title.contains(query.toLowerCase()) ||
          description.contains(query.toLowerCase()) ||
          content.contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index].title ?? ''),
          subtitle: Text(results[index].description ?? ''),
          onTap: () {
            close(
                context,
                results[index].url ??
                    ''); // Return the URL of the selected news
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = newsData.where((news) {
      final sourceName = news.source?.name?.toLowerCase() ?? '';
      final title = news.title?.toLowerCase() ?? '';
      final description = news.description?.toLowerCase() ?? '';
      final content = news.content?.toLowerCase() ?? '';

      return sourceName.contains(query.toUpperCase()) ||
          title.contains(query.toLowerCase()) ||
          description.contains(query.toLowerCase()) ||
          content.contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index].title ?? ''),
          subtitle: Text(suggestions[index].description ?? ''),
          onTap: () {
            query = suggestions[index].title ??
                ''; // Update the query with the selected suggestion
            showResults(context); // Show results
          },
        );
      },
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.grey), // Change hint text color
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey), // Change underline color
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: Colors.blue), // Change focused underline color
        ),
      ),
    );
  }
}
