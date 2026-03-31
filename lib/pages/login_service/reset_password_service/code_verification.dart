import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'create_new_password.dart';
import 'forgot_password.dart';

class VerificationCodePage extends StatefulWidget {
  final String email;

  const VerificationCodePage({super.key, required this.email});

  @override
  State<VerificationCodePage> createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes =
      List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _handleKeyEvent(RawKeyEvent event, int index) {
    if (event is RawKeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.backspace &&
          _controllers[index].text.isEmpty &&
          index > 0) {
        _focusNodes[index - 1].requestFocus();
      }
    }
  }

  void _checkIfAllFieldsFilled() {
    final code = _controllers.map((c) => c.text).join();

    if (code.length == 4) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              CreateNewPassword(email: widget.email),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),

              Text(
                'Verification Code',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              const SizedBox(height: 16),

              Text(
                'Please enter the verification code sent to your email.',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              const SizedBox(height: 32),

              /// OTP Fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Center(
                      child: RawKeyboardListener(
                        focusNode: FocusNode(),
                        onKey: (event) =>
                            _handleKeyEvent(event, index),
                        child: TextField(
                          controller: _controllers[index],
                          focusNode: _focusNodes[index],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                          ),
                          maxLength: 1,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            counterText: '',
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty && index < 3) {
                              _focusNodes[index + 1].requestFocus();
                            } else if (value.isEmpty && index > 0) {
                              _focusNodes[index - 1].requestFocus();
                            }

                            _checkIfAllFieldsFilled();
                          },
                        ),
                      ),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 20),

              /// Resend button (UI only)
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          "Verification code resent to ${widget.email}"),
                    ),
                  );
                },
                child: const Text(
                  "Resend code",
                  style:
                      TextStyle(color: Colors.lightBlue, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
