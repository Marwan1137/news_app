// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:news_app/models/sources_response/source.dart';
import 'package:news_app/news/news_list.dart';
import 'package:news_app/tabs/tab_item.dart';

class SourceTabs extends StatefulWidget {
  final List<Source> sources;

  const SourceTabs(this.sources,
      {super.key,
      String? selectedSourceId,
      required Null Function(dynamic sourceId) onSourceSelected});

  @override
  State<SourceTabs> createState() => _SourceTabsState();
}

class _SourceTabsState extends State<SourceTabs> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        DefaultTabController(
          length: widget.sources.length,
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              dividerColor: Colors.transparent,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              indicatorColor: Colors.transparent,
              labelPadding: EdgeInsets.symmetric(horizontal: 10),
              isScrollable: true,
              tabs: widget.sources
                  .map(
                    (source) => TabItem(
                      sourceName: source.name!,
                      isSelected:
                          widget.sources.indexOf(source) == currentIndex,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: NewsList(widget.sources[currentIndex].id!),
        ),
      ],
    );
  }
}
