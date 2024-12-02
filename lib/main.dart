import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/categories/category_details.dart';
import 'package:news_app/homescreen.dart';
import 'package:news_app/settings/settings_screen.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      /* -------------------------------------------------------------------------- */
      /*                                   ROUTES                                   */
      /* -------------------------------------------------------------------------- */
      routes: {
        /* ---------------------------- homescreen route ---------------------------- */
        HomeScreen.routeName: (_) => const HomeScreen(),
        /* -------------------------- Settings Screen ROUTE ------------------------- */
        SettingsScreen.routeName: (_) => const SettingsScreen(),
        /* ------------------- Categories Details Screen RoutName ------------------- */
        CategorieDetailsScreen.routName: (context) {
          final categoryTitle =
              ModalRoute.of(context)!.settings.arguments as String;
          return CategorieDetailsScreen(categoryTitle: categoryTitle);
        },
      },
      initialRoute: HomeScreen.routeName,
      theme: appTheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}
