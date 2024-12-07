import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/homescreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreenDrawer extends StatelessWidget {
  const SettingsScreenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppTheme.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(55),
                bottomRight: Radius.circular(55),
              ),
            ),
            child: Center(
              child: Text(
                AppLocalizations.of(context)!.settings,
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
              color: AppTheme.black,
            ),
            title: Text(
              AppLocalizations.of(context)!.categories,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold, color: AppTheme.black),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              size: 40,
              color: AppTheme.black,
            ),
            title: Text(
              AppLocalizations.of(context)!.settings,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold, color: AppTheme.black),
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
