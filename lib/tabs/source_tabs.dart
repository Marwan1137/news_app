// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:news_app/models/source.dart';
import 'package:news_app/news/news_list.dart';
import 'package:news_app/tabs/tab_item.dart';

class SourceTabs extends StatefulWidget {
  final List<Source> sources;

  const SourceTabs(this.sources, {super.key});

  @override
  State<SourceTabs> createState() => _SourceTabsState();
}

class _SourceTabsState extends State<SourceTabs> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(height: 10),
          DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              indicatorColor: Colors.transparent,
              isScrollable: true,
              tabs: widget.sources
                  .map(
                    (source) => TabItem(
                      sourceName: source.name,
                      isSelected:
                          widget.sources.indexOf(source) == currentIndex,
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(height: 10),
          const Expanded(
            // Use Expanded instead of Flexible for clearer behavior
            child: NewsList(),
          ),
        ],
      ),
    );
  }
}
