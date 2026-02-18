import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_code/language/core/localization/app_localizations.dart';
import 'package:test_code/language/core/localization/language_controller.dart';
import 'package:test_code/language/core/localization/supported_locales.dart';
import 'package:test_code/language/ui/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageController>(
      builder: (context, lang, _) {
        return MaterialApp(
          locale: lang.locale,
          supportedLocales: supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomeScreen(),
        );
      },
    );
  }
}
