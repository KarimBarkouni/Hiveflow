import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../bottom_navbar.dart';

class ProNetwork extends StatelessWidget {
  const ProNetwork({super.key});

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
                    "Professional Networks",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Connect with experts and professionals across various domains in the Islamic world",
                    textAlign: TextAlign.center, // ✅ Important
                    style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 10),
                SvgPicture.asset(
                  "assets/icons/people.svg",
                  width: 20,
                  height: 20,
                ),
                const SizedBox(width: 5),
                Text("23", style: TextStyle(fontSize: 20, color: primary)),
              ],
            ),
            const SizedBox(height: 20),
            ExpertCard(
              country: "Morocco",
              flagImage: "assets/images/morocco.png",
              name: "AMAGHOUD Mohamed",
              title: "Head of the Education and Training Department",
              organization: "Haut Commissariat au Plan",
              imagePath: "assets/images/profile.png",
            ),

            ExpertCard(
              country: "Mauritania",
              flagImage: "assets/images/mauritania.png",
              name: "Abdela Aziz Naji",
              title: "Directeur des Stratégies et de la Coopération",
              organization: "Ministère de l'Éducation",
              imagePath: "assets/images/profile.png",
            ),

            ExpertCard(
              country: "Qatar",
              flagImage: "assets/images/qatar.png",
              name: "Ahmed Mahmoud Abdelbaqi Awad",
              title: "Arabic language standards specialist",
              organization: "Ministry of Education and Higher Education",
              imagePath: "assets/images/profile.png",
            ),

            ExpertCard(
              country: "Qatar",
              flagImage: "assets/images/qatar.png",
              name: "Ahmed Mahmoud Abdelbaqi Awad",
              title: "Arabic language standards specialist",
              organization: "Ministry of Education and Higher Education",
              imagePath: "assets/images/profile.png",
            ),
          ],
        ),
      ),
    );
  }
}
class ExpertCard extends StatelessWidget {
  final String country;
  final String flagImage;
  final String name;
  final String title;
  final String organization;
  final String imagePath;

  const ExpertCard({
    super.key,
    required this.country,
    required this.flagImage,
    required this.name,
    required this.title,
    required this.organization,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Top Row (Country + Badge)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset(
                      flagImage,
                      width: 22,
                      height: 16,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    country,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.black38
                    ),
                  ),
                ],
              ),
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: theme.colorScheme.secondary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Experts",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          /// Profile Section
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 32,
                backgroundImage: AssetImage(imagePath),
              ),
              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined,
                            size: 16, color: Colors.grey),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            organization,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
