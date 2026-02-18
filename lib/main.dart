import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_code/app.dart';
import 'package:test_code/language/core/localization/language_controller.dart';

// flutter gen-l10n
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (_) => LanguageController(),
      child: const MyApp(),
    ),
  );
}
