import 'package:flutter/material.dart';
import '../bottom_navbar.dart';
import 'reset_password_service/forgot_password.dart';

class HiveflowLoginPage extends StatefulWidget {
  const HiveflowLoginPage({super.key});

  @override State<HiveflowLoginPage> createState() => _HiveflowLoginPageState();
}

class _HiveflowLoginPageState extends State<HiveflowLoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool rememberMe = false;

  @override void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        body: LayoutBuilder(
            builder: (context, constraints) {
          return SingleChildScrollView(
              child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                      child: Stack(
                          clipBehavior: Clip.none,
                        children: [
                            // Top background
                          SizedBox(
                            height: size.height * 0.3,
                            child: Center(
                              child: Image.asset(
                                'assets/logo/icesco_logo.png',
                                height: size.height * 0.2,
                              ),
                            ),
                          ),
                      // Login Card
                      Positioned(
                        top: 275,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Form( key: _formKey,
                            child: Column(
                              children: [
                                const SizedBox(height: 25),
                                _buildLoginCard(),
                              ],
                            ),
                          ),
                        ),
                      ),
                        ],
                      ),
                  ),
              ),
          );
          },
        ),
    );
  }
  Widget _buildLoginCard() {
    return Container(
        transform: Matrix4.translationValues(0, -30, 0),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
          color: Color.fromRGBO(59, 59, 59, 1.0),
          borderRadius: BorderRadius.circular(25), ),
        child: Column(
    children: [
      const SizedBox(height: 20),
        Text( "Log in ",
          style: TextStyle(
            fontSize:40,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 50),
        // Email
        TextFormField(
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromRGBO(52, 52, 52, 1),
            labelText: 'Email',
            labelStyle: const TextStyle(color: Colors.white),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
            ),
            focusedBorder: OutlineInputBorder( borderSide: BorderSide(color: Theme.of(context).colorScheme.primary,
            ),
            ),
          ),
        ), const SizedBox(height: 40),
        // Password
        TextFormField(
          style: const TextStyle(color: Colors.white),
          obscureText: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromRGBO(52, 52, 52, 1),
            labelText: 'Password',
            labelStyle: const TextStyle(color: Colors.white),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
            ),
            focusedBorder: OutlineInputBorder( borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ),
        const SizedBox(height: 10),
         Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  ForgotPassword(),
                    ),
                  );},
               child: const Text("Forgot Password?"),
             ),
           ],
          ),
        const SizedBox(height: 20),
        // Login Button
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
              padding: const EdgeInsets.symmetric( horizontal: 80, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ), onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  BottomNavBar(initialIndex: 0),
            ),
          );
        },
          child: Text( 'Done',
            style: TextStyle( fontSize: 18, color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ), const SizedBox(height: 600),
    ],
        ),
    );
  }
}