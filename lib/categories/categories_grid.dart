// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/categories/category_item.dart';
import 'package:news_app/categories/category_details.dart';
import 'package:news_app/models/category_model.dart';

class categoriesGrid extends StatelessWidget {
  const categoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> categories = [
      const CategoryModel(
        id: '1',
        name: 'Sports',
        imageName: 'assets/ball.png',
        color: appTheme.red,
      ),
      const CategoryModel(
        id: '2',
        name: 'Politics',
        imageName: 'assets/Politics.png',
        color: appTheme.blue,
      ),
      const CategoryModel(
        id: '3',
        name: 'Health',
        imageName: 'assets/health.png',
        color: appTheme.pink,
      ),
      const CategoryModel(
        id: '4',
        name: 'Business',
        imageName: 'assets/business.png',
        color: appTheme.yellowishBrown,
      ),
      const CategoryModel(
        id: '5',
        name: 'Environment',
        imageName: 'assets/environment.png',
        color: appTheme.babyblue,
      ),
      const CategoryModel(
        id: '6',
        name: 'Science',
        imageName: 'assets/science.png',
        color: appTheme.yellow,
      ),
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pick Your category of interest',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: appTheme.navy),
        ),
        const SizedBox(
          height: 40,
        ),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  CategorieDetailsScreen.routName,
                  arguments: categories[index].name,
                );
              },
              child: CategoryItem(
                title: categories[index].name,
                backgroundColor: categories[index].color,
                iconPath: categories[index].imageName,
                index: index,
              ),
            );
          },
        ),
      ],
    );
  }
}
