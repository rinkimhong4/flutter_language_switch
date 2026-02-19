import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_code/auth_node/providers/user_provider.dart';
import 'package:test_code/auth_node/services/auth_services.dart';
import 'package:test_code/auth_node/ui/auth_home_screen.dart';
import 'package:test_code/auth_node/ui/signup_screen.dart';
import 'package:test_code/fetch_api/views/screen/product_screen.dart';
import 'package:test_code/fetch_api/views/screen/splash_screen.dart';
import 'package:test_code/language/core/localization/app_localizations.dart';
import 'package:test_code/language/core/localization/language_controller.dart';
import 'package:test_code/language/core/localization/supported_locales.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    // authService.getUserData(context);

    // ✅ Wait until UI tree is ready
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   authService.getUserData(context);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const HomeScreen(),
      // home: const ProductScreen(),
      home: const SplashScreen(),
      // home: Provider.of<UserProvider>(context).user.token.isEmpty
      //     ? const SignupScreen()
      //     : const AuthHomeScreen(),
    );
    // return Consumer<LanguageController>(
    //   builder: (context, lang, _) {
    //     return MaterialApp(
    //       locale: lang.locale,
    //       supportedLocales: supportedLocales,
    //       localizationsDelegates: AppLocalizations.localizationsDelegates,
    //       theme: ThemeData(
    //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //         useMaterial3: true,
    //       ),
    //       // home: const HomeScreen(),
    //       home: const ProductScreen(),
    //       // home: Provider.of<UserProvider>(context).user.token.isEmpty
    //       //     ? const SignupScreen()
    //       //     : const AuthHomeScreen(),
    //     );
    //   },
    // );
  }
}
