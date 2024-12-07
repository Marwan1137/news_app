import 'package:flutter/material.dart';

import 'package:news_app/models/news_response/news.dart';
import 'package:news_app/widgets/news_card.dart'; // Import the NewsCard widget
import 'news_detail_screen.dart';

class NewsItem extends StatelessWidget {
  const NewsItem(this.news, {super.key});

  final News news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
      child: NewsCard(
        imageUrl: news.urlToImage,
        title: news.title,
        source: news.source?.name,
        content: '',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewsDetailScreen(news: news),
            ),
          );
        },
      ),
    );
  }
}
