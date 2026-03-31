import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../bottom_navbar.dart';
import 'learning/learning_sprint.dart';

class CapacityBuilding extends StatelessWidget {
  const CapacityBuilding({super.key});

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
                      BottomNavBar(initialIndex: 2,),
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
                    "Capacity Building Programs",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Comprehensive training and development programs for member states",
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
            Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(25),
              child: InkWell(
                onTap: (){
                 Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LearningSprint()),
                          );
                },
                borderRadius: BorderRadius.circular(25) ,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 15,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(18),
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/rocket.svg',
                        width: 30,
                        height: 30,
                        color: primary,
                      ),
                
                      const SizedBox(height: 10),
                
                      Text(
                        'Learning Sprint 500',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: primary,
                        ),
                      ),
                
                      const SizedBox(height: 10),
                
                      Text(
                        'Accelerated learning program designed for rapid skill development in just 500 minutes',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11,
                          height: 1.5,
                          color: primary.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}