import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../bottom_navbar.dart';

class UserGuideAndFAQ extends StatelessWidget {
  const UserGuideAndFAQ({super.key});

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
                    "User Guide & FAQ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Learn how to use the platform and find answers to common questions",
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

            Row(
              children: [
                const SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: theme.colorScheme.surface,
                    shape: BoxShape.rectangle,
                  
                  ),
                  padding: const EdgeInsets.all(15)  ,
                  child: SvgPicture.asset( "assets/icons/guide.svg", height: 30, color: theme.colorScheme.primary,),
                ),
                const SizedBox(width: 10),
                Text(
                  "User Guide",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            GettingStartedSection(),
            SizedBox(height: 20),
            NavigationGuideSection(),
            SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: theme.colorScheme.surface,
                    shape: BoxShape.rectangle,
                  
                  ),
                  padding: const EdgeInsets.all(15)  ,
                  child: SvgPicture.asset( "assets/icons/question.svg", height: 30, color: theme.colorScheme.primary,),
                ),
                const SizedBox(width: 10),
                Text(
                  "FAQ",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: primary,
                  ),
                ),
              ],
            ),
              SizedBox(height: 20),
              FAQSection(),
              SizedBox(height: 20), 
          ],
        ),
      )
    );
  }
}

class GettingStartedSection extends StatefulWidget {
  const GettingStartedSection({super.key});

  @override
  State<GettingStartedSection> createState() =>
      _GettingStartedSectionState();
}

class _GettingStartedSectionState
    extends State<GettingStartedSection> {

  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Container(
      decoration: BoxDecoration(
        color:Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [

          /// Header
          ListTile(
            leading: Icon(Icons.settings, color: primary),
            title: Text(
              "Getting Started",
              style: TextStyle(fontWeight: FontWeight.bold, color: primary),
            ),
          ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: primary.withOpacity(0.1),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome to HiveFlow!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: primary,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Follow these steps to get started with the platform:",
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 20),

                  _stepItem(
                    "Log in to your account",
                    "Use your credentials provided by your National Commission",
                  ),
                  _stepItem(
                    "Complete your profile",
                    "Add your information and preferences in Account Settings",
                  ),
                  _stepItem(
                    "Explore resources",
                    "Browse through Knowledge Hub and Professional Networks",
                  ),
                  _stepItem(
                    "Connect with others",
                    "Start communicating with other member states",
                  ),
                ],
              ),
            ),
          ],
      ),
    );
  }

  Widget _stepItem(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: Theme.of(context).colorScheme.surface,
            child: Icon(Icons.arrow_forward,
                size: 14, color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(subtitle,
                    style: const TextStyle(
                        color: Colors.black54)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationGuideSection extends StatefulWidget {
  const NavigationGuideSection({super.key});

  @override
  State<NavigationGuideSection> createState() =>
      _NavigationGuideSectionState();
}

class _NavigationGuideSectionState
    extends State<NavigationGuideSection> {

  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [

          /// Header
          ListTile(
            leading: Icon(Icons.people, color: primary),
            title:  Text(
              "Navigation Guide",
              style: TextStyle(fontWeight: FontWeight.bold, color: primary),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: const [
                Expanded(
                  child: _NavCard(
                    title: "Member States",
                    items: [
                      "View member profiles",
                      "Access contact information",
                      "Track activities",
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: _NavCard(
                    title: "Knowledge Hub",
                    items: [
                      "Educational resources",
                      "Professional networks",
                      "Research materials",
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NavCard extends StatelessWidget {
  final String title;
  final List<String> items;

  const _NavCard({
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final itemColor = Colors.black54; 

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: primary.withOpacity(0.08),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: primary,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),

          ...items.map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    size: 18,
                    color: primary, 
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      e,
                      style: TextStyle(
                        color: itemColor, 
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ).toList(),
        ],
      ),
    );
  }
}

class FAQSection extends StatefulWidget {
  const FAQSection({super.key});

  @override
  State<FAQSection> createState() => _FAQSectionState();
}

class _FAQSectionState extends State<FAQSection> {
  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          /// Header
          ListTile(
            title: Text(
              "How do I update my member state profile?",
              style: TextStyle(fontWeight: FontWeight.bold, color: primary),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: primary.withOpacity(0.1),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(16),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Profile Update Steps",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: primary,
                  ),
                ),
                const SizedBox(height: 20),

                _stepItem(
                  "Click on your profile icon in the top right corner",
                ),
                _stepItem(
                  "Select \"Edit Profile\" from the dropdown menu",
                ),
                _stepItem(
                  "Update the necessary information in the form",
                ),
                _stepItem(
                  "Click \"Save Changes\" to apply your updates",
                ),

              ],
            ),
          ),
          ListTile(
            title: Text(
              "How do I update my member state profile?",
              style: TextStyle(fontWeight: FontWeight.bold, color: primary),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: const [
                Expanded(
                  child: _SuggestionCard(
                    title: "View All Suggestions",
                    subtitle: "Go to Strategy → Suggestions to see:",
                    items: [
                      "All submitted suggestions",
                      "Current status",
                      "Submission date",
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: _SuggestionCard(
                    title: "Detailed View",
                    subtitle: "Click on any suggestion to see:",
                    items: [
                      "Complete details",
                      "Status history",
                      "Comments and feedback",
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),   
    );
  }

  Widget _stepItem(String text,) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: Theme.of(context).colorScheme.surface,
            child: Icon(Icons.arrow_forward,
                size: 14, color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class _SuggestionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<String> items;

  const _SuggestionCard({
    required this.title,
    required this.subtitle,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final itemColor = Colors.black54; 

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: primary.withOpacity(0.08),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: primary,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            subtitle,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 12),
          ...items.map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    size: 18,
                    color: primary, 
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      e,
                      style: TextStyle(
                        color: itemColor, 
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ).toList(),
        ],
      ),
    );
  }
}