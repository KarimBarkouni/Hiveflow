import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'capacity_building.dart';
import 'pro_network.dart';
import 'reports/consultative_meetings_reports.dart';
import 'reports/executive_councils_reports.dart';
import 'reports/general_conferences_reports.dart';
import 'reports/ministerial_conferences_reports.dart';
import 'user_guide_&_faq.dart';

class KnowledgeHub extends StatefulWidget {
  const KnowledgeHub({super.key});

  @override
  State<KnowledgeHub> createState() => _KnowledgeHubState();
}

class _KnowledgeHubState extends State<KnowledgeHub> {

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
                "Knowledge Hub",
                style: TextStyle(
                  color: primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Access educational resources, professional networks,\nand strategic initiatives",
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
                _quickCard('assets/icons/meeting.svg', "Professional Networks","Connect with experts and professionals across various domains", primary, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProNetwork()),
                  );
                }),
                _quickCard('assets/icons/rocket.svg', "Capacity Building","Comprehensive training programs including Learning Sprint 500", primary, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CapacityBuilding()),
                  );
                }),
                _quickCard('assets/icons/medal.svg', "User Guide and FAQ","Learn how to use the platform and find answers to common questions", primary, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserGuideAndFAQ()),
                  );
                }),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "Conference Reports",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: primary,
              ),
            ),
            const SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 25,
              childAspectRatio: 0.85,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _quickCardReport('assets/icons/people.svg', "General Conferences",12, "Access reports and documents from our general conferences","May 2019", primary, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GeneralConferencesReports()),
                  );
                }),
                _quickCardReport('assets/icons/building.svg', "Executive Councils",29, "Review executive council meeting outcomes and decisions","January 2024", primary , () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ExecutiveCouncilsReports()),
                  );
                }),
                _quickCardReport('assets/icons/conference.svg', "Ministerial Conferences",35 , "Browse ministerial conference proceedings and resolutions","October 2024", primary, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MinisterialConferencesReports()),
                  );
                }),
                _quickCardReport('assets/icons/message.svg', "Consultative Meetings",0, "Access reports from consultative meetings and discussions"," ", primary, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ConsultativeMeetingsReports()),
                  );
                }),
              ],
            ),
            const SizedBox(height: 20),
                  Text(
                    "Upcoming Conferences",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: primary,
                    ),
                  ),
                  const SizedBox(height: 20),
                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.9,
                    children: [
                      _quickCardSmall('assets/icons/people.svg', "General Conference", primary,),
                      _quickCardSmall('assets/icons/building.svg', "Executive Meeting", primary,),
                      _quickCardSmall('assets/icons/conference.svg', "Ministerial Conference", primary,),
                    ],
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
                  fontSize: 11,
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
  static Widget _quickCardReport(
      String svgPath,
      String title,
      int report,
      String subtitle,
      String date,
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
          padding: const EdgeInsets.symmetric(horizontal:15, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                  SvgPicture.asset(
                    svgPath,
                    width: 20,
                    height:20,
                    color: primary,
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: primary,
                    ),
                  ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("$report Reports", style: const TextStyle(fontSize: 12, color: Color.fromRGBO(15, 115, 120, 1))),
                ],
              ),
              const SizedBox(height: 5),
        
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11,
                  height: 1.5,
                  color: primary.withOpacity(0.8),
                ),
              ),
              const SizedBox(height: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text("Latest: $date", style: const TextStyle(fontSize: 9, color: Color.fromRGBO(15, 115, 120, 1))),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 202, 40, 1.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/document.svg',
                      width: 12,
                      height: 14,
                    ),
                  ),
                ],
              ),
        
            ],
          ),
        ),
      ),
    );
  }
static Widget _quickCardSmall(
  String svgPath,
  String title,
  Color primary,
) {
  return Material(
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(25),
    child: InkWell(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(15, 115, 120, 0.06),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.01),
              blurRadius: 8,
            )
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