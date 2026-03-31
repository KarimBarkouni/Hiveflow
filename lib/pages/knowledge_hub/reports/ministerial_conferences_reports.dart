import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../bottom_navbar.dart';
import 'ministerial_reports/minister_of_education.dart';
import 'ministerial_reports/minister_of_higher_education.dart';
import 'ministerial_reports/ministers_of_childhood.dart';
import 'ministerial_reports/ministers_of_culture.dart';
import 'ministerial_reports/ministers_of_enviroment.dart';

class MinisterialConferencesReports extends StatefulWidget {
  const MinisterialConferencesReports({super.key});

  @override
  State<MinisterialConferencesReports> createState() => _MinisterialConferencesReportsState();
}

class _MinisterialConferencesReportsState extends State<MinisterialConferencesReports> {
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    return Scaffold(
      backgroundColor: theme.colorScheme.onSurface,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        leading: IconButton(
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
                    "Ministerial Conferences",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Browse ministerial conference proceedings and resolutions",
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
            SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 25,
                    childAspectRatio: 0.85,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _quickCard('assets/icons/leaf.svg', "Ministers Of Environment", "CONFERENCES OF MINISTERS OF ENVIRONMENT", primary, () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MinistersOfEnvironmentReports()),
                        );
                      }),
                      _quickCard('assets/icons/paint.svg', "Ministers Of Culture", "CONFERENCES OF MINISTERS OF CULTURE", primary, () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MinistersOfCultureReports()),
                        );
                      }),
                      _quickCard('assets/icons/study.svg', "Ministers In Charge Of Childhood", "CONFERENCES OF THE MINISTERS IN CHARGE OF CHILDHOOD", primary, () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MinistersOfChildhoodReports()),
                        );
                      }),
                      _quickCard('assets/icons/research.svg', "Ministers Of Higher Education & Scientific Research", "CONFERENCES OF MINISTERS OF HIGHER EDUCATION", primary, () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MinisterOfHigherEducationReports()),
                        );
                      }),
                      _quickCard('assets/icons/laptop.svg', "Ministers of Education", "CONFERENCES OF MINISTERS OF EDUCATION", primary, () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MinisterOfEducationReports()),
                        );
                      }),
                    ]
                  ),            
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  static Widget _quickCard(
      String svgPath,
      String title,
      String subtitle,
      Color primary,
      VoidCallback onTap,
      ) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(25),
      child: InkWell(
        onTap: onTap,
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svgPath,
                width: 30,
                height: 30,
                color: primary,
              ),
        
              const SizedBox(height: 10),
        
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: primary,
                ),
              ),
        
              const SizedBox(height: 10),
        
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  height: 1.5,
                  color: primary.withOpacity(0.8),
                ),
              ),
        
        
            ],
          ),
        ),
      ),
    );
  }
}