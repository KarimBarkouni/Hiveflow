import 'package:flutter/material.dart';
import '../../bottom_navbar.dart';

class GeneralConferencesReports extends StatefulWidget {
  const GeneralConferencesReports({super.key});

  @override
  State<GeneralConferencesReports> createState() => _GeneralConferencesReportsState();
}

class _GeneralConferencesReportsState extends State<GeneralConferencesReports> {
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    final sessions = [
      {
        "session": "3",
        "country": "Kingdom of Morocco",
        "city": "Rabat",
        "from": "09/05/2019",
        "to": "10/05/2019",
        "doc": "Final-report-GCE2019-En (1).pdf"
      },
      {
        "session": "11",
        "country": "Kingdom of Saudi Arabia",
        "city": "Riyadh",
        "from": "01/12/2012",
        "to": "02/12/2012",
        "doc": "ICESCO-General-Conference-11-session-En-1.pdf"
      },
      {
        "session": "10",
        "country": "Republic of Tunisia",
        "city": "Tunis",
        "from": "02/06/2009",
        "to": "03/06/2009",
        "doc": "ICESCO-General-Conference-10-session-En.pdf"
      },
    ];
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
                    "General Conferences",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Access conference documents and reports",
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
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowColor:
                    MaterialStateProperty.all(Colors.grey.shade200),
                columns: const [
                  DataColumn(label: Text("SESSION", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black))),
                  DataColumn(label: Text("COUNTRY", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black))),
                  DataColumn(label: Text("CITY", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black))),
                  DataColumn(label: Text("FROM", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black))),
                  DataColumn(label: Text("TO", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black))),
                  DataColumn(label: Text("DOCUMENTS", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black))),
                ],
                rows: sessions.map((session) {
                  return DataRow(cells: [
                    DataCell(Text(session["session"]!, style: TextStyle(fontWeight: FontWeight.w500, color: primary))),
                    DataCell(Text(session["country"]!, style: TextStyle(color: primary))),
                    DataCell(Text(session["city"]!, style: TextStyle(color: primary))),
                    DataCell(Text(session["from"]!, style: TextStyle(color: primary))),
                    DataCell(Text(session["to"]!, style: TextStyle(color: primary))),
            
                    /// Document with download icon
                    DataCell(
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              session["doc"]!,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Icon(
                              Icons.download,
                              size: 18,
                              color: primary,
                            )
                          ],
                        ),
                      ),
                    ),
                  ]);
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}