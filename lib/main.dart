import 'package:flutter/material.dart';
import 'package:hiveflow/pages/first_entry/splash_screen.dart';
import 'themes/theme_provider.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ],

    child: const MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            home: const SplashScreen(),

            debugShowCheckedModeBanner: false,
            theme: themeProvider.themeData,
          );
        }
    );
  }
}



