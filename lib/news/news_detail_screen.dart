import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/models/news_response/news.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailScreen extends StatelessWidget {
  final News news;

  const NewsDetailScreen({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    TextStyle? titleSmallStyle = Theme.of(context).textTheme.titleSmall;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(
          news.title ?? 'News Detail',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/background.png',
              fit: BoxFit.cover,
            ),
          ),

          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                      news.urlToImage ??
                          'https://cdn.pixabay.com/photo/2015/03/12/12/43/test-670091_640.png',
                      fit: BoxFit.cover,
                      height: 250,
                      width: double.infinity,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        news.source?.name ?? 'No Source available.',
                        style: titleSmallStyle?.copyWith(
                            fontSize: 10, color: AppTheme.grey),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        news.title ?? 'No Title available.',
                        style: titleSmallStyle?.copyWith(
                            fontSize: 13, color: AppTheme.black),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    news.content ?? 'No description available.',
                    style: titleSmallStyle?.copyWith(
                        fontSize: 30, color: AppTheme.grey),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: () async {
          final url = news.url;
          if (await canLaunchUrl(Uri.parse(url!))) {
            await launchUrl(Uri.parse(url));
          } else {
            throw 'Could not launch $url';
          }
        },
        label: const Text('View Full Article',
            style: TextStyle(color: Colors.black)),
        icon: const Icon(Icons.article, color: Colors.black),
      ),
    );
  }
}
