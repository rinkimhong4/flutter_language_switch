import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'product_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? _error;

  @override
  void initState() {
    super.initState();
    checkInternetAndNavigate();
  }

  /// Check internet and navigate immediately if connected
  Future<void> checkInternetAndNavigate() async {
    try {
      // Check network type first
      var connectivityResult = await Connectivity().checkConnectivity();

      // Then confirm real internet
      bool hasInternet =
          connectivityResult != ConnectivityResult.none &&
          await InternetConnectionChecker().hasConnection;

      if (hasInternet) {
        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const ProductScreen()),
        );
      } else {
        setState(() {
          _error = 'No internet connection';
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Error checking internet: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _error != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _error!,
                    style: const TextStyle(fontSize: 18, color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _error = null;
                      });
                      checkInternetAndNavigate();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              )
            : const CircularProgressIndicator(), // Spinner while checking internet
      ),
    );
  }
}
