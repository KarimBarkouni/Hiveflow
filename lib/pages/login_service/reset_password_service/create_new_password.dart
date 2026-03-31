import 'package:flutter_svg/svg.dart';

import '../login.dart';
import 'package:flutter/material.dart';
import 'forgot_password.dart';

class CreateNewPassword extends StatefulWidget {
  final String email;

  const CreateNewPassword({super.key, required this.email});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onConfirmButtonPressed() {
    final newPassword = _newPasswordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    // Validation
    if (newPassword.isEmpty || confirmPassword.isEmpty) {
      _showSnack('Fields cannot be empty');
      return;
    }

    if (newPassword != confirmPassword) {
      _showSnack('Passwords do not match');
      return;
    }

    if (newPassword.length < 8) {
      _showSnack('Password must contain at least 8 characters');
      return;
    }

    final regex =
        RegExp(r'(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).{8,}');
    if (!regex.hasMatch(newPassword)) {
      _showSnack(
          'Password must contain one number, one lowercase, one uppercase and one special character');
      return;
    }

    // ✅ Directly show success modal (no backend)
    _showConfirmationModal(context);
  }

  void _showSnack(String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.white, // light background
      behavior: SnackBarBehavior.floating,
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}

  void _showConfirmationModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.06,
            vertical: MediaQuery.of(context).size.height * 0.02,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              SvgPicture.asset(
                'assets/icons/excellence.svg',
                width: 30,
                height: 30,
                color: Theme.of(context).colorScheme.primary,
              ),

              const SizedBox(height: 16),

              Text(
                'Success',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HiveflowLoginPage()),
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(vertical: 20),
                    backgroundColor:
                        Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new,
              color: Theme.of(context).colorScheme.primary),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    ForgotPassword(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  const begin = Offset(-1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.easeInOut;
                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);
                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
              ),
            );
          },
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screen.width * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screen.height * 0.05),

            Text(
              'Create new password',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

            SizedBox(height: screen.height * 0.02),

            Text(
              'Your new password must be different from those previously used.',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

            SizedBox(height: screen.height * 0.05),

            /// New Password
            TextField(
              controller: _newPasswordController,
              obscureText: _obscureNewPassword,
              style: TextStyle(color:  Theme.of(context).colorScheme.primary,),
              decoration: InputDecoration(
                labelText: 'Your new password',labelStyle: TextStyle(color:  Theme.of(context).colorScheme.primary,),
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureNewPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                        color:  Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureNewPassword =
                          !_obscureNewPassword;
                    });
                  },
                ),
              ),
            ),

            SizedBox(height: screen.height * 0.02),

            /// Confirm Password
            TextField(
              controller: _confirmPasswordController,
              obscureText: _obscureConfirmPassword,
              style: TextStyle(color:  Theme.of(context).colorScheme.primary,),
              decoration: InputDecoration(
                labelText: 'Confirm your password',labelStyle: TextStyle(color:  Theme.of(context).colorScheme.primary,),
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureConfirmPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                        color:  Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureConfirmPassword =
                          !_obscureConfirmPassword;
                    });
                  },
                ),
              ),
            ),

            SizedBox(height: screen.height * 0.05),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _onConfirmButtonPressed, 
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      vertical: screen.height * 0.02),
                  backgroundColor:
                      Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Proceed',
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context)
                        .colorScheme
                        .inversePrimary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
