import 'package:flutter/material.dart';
import '../capacity_building.dart';


class LearningSprint extends StatelessWidget {
  const LearningSprint({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    return Scaffold(
      backgroundColor: theme.colorScheme.onSurface,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        leading:
          IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: primary),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                    CapacityBuilding(),
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
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Learning Sprint 500",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Accelerated learning programs designed for rapid skill development",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: primary.withOpacity(0.7),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text("Program Overview Video",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primary,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.black12,
              child: Center(
                child: Text("Video Player Placeholder",
                  style: TextStyle(
                    color: primary.withOpacity(0.7),
                    fontSize: 16,
                  ),
                )
              ),
            ),  
          ],
        ),
      )
    );
  }
}