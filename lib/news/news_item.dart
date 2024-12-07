import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/widgets/loading_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  const NewsItem({super.key});

  @override
  Widget build(BuildContext context) {
    final fifteenAgo = DateTime.now().subtract(const Duration(minutes: 30));

    TextStyle? titleSmallStyle = Theme.of(context).textTheme.titleSmall;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              imageUrl:
                  'https://cdn.pixabay.com/photo/2015/03/12/12/43/test-670091_640.png',
              height: MediaQuery.sizeOf(context).height * 0.25,
              width: double.infinity,
              fit: BoxFit.fill,
              placeholder: (_, __) => const LoadingIndicator(),
              errorWidget: (_, __, error) =>
                  const Icon(Icons.image_not_supported_outlined),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'BBC News',
            style:
                titleSmallStyle?.copyWith(fontSize: 10, color: appTheme.grey),
          ),
          const SizedBox(height: 4),
          Text(
            "Why are football's biggest clubs starting a new  tournament?",
            style: titleSmallStyle?.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 2),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              timeago.format(fifteenAgo),
              style: titleSmallStyle?.copyWith(
                fontSize: 13,
                color: appTheme.grey,
              ),
            ),
          )
        ],
      ),
    );
  }
}
