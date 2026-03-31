import 'package:flutter/material.dart';
import 'package:hiveflow/pages/login_service/login.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'get_started.dart';
import '../../themes/theme_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextPage();
  }

  Future<void> _navigateToNextPage() async {
    await Future.delayed(const Duration(milliseconds: 1500));

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasSeenGetStarted = prefs.getBool('hasSeenGetStarted') ?? false;

    if (hasSeenGetStarted) {
        // User is not logged in, navigate to login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HiveflowLoginPage()),
        );
      }
     else {
      // First-time user, navigate to Get Started screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Getstarted()),
      );

      prefs.setBool('hasSeenGetStarted', true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.themeData.colorScheme.onSurface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Image.asset(
                 'assets/logo/icesco_logo.png',
                height: 250,
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}