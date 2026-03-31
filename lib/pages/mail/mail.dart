import 'package:flutter/material.dart';
import 'contact_commisson.dart';
import 'contact_departement.dart';
import 'inbox.dart';
import '../bottom_navbar.dart';

class Mail extends StatelessWidget {
  const Mail({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    return Scaffold(
      backgroundColor: theme.colorScheme.onSurface,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        title: Text("Mail",style: TextStyle(color: primary,fontWeight: FontWeight.bold)),
        leading:
          IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: primary),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      BottomNavBar(),
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
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(right: 10,left: 10),
        child: Column(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      _buildMenuItem("Message Inbox", onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Messageinbox()),
                          );
                      }),
                      const Divider(height: 1, thickness: 1, indent: 10, endIndent: 10,color: Color.fromRGBO(51, 51, 51, 0.4),),
                      _buildMenuItem("Contact Commission", onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ContactCommisson()),
                          );
                      }),
                      const Divider(height: 1, thickness: 1, indent: 10, endIndent: 10,color: Color.fromRGBO(51, 51, 51, 0.4),),
                      _buildMenuItem("Contact Department", onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ContactDepartement()),
                          );
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }

  Widget _buildMenuItem(String title, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(15, 115, 120, 1), // Dark teal color from image
          ),
        ),
      ),
    );
  }

}
