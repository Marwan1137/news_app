import 'package:flutter/material.dart';
import 'package:news_app/categories/categories_grid.dart';
import 'package:news_app/drawer/home_screen_drawer.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeScreenDrawer(),
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(
          'News App',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 25),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: categoriesGrid(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
