import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../bottom_navbar.dart';
import '../knowledge_hub/capacity_building.dart';
import '../knowledge_hub/pro_network.dart';
import '../mail/mail.dart';
import '../our_engagements/engagements/activities_&_projects.dart';
import '../our_engagements/engagements/host_specialized_meeting.dart';
import '../regional_offices/regional_offices.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;

    return Scaffold(
      backgroundColor: theme.colorScheme.onSurface,
      body: CustomScrollView(
        slivers: [

          /// 🔷 COLLAPSING HEADER
          SliverAppBar(
            expandedHeight: 180,
            pinned: true,
            elevation: 0,
            // When collapsed, we make the background transparent to show the "Upcoming Conferences" area
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            // The icon is placed in 'actions' for proper alignment with the toolbar title area
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: primary,
                    shape: BoxShape.rectangle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.mail_outline_sharp, color: Colors.white),
                    iconSize: 25,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) =>
                          const Mail(),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            const begin = Offset(1.0, 0.0);
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
                    padding: EdgeInsets.zero, // Removes IconButton's default padding
                    constraints: BoxConstraints(), // Removes default constraints
                  ),
                ),
              )
            ],
            flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final topPadding = MediaQuery.of(context).padding.top;
          final currentHeight = constraints.biggest.height;
          final isCollapsed = currentHeight <= kToolbarHeight + topPadding + 10;

          // The entire flexibleSpace content MUST be inside a single Stack
          // to avoid ParentDataWidget errors when widgets are moved or hidden.
          return Stack(
            fit: StackFit.expand,
            children: [
              // 1. The Teal Background Layer
              // Using Opacity instead of AnimatedOpacity for more stable scroll behavior
              Opacity(
                opacity: isCollapsed ? 0.0 : 1.0,
                child: ClipPath(
                  clipper: InwardCurveClipper(),
                  child: Container(
                    color: primary,
                  ),
                ),
              ),

              // 2. The "WELCOME TO HIVEFOW!" Text
              // We use Center here, which is safe inside a Stack
              if (!isCollapsed)
                const Center(
                  child: Text(
                    "WELCOME TO HIVEFLOW!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),

              // 3. White Icon for Expanded State
              // Positioned is only valid as a direct child of Stack
              if (!isCollapsed)
                Positioned(
                  top: topPadding,
                  right: 12,
                  height: kToolbarHeight,
                  child: Center(
                    child: IconButton(
                      icon: const Icon(Icons.mail_outline_sharp, color: Colors.white),
                      iconSize: 24,
                      onPressed: () {
                        Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) =>
                          const Mail(),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            const begin = Offset(1.0, 0.0);
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
                ),
            ],
          );
        },
      ),
          ),

          /// 🔽 BODY CONTENT
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(height: 25),

                  Text(
                    "MEMBER STATES",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: primary,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Center(
                    child: Image.asset(
                      'assets/map/world.png',
                      height: 200,
                    ),
                  ),

                  const SizedBox(height: 30),

                  Text(
                    "Quick Access",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: primary,
                    ),
                  ),

                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.9,
                    children: [
                      _quickClickCard(
                        'assets/icons/people.svg',"Member States",primary,() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BottomNavBar(initialIndex: 1)),
                          );
                        },
                      ),
                      _quickClickCard(
                        'assets/icons/location.svg',"Regional Offices",primary,() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegionalOffices()),
                          );
                        },
                      ),                      
                      _quickClickCard('assets/icons/notebook.svg', "Knowledge Hub", primary, () {
                       Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BottomNavBar(initialIndex: 2)),
                          );
                      }),
                      _quickClickCard('assets/icons/thinking.svg', "Capacity Building", primary, () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CapacityBuilding()),
                          );
                      }),
                      _quickClickCard('assets/icons/network.svg', "Professional Networks", primary, () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProNetwork()),
                          );
                      }),
                      _quickClickCard('assets/icons/hosting.svg', "Host Specialized Meeting", primary, () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HostSpecializedMeeting()),
                          );
                      }),
                      _quickClickCard('assets/icons/globe.svg', "Country Activities", primary, () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ActivitiesAndProjects()),
                          );
                      }),
                    ],
                  ),/*
                  const SizedBox(height: 20),
                  Text(
                    "Upcoming Conferences",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: primary,
                    ),
                  ),

                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.9,
                    children: [
                      _quickCard('assets/icons/people.svg', "General Conference", primary,),
                      _quickCard('assets/icons/building.svg', "Executive Meeting", primary,),
                      _quickCard('assets/icons/conference.svg', "Ministerial Conference", primary,),
                    ],
                  ),

                 */

                  const SizedBox(height: 20),
                  Text(
                    "Sectors",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: primary,
                    ),
                  ),

                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.9,
                    children: [
                      _quickCard(
                        'assets/icons/study.svg',
                        "Education",
                        primary,
                            () => _showPopup(context, "Sector Leader", "Mrs. HADDY JATOU SEY","education@icesco.org"),
                      ),

                      _quickCard(
                        'assets/icons/laptop.svg',
                        "Science & Environment",
                        primary,
                            () => _showPopup(context, "Sector Leader", "Prof. Dr. Raheel Qamar","science@icesco.org"),
                      ),

                      _quickCard(
                        'assets/icons/brain.svg',
                        "Human & Social science",
                        primary,
                            () => _showPopup(context, "Sector Leader", "Mrs. Ramata Almamy Mbaye","shs@icesco.org"),
                      ),

                      _quickCard(
                        'assets/icons/sound_wave.svg',
                        "Culture & Communication",
                        primary,
                            () => _showPopup(context, "Sector Leader", "Mr. Mohammed Zine Alabidine","culture@icesco.org"),
                      ),

                      _quickCard(
                        'assets/icons/internet.svg',
                        "Partnerships",
                        primary,
                            () => _showPopup(context, "Sector Leader", "Mr. ANAR KARIMOV","cooperation@icesco.org"),
                      ),

                      _quickCard(
                        'assets/icons/strategy.svg',
                        "Strategy",
                        primary,
                            () => _showPopup(context, "Sector Leader", "Dr. MABROUK Sally","cabdg@icesco.org"),
                      ),

                      _quickCard(
                        'assets/icons/media.svg',
                        "Media & Communication",
                        primary,
                            () => _showPopup(context, "Sector Leader", "Mr. Osama Heikal","press@icesco.org"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Centers",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: primary,
                    ),
                  ),

                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.9,
                    children: [
                      _quickCard('assets/icons/ai.svg', "Foresight & AI", primary,() => _showPopup(context, "Center Leader", "Dr. Kais Hammami","foresight@icesco.org")),
                      _quickCard('assets/icons/dialogue.svg', "Civilizational dialogue", primary,() => _showPopup(context, "Center Leader", "Ambassador Khalid Fathalrahman","ddc@icesco.org")),
                      _quickCard('assets/icons/translation1.svg', "Arabic for non speakers", primary,() => _showPopup(context, "Center Leader", "Prof. Dr. Majdi Ibrahim","arabic@icesco.org")),
                      _quickCard('assets/icons/school.svg', "Chairs, Scholarships & Prizes", primary,() => _showPopup(context, "Center Leader", "Prof. Patrick Daouda","scholarships@icesco.org")),
                      _quickCard('assets/icons/mosque.svg', "Islamic world heritage", primary,() => _showPopup(context, "Center Leader", "Dr. Webber Ndoro","heritage@icesco.org")),
                      _quickCard('assets/icons/translation2.svg', "Translation & Publishing", primary,() => _showPopup(context, "Center Leader", "Dr. ALBANYAN Ahmed Abdullah","tpc@icesco.org")),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  void _showPopup(
      BuildContext context,
      String title,
      String message,
      String mail,
      ) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        final primary = Theme.of(context).colorScheme.primary;

        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                /// 🔹 Top Icon
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: primary.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.support_agent,
                    color: primary,
                    size: 30,
                  ),
                ),

                const SizedBox(height: 16),

                /// 🔹 Title
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: primary,
                  ),
                ),

                const SizedBox(height: 12),

                /// 🔹 Message
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                ),

                const SizedBox(height: 12),

                /// 🔹 Email box
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.email_outlined,
                          size: 18, color: Colors.grey),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          mail,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// 🔹 Buttons
                Row(
                  children: [

                    /// Close button
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text("Close"),
                      ),
                    ),

                    const SizedBox(width: 10),

                    /// Copy email button
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: mail));
                          Navigator.pop(context);

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Email copied to clipboard"),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Copy",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  /// 🔹 Quick Access Card
  static Widget _quickCard(
      String svgPath,
      String title,
      Color primary,
      VoidCallback onTap,
      ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(15, 115, 120, 0.06),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              svgPath,
              width: 30,
              height: 30,
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _quickClickCard(
  String svgPath,
  String title,
  Color primary,
  VoidCallback onTap,
) {
  return Material(
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(25),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        decoration: BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              svgPath,
              width: 30,
              height: 30,
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: primary,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}
class InwardCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    
    var controlPoint = Offset(size.width / 2, size.height - 40);
    var endPoint = Offset(size.width, size.height);
    
    path.quadraticBezierTo(
      controlPoint.dx,
      controlPoint.dy,
      endPoint.dx,
      endPoint.dy,
    );
    
    path.lineTo(size.width, 0);
    path.close();
    
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
