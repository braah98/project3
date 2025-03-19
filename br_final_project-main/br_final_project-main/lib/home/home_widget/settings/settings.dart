// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/language_provider.dart';
import '../../../providers/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context); // مطلوب إعداد Provider
    final langProvider = Provider.of<LanguageProvider>(context); // مطلوب إعداد Provider

    return Scaffold(
      appBar: AppBar(title: const Text('الإعدادات')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchListTile(
              title: const Text('الوضع الليلي'),
              value: themeProvider.isDarkMode,
              onChanged: (value) => themeProvider.toggleTheme(value),
            ),
            const Divider(),
            ListTile(
              title: const Text('اللغة'),
              trailing: DropdownButton<String>(
                value: langProvider.currentLanguage,
                items: const [
                  DropdownMenuItem(value: 'ar', child: Text('العربية')),
                  DropdownMenuItem(value: 'en', child: Text('الإنجليزية')),
                ],
                onChanged: (value) => langProvider.changeLanguage(value!),
              ),
            ),
          ],
        ),
      ),
    );
  }
}