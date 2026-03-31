import 'package:flutter/material.dart';
import 'engagements/activities_&_projects.dart';
import 'engagements/host_specialized_meeting.dart';
import 'engagements/project_suggestions.dart';
import 'engagements/propose_donor.dart';
import 'engagements/suggestions.dart';
import 'engagements/take_action.dart';

class OurEngagementsPage extends StatelessWidget {
  const OurEngagementsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    return Scaffold(
        backgroundColor: theme.colorScheme.onSurface,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
          centerTitle: true,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Our Engagements",
                style: TextStyle(
                  color: primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Discover our impactful initiatives and collaborations",
                style: TextStyle(
                  color: primary,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      body: SingleChildScrollView(
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
                _quickCard( "Activities & Projects","Track and monitor ICESCO's activities and projects across member states", primary, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ActivitiesAndProjects()),
                  );
                }),
                _quickCard( "Suggestions","Track the status of your submitted suggestions", primary, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Suggestions()),
                  );
                }),
                _quickCard( "Project Suggestions","Submit and track project proposals from National Commissions", primary, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProjectSuggestions()),
                  );
                }),
                _quickCard( "Host Specialized Meeting","Submit your request to host ICESCO's constitutional meetings", primary, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HostSpecializedMeeting()),
                  );
                }),
                _quickCard( "Take Action","Participate in or host ICESCO activities and initiatives", primary, () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TakeAction()),
                  );
                }),
                _quickCard( "List of Donors","Submit potential donor information to support ICESCO's initiatives", primary, () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProposeDonor()),
                  );
                }),
              ],
            ),
          ],  
        ),
      ),
    );
  }
   static Widget _quickCard(
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: primary,
                ),
              ),
        
              const SizedBox(height: 10),
        
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
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
