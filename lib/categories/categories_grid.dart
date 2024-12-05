// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/categories/category_item.dart';
import 'package:news_app/categories/category_details.dart';
import 'package:news_app/models/category_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class categoriesGrid extends StatelessWidget {
  const categoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> getCategories(BuildContext context) {
      return [
        CategoryModel(
          id: 'sports',
          name: AppLocalizations.of(context)!.sports,
          imageName: 'assets/ball.png',
          color: AppTheme.red,
        ),
        CategoryModel(
          id: 'technology',
          name: AppLocalizations.of(context)!.technology,
          imageName: 'assets/technology2.png',
          color: AppTheme.blue,
        ),
        CategoryModel(
          id: 'health',
          name: AppLocalizations.of(context)!.health,
          imageName: 'assets/health.png',
          color: AppTheme.pink,
        ),
        CategoryModel(
          id: 'business',
          name: AppLocalizations.of(context)!.business,
          imageName: 'assets/business.png',
          color: AppTheme.yellowishbrown,
        ),
        CategoryModel(
          id: 'entertainment',
          name: AppLocalizations.of(context)!.entertainment,
          imageName: 'assets/entertainment.png',
          color: AppTheme.babyblue,
        ),
        CategoryModel(
          id: 'science',
          name: AppLocalizations.of(context)!.science,
          imageName: 'assets/science.png',
          color: AppTheme.yellow,
        ),
      ];
    }

    final List<CategoryModel> categories = getCategories(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.pickYourCategory,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: AppTheme.navy),
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
                  arguments: {
                    'categoryId': categories[index].id,
                    'categoryTitle': categories[index].name,
                  },
                );
              },
              child: CategoryItem(
                id: categories[index].id,
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
