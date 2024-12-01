import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/drawer/settings_screen_drawer.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = '/settings';

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SettingsScreenDrawer(),
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                width: 350,
                child: Text(
                  'Language',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: appTheme.black,
                      ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(color: appTheme.primary),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButton(
                  padding: const EdgeInsets.only(left: 10),
                  value: 'English',
                  isExpanded: true,
                  items: const [
                    DropdownMenuItem(
                      value: 'English',
                      child: Text('English'),
                    ),
                    DropdownMenuItem(
                      value: 'العربية',
                      child: Text('العربية'),
                    )
                  ],
                  onChanged: (_) {},
                  focusColor: appTheme.black,
                  underline: const SizedBox(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
