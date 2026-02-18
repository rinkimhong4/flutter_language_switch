import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_code/language/core/localization/app_localizations.dart';
import 'package:test_code/language/core/localization/language_controller.dart';
import 'package:test_code/language/core/localization/supported_locales.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final langController = context.watch<LanguageController>();

    return Scaffold(
      appBar: AppBar(title: Text(t.settings)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.language,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: supportedLocales.map((Locale locale) {
                  return ListTile(
                    title: Text(localeNames[locale.languageCode]!),
                    leading: Radio<Locale>(
                      value: locale,
                      groupValue: langController.locale,
                      onChanged: (Locale? newValue) {
                        if (newValue != null) {
                          context.read<LanguageController>().changeLanguage(
                            newValue,
                          );
                        }
                      },
                    ),
                    onTap: () {
                      context.read<LanguageController>().changeLanguage(locale);
                    },
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '${t.hello}, ${localeNames[langController.locale.languageCode]}!',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
