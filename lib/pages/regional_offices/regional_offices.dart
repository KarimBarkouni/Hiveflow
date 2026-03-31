import 'package:flutter/material.dart';
import '../bottom_navbar.dart';

class RegionalOffices extends StatefulWidget {
  const RegionalOffices({super.key});

  @override
  State<RegionalOffices> createState() => _RegionalOfficesState();
}

class _RegionalOfficesState extends State<RegionalOffices> {

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
                      BottomNavBar(initialIndex: 0,),
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
                    "Regional Offices",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "ICESCO's global presence through our regional offices",
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
            BuildRegionalOfficeCard(pictureUrl: "assets/images/sharjah.png", title: "ICESCO Regional Office in Sharjah", location: "Unnamed Road - Al KhanAl - Al Qasba - Sharjah - UAE", number: "+971 6 556 5000", email: "do@icesco.org.ae"),
            const SizedBox(height: 10),
            BuildRegionalOfficeCard(pictureUrl: "assets/images/tehran.png", title: "ICESCO Regional Office in Tehran", location: "ICESCO Regional Office in Tehran 43, Kalantari St, Sepahbod Garani Avenue, 1584714411. Tehran, Islamic Republic of Iran", number: "+9821 8831 6288", email: "icesco@icesco-tehran.org"),                             
            const SizedBox(height: 20),
            BuildRegionalOfficeCard(pictureUrl: "assets/images/paris.png", title: "ICESCO Delegation to UNESCO in Paris", location: "1, rue Miollis, 75015 Paris, France", number: "+33(0) 1 45 68 27 50", email: "dl.isesco@unesco-delegations.org"),     
            const SizedBox(height: 20),
            BuildRegionalOfficeCard(pictureUrl: "assets/images/comoros.png", title: "Moroni - UNION DES COMORES", location: "Route de Beit Salam", number: "+2694310828", email: "isescocomores@gmail.com"), 
            const SizedBox(height: 20),
            BuildRegionalOfficeCard(pictureUrl: "assets/images/tchad.png", title: "ICESCO Pedagogical Center in Chad", location: "P.O. Box: (5140) N'Djamena, République du Tchad", number: "+2352 519 403", email: "hassantahayoussouf@gmail.com"), 
            const SizedBox(height: 20),
            BuildRegionalOfficeCard(pictureUrl: "assets/images/baku.png", title: "ICESCO Regional Office of Baku", location: "Baku, République du Azerbaijan", number: "", email: "baku.office@icesco.org"), 
          ],
        ),
      ),
    );
  } 
}  
class BuildRegionalOfficeCard extends StatelessWidget {
  final String pictureUrl;
  final String title;
  final String location;
  final String number;
  final String email;

  const BuildRegionalOfficeCard({
    super.key,
    required this.pictureUrl,
    required this.title,
    required this.location,
    required this.number,
    required this.email,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            pictureUrl,
              height: 100,
              width: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16),
          Expanded(   
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 10),

              _infoRow(Icons.location_on_outlined, location),
              const SizedBox(height: 8),

              _infoRow(Icons.phone_outlined, number),
              const SizedBox(height: 8),

              _infoRow(Icons.email_outlined, email),
            ],
          ),
          ),
        ],
      ),
    );
  }
  
  Widget _infoRow(IconData icon, String text) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(icon, size: 16, color: Colors.black54),
      const SizedBox(width: 6),
      Expanded(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ),
    ],
  );
}
}
