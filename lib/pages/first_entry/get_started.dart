import 'package:flutter/material.dart';
import 'package:hiveflow/pages/login_service/login.dart';

import 'package:provider/provider.dart';
import '../../themes/theme_provider.dart';

class Getstarted extends StatefulWidget {
  const Getstarted({super.key});

  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<Getstarted> {
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: themeProvider.themeData.colorScheme.onSurface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [

              // Top Spacer
              const Spacer(flex: 2),

              // Logo Centered
              Image.asset(
                'assets/logo/icesco_logo.png',
                width: 200,
                height: 200,
              ),

              const Spacer(flex: 2),

              // Text Section
              Column(
                children: [
                  Text(
                    'Go and enjoy our features and make your',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: themeProvider.themeData.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'life easy with us.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: themeProvider.themeData.colorScheme.primary,
                    ),
                  ),
                ],
              ),

              const Spacer(flex: 1),

              // Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HiveflowLoginPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  Theme.of(context).colorScheme.primary, // Button color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 6
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Let’s Start",
                        style: TextStyle(
                          fontSize: 18,
                          color: themeProvider
                              .themeData.colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 30),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: themeProvider
                            .themeData.colorScheme.onSurface,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}