import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';

class NewsCard extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? source;
  final String? content;
  final VoidCallback? onTap;

  const NewsCard({
    super.key,
    this.imageUrl,
    this.title,
    this.source,
    this.content,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle? titleSmallStyle = Theme.of(context).textTheme.titleSmall;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl ??
                  'https://cdn.pixabay.com/photo/2015/03/12/12/43/test-670091_640.png',
              fit: BoxFit.fill,
              height: 200,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              source ?? 'No Source available.',
              style:
                  titleSmallStyle?.copyWith(fontSize: 10, color: AppTheme.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              title ?? 'No Title available.',
              style: titleSmallStyle?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          if (content != null)
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                content ?? 'No description available.',
                style: titleSmallStyle?.copyWith(
                    fontSize: 10, color: AppTheme.grey),
              ),
            ),
        ],
      ),
    );
  }
}
