import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_code/auth_node/services/auth_services.dart';
import 'package:test_code/language/core/localization/app_localizations.dart';
import 'package:test_code/language/core/localization/language_controller.dart';
import 'package:test_code/language/core/localization/supported_locales.dart';
import 'package:test_code/language/ui/settings_screen.dart';

import '../../auth_node/providers/user_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void signOutUser(BuildContext context) {
    AuthService().signOut(context);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(user.id),
          Text(user.email),
          Text(user.name),
          ElevatedButton(
            onPressed: () => signOutUser(context),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.blue),
              textStyle: WidgetStateProperty.all(
                const TextStyle(color: Colors.white),
              ),
              minimumSize: WidgetStateProperty.all(
                Size(MediaQuery.of(context).size.width / 2.5, 50),
              ),
            ),
            child: const Text(
              "Sign Out",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

// ==================
//   @override
//   Widget build(BuildContext context) {
//     final t = AppLocalizations.of(context)!;
//     final langController = context.watch<LanguageController>();
//     bool isLoading = true;

//     return Scaffold(
//       appBar: AppBar(title: Text(t.app_title)),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child:
//             // isLoading
//             //     ? Center(
//             //         child: Column(
//             //           mainAxisAlignment: MainAxisAlignment.center,
//             //           children: [
//             //             Text(
//             //               t.loading,
//             //               style: const TextStyle(
//             //                 fontSize: 20,
//             //                 fontWeight: FontWeight.bold,
//             //               ),
//             //             ),
//             //             const SizedBox(height: 20),
//             //             const CircularProgressIndicator(),
//             //           ],
//             //         ),
//             //       )
//             //     :
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [Colors.blue.shade50, Colors.blue.shade100],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     ),
//                     borderRadius: BorderRadius.circular(16),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.3),
//                         blurRadius: 10,
//                         offset: const Offset(0, 5),
//                       ),
//                     ],
//                   ),
//                   child: Text(
//                     t.hello,
//                     style: Theme.of(context).textTheme.headlineMedium?.copyWith(
//                       color: Colors.blue.shade800,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Card(
//                   elevation: 4,
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       children: [
//                         Text('Hello my name is ${t.name}'),
//                         Text(
//                           t.login,
//                           style: Theme.of(context).textTheme.titleLarge
//                               ?.copyWith(fontWeight: FontWeight.bold),
//                           textAlign: TextAlign.center,
//                         ),
//                         Text(
//                           t.welcome,
//                           style: Theme.of(context).textTheme.titleLarge
//                               ?.copyWith(fontWeight: FontWeight.bold),
//                           textAlign: TextAlign.center,
//                         ),
//                         const SizedBox(height: 15),
//                         Text(
//                           t.description,
//                           style: Theme.of(context).textTheme.bodyMedium,
//                           textAlign: TextAlign.center,
//                         ),
//                         const SizedBox(height: 15),
//                         Text(
//                           '${t.language}: ${localeNames[langController.locale.languageCode]}',
//                           style: Theme.of(context).textTheme.bodyLarge,
//                         ),
//                         const SizedBox(height: 10),
//                         Text(
//                           'Language Code: ${langController.locale.languageCode}',
//                           style: Theme.of(context).textTheme.bodySmall
//                               ?.copyWith(color: Colors.grey.shade600),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const SettingsScreen(),
//                       ),
//                     );
//                   },
//                   icon: const Icon(Icons.language),
//                   label: Text(t.settings),
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 32,
//                       vertical: 16,
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//       ),
//     );
//   }
// }
