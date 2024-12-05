import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/drawer/settings_screen_drawer.dart';
import 'package:news_app/locale_provider.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = '/settings';

  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Locale _locale = const Locale('en', ''); // Default to English

  void _changeLanguage(Locale locale) {
    setState(() {
      _locale = locale; // Update the locale
    });
    // Notify the app to rebuild with the new locale
    Provider.of<LocaleProvider>(context, listen: false).setLocale(_locale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SettingsScreenDrawer(),
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(
          AppLocalizations.of(context)!.settings,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 25),
        ),
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
                  AppLocalizations.of(context)!.language,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppTheme.black,
                      ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.primary),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButton<Locale>(
                  value: Provider.of<LocaleProvider>(context).locale,
                  onChanged: (Locale? newLocale) {
                    if (newLocale != null) {
                      _changeLanguage(
                          newLocale); // Call the method to change language
                    }
                  },
                  items: const [
                    DropdownMenuItem(
                      value: Locale('en', ''),
                      child: Text('English'),
                    ),
                    DropdownMenuItem(
                      value: Locale('ar', ''),
                      child: Text('العربية'),
                    ),
                  ],
                  focusColor: AppTheme.black,
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
