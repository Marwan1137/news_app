import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/homescreen.dart';

class SettingsScreenDrawer extends StatelessWidget {
  const SettingsScreenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: appTheme.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(55),
                bottomRight: Radius.circular(55),
              ),
            ),
            child: Center(
              child: Text(
                'News App!',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.menu_outlined,
              size: 40,
              color: appTheme.black,
            ),
            title: Text(
              'Categories',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold, color: appTheme.black),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              size: 40,
              color: appTheme.black,
            ),
            title: Text(
              'Settings',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold, color: appTheme.black),
            ),
            onTap: () {
              // Navigator.pushNamed(context, SettingsScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}
