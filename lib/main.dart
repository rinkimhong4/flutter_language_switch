import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_code/app.dart';
import 'package:test_code/auth_node/providers/user_provider.dart';
import 'package:test_code/fetch_api/controllers/product_controller.dart';
import 'package:test_code/fetch_api/core/network/api_client.dart';
import 'package:test_code/language/core/localization/language_controller.dart';

/// This for language controller when
/// add new language to app dont forget to run
/// "flutter gen-l10n"
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        // Auth
        // ChangeNotifierProvider(create: (_) => UserProvider()),
        // language
        // ChangeNotifierProvider(create: (_) => LanguageController()),
        // api client
        Provider(create: (_) => ApiClient()),
        ChangeNotifierProvider(
          create: (context) => ProductController(context.read<ApiClient>()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
