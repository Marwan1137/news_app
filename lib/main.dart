import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'locale_provider.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/categories/category_details.dart';
import 'package:news_app/homescreen.dart';
import 'package:news_app/settings/settings_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      child: const NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      /* -------------------------------------------------------------------------- */
      /*                                   ROUTES                                   */
      /* -------------------------------------------------------------------------- */
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: context.read<LocaleProvider>().locale,
      routes: {
        /* ---------------------------- homescreen route ---------------------------- */
        HomeScreen.routeName: (_) => const HomeScreen(),
        /* -------------------------- Settings Screen ROUTE ------------------------- */
        SettingsScreen.routeName: (_) => const SettingsScreen(),
        /* ------------------- Categories Details Screen RoutName ------------------- */
        CategorieDetailsScreen.routName: (context) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          final categoryId = args['categoryId'] as String;
          final categoryTitle = args['categoryTitle'] as String;
          return CategorieDetailsScreen(
              categoryId: categoryId, categoryTitle: categoryTitle);
        },
      },
      initialRoute: HomeScreen.routeName,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}
