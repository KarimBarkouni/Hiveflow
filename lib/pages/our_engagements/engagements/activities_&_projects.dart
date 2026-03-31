import 'package:flutter/material.dart';
import '../../bottom_navbar.dart';

class ActivitiesAndProjects extends StatefulWidget {
  const ActivitiesAndProjects({Key? key}) : super(key: key);

  @override
  State<ActivitiesAndProjects> createState() =>
      _ActivitiesAndProjectsState();
}

class _ActivitiesAndProjectsState
    extends State<ActivitiesAndProjects> {

  String selectedStatus = "All Status";
  String searchQuery = "";

  final List<String> statuses = [
    "All Status",
    "Not Started",
    "On Hold",
    "Initiated",
    "Under Implementation",
    "Achieved",
    "Final Report Submitted",
    "Cancelled",
  ];

  final List<Map<String, String>> activities = [
    {
      "code": "1.1.1.1",
      "title": "International Conference on Open Education and AI",
      "unit": "Education Sector",
      "status": "Not Started",
    },
    {
      "code": "1.1.1.2",
      "title": "ICESCO Conference of Ministers of Education",
      "unit": "Education Sector",
      "status": "Achieved",
    },
    {
      "code": "1.1.1.3",
      "title": "Arab Model Project for Quality and Excellence",
      "unit": "Education Sector",
      "status": "Not Started",
    },
  ];
    final List<Map<String, String>> activities2 = [
    {
      "code": "2.5.3.6",
      "title": "AI & Media",
      "unit": "Center of Foresight and Artificial Intelligence",
      "status": "Not Started",
    },
    {
      "code": "2.5.1.3",
      "title": "Strategic Foresight Guide",
      "unit": "	Center of Foresight and Artificial Intelligence",
      "status": "Under Implementation",
    },
    {
      "code": "1.1.1.3",
      "title": "Arab Model Project for Quality and Excellence",
      "unit": "Education Sector",
      "status": "Not Started",
    },
  ];

  final List<Map<String, String>> activities3 = [
    {
      "code": "3.5.3.6",
      "title": "AI & Media",
      "unit": "Center of Foresight and Artificial Intelligence",
      "status": "Not Started",
    },
    {
      "code": "3.5.1.3",
      "title": "Strategic Foresight Guide",
      "unit": "	Center of Foresight and Artificial Intelligence",
      "status": "Under Implementation",
    },
    {
      "code": "3.1.1.3",
      "title": "Arab Model Project for Quality and Excellence",
      "unit": "Education Sector",
      "status": "Not Started",
    },
  ];
  final List<Map<String, String>> activities4 = [
    {
      "code": "4.5.3.6",
      "title": "AI & Media",
      "unit": "Center of Foresight and Artificial Intelligence",
      "status": "Initiated",
    },
    {
      "code": "4.5.1.3",
      "title": "Strategic Foresight Guide",
      "unit": "	Center of Foresight and Artificial Intelligence",
      "status": "On Hold",
    },
    {
      "code": "4.1.1.3",
      "title": "Arab Model Project for Quality and Excellence",
      "unit": "Education Sector",
      "status": "Achieved",
    },
  ];
  final List<Map<String, String>> activities5 = [
    {
      "code": "5.5.3.6",
      "title": "AI & Media",
      "unit": "Center of Foresight and Artificial Intelligence",
      "status": "Not Started",
    },
    {
      "code": "5.5.1.3",
      "title": "Strategic Foresight Guide",
      "unit": "	Center of Foresight and Artificial Intelligence",
      "status": "Under Implementation",
    },
    {
      "code": "5.1.1.3",
      "title": "Arab Model Project for Quality and Excellence",
      "unit": "Education Sector",
      "status": "Not Started",
    },
  ];

  List<Map<String, String>> get filteredActivities {
    return activities.where((activity) {
      final matchesStatus =
          selectedStatus == "All Status" ||
              activity["status"] == selectedStatus;

      final matchesSearch =
          activity["title"]!
              .toLowerCase()
              .contains(searchQuery.toLowerCase());

      return matchesStatus && matchesSearch;
    }).toList();
  }

  List<Map<String, String>> get filteredActivities2 {
    return activities2.where((activity2) {
      final matchesStatus =
          selectedStatus == "All Status" ||
              activity2["status"] == selectedStatus;

      final matchesSearch =
          activity2["title"]!
              .toLowerCase()
              .contains(searchQuery.toLowerCase());

      return matchesStatus && matchesSearch;
    }).toList();
  }

  List<Map<String, String>> get filteredActivities3 {
    return activities3.where((activity3) {
      final matchesStatus =
          selectedStatus == "All Status" ||
              activity3["status"] == selectedStatus;

      final matchesSearch =
          activity3["title"]!
              .toLowerCase()
              .contains(searchQuery.toLowerCase());

      return matchesStatus && matchesSearch;
    }).toList();
  }

  List<Map<String, String>> get filteredActivities4 {
    return activities4.where((activity4) {
      final matchesStatus =
          selectedStatus == "All Status" ||
              activity4["status"] == selectedStatus;

      final matchesSearch =
          activity4["title"]!
              .toLowerCase()
              .contains(searchQuery.toLowerCase());

      return matchesStatus && matchesSearch;
    }).toList();
  }

  List<Map<String, String>> get filteredActivities5 {
    return activities5.where((activity5) {
      final matchesStatus =
          selectedStatus == "All Status" ||
              activity5["status"] == selectedStatus;

      final matchesSearch =
          activity5["title"]!
              .toLowerCase()
              .contains(searchQuery.toLowerCase());

      return matchesStatus && matchesSearch;
    }).toList();
  }

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
                      BottomNavBar(initialIndex: 3,),
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

            /// Header
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
                    "Activities & Projects",
                    style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Track and monitor ICESCO's activities and projects across member states",
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

            SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  _buildSearchAndFilters(primary),

                  const SizedBox(height: 20),

                  _buildGoalHeader(),

                  const SizedBox(height: 20),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        _buildTableHeader(),
                        ...filteredActivities.map(_buildActivityRow).toList(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  _buildGoalHeader2(),

                  const SizedBox(height: 20),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        _buildTableHeader(),
                        ...filteredActivities2.map(_buildActivityRow2).toList(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  _buildGoalHeader3(),

                  const SizedBox(height: 20),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        _buildTableHeader(),
                        ...filteredActivities3.map(_buildActivityRow3).toList(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  _buildGoalHeader4(),

                  const SizedBox(height: 20),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        _buildTableHeader(),
                        ...filteredActivities4.map(_buildActivityRow4).toList(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  _buildGoalHeader5(),

                  const SizedBox(height: 20),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        _buildTableHeader(),
                        ...filteredActivities5.map(_buildActivityRow5).toList(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
   Widget _buildSearchAndFilters(Color primary) {
    return Column(
      children: [

        /// Search
        TextField(
          style: const TextStyle(
            color: Colors.black, // ✅ typed text color
          ),
          decoration: InputDecoration(
            hintText: "Search by activity code or name...",
            hintStyle: TextStyle(
              color: primary,
            ),
            prefixIcon: Icon(Icons.search, color: primary),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: primary,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: primary,
                width: 2,
              ),
            ),
          ),
          onChanged: (value) {
            setState(() {
              searchQuery = value;
            });
          },
        ),

        const SizedBox(height: 15),

        /// Status Chips
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: statuses.map((status) {
              final isSelected = selectedStatus == status;

              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ChoiceChip(
                  label: Text(status),
                  selected: isSelected,
                  selectedColor: primary,
                  onSelected: (_) {
                    setState(() {
                      selectedStatus = status;
                    });
                  },
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  /// ===============================
  /// GOAL HEADER CARD
  /// ===============================
  Widget _buildGoalHeader() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.flag_outlined, size: 30,color: const Color.fromARGB(255, 0, 45, 128),),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "First goal",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black),
                ),
                SizedBox(height: 4),
                Text(
                  "Strengthening the capacity of educational systems in Member States to ensure sustainable development and reduce inequality",
                  style: TextStyle(fontSize: 13,color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGoalHeader2() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.flag_outlined, size: 30,color: const Color.fromARGB(255, 0, 45, 128),),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Second goal",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black),
                ),
                SizedBox(height: 4),
                Text(
                  "Accelerating the Islamic World countries integration into the global economies and sustainable societies focusing on the production of knowledge, scientific development, innovation, strategic foresight and environmental protection",
                  style: TextStyle(fontSize: 13,color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildGoalHeader3() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.flag_outlined, size: 30,color: const Color.fromARGB(255, 0, 45, 128),),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Third goal",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black),
                ),
                SizedBox(height: 4),
                Text(
                  "Contributing to achieving social development, consolidating the foundations of peace and security, and building sustainable societies",
                  style: TextStyle(fontSize: 13,color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildGoalHeader4() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.flag_outlined, size: 30,color: const Color.fromARGB(255, 0, 45, 128),),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Fourth goal",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black),
                ),
                SizedBox(height: 4),
                Text(
                  "Contributing in the overall cultural development of the Islamic world communities, encouraging cultural diversity and dialogue among civilizations, protecting heritage while respecting local specificities and our Islamic identity",
                  style: TextStyle(fontSize: 13,color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildGoalHeader5() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.flag_outlined, size: 30,color: const Color.fromARGB(255, 0, 45, 128),),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Fifth goal",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black),
                ),
                SizedBox(height: 4),
                Text(
                  "Achieving coherence, integration and strategic coordination among the Islamic world countries in the Organization's areas of work by creating an institutional environment characterized by efficiency, effectiveness and good governance",
                  style: TextStyle(fontSize: 13,color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  /// ===============================
  /// TABLE HEADER
  /// ===============================

  Widget _buildTableHeader() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      children: const [
        SizedBox(
          width: 100,
          child: Text(
            "CODE",
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        SizedBox(width: 20),

        SizedBox(
          width: 250,
          child: Text(
            "ACTIVITY / PROJECT",
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        SizedBox(width: 20),

        SizedBox(
          width: 150,
          child: Text(
            "BUSINESS UNIT",
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        SizedBox(width: 20),

        SizedBox(
          width: 140,
          child: Text(
            "STATUS",
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}

  /// ===============================
  /// ACTIVITY ROW
  /// ===============================
Widget _buildActivityRow(Map<String, String> activity) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 14), // ✅ vertical spacing
    child: Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            activity["code"]!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),

        const SizedBox(width: 20),

        SizedBox(
          width: 250,
          child: Text(
            activity["title"]!,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),

        const SizedBox(width: 20),

        SizedBox(
          width: 150,
          child: Text(
            activity["unit"]!,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ),

        const SizedBox(width: 20),

        SizedBox(
          width: 140,
          child: _buildStatusBadge(activity["status"]!),
        ),
      ],
    ),
  );
}
Widget _buildActivityRow2(Map<String, String> activity2) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 14), // ✅ vertical spacing
    child: Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            activity2["code"]!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),

        const SizedBox(width: 20),

        SizedBox(
          width: 250,
          child: Text(
            activity2["title"]!,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),

        const SizedBox(width: 20),

        SizedBox(
          width: 150,
          child: Text(
            activity2["unit"]!,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ),

        const SizedBox(width: 20),

        SizedBox(
          width: 140,
          child: _buildStatusBadge(activity2["status"]!),
        ),
      ],
    ),
  );
}
Widget _buildActivityRow3(Map<String, String> activity3) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 14), // ✅ vertical spacing
    child: Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            activity3["code"]!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),

        const SizedBox(width: 20),

        SizedBox(
          width: 250,
          child: Text(
            activity3["title"]!,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),

        const SizedBox(width: 20),

        SizedBox(
          width: 150,
          child: Text(
            activity3["unit"]!,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ),

        const SizedBox(width: 20),

        SizedBox(
          width: 140,
          child: _buildStatusBadge(activity3["status"]!),
        ),
      ],
    ),
  );
}
Widget _buildActivityRow4(Map<String, String> activity4) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 14), // ✅ vertical spacing
    child: Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            activity4["code"]!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),

        const SizedBox(width: 20),

        SizedBox(
          width: 250,
          child: Text(
            activity4["title"]!,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),

        const SizedBox(width: 20),

        SizedBox(
          width: 150,
          child: Text(
            activity4["unit"]!,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ),

        const SizedBox(width: 20),

        SizedBox(
          width: 140,
          child: _buildStatusBadge(activity4["status"]!),
        ),
      ],
    ),
  );
}
Widget _buildActivityRow5(Map<String, String> activity5) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 14), // ✅ vertical spacing
    child: Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            activity5["code"]!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),

        const SizedBox(width: 20),

        SizedBox(
          width: 250,
          child: Text(
            activity5["title"]!,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),

        const SizedBox(width: 20),

        SizedBox(
          width: 150,
          child: Text(
            activity5["unit"]!,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ),

        const SizedBox(width: 20),

        SizedBox(
          width: 140,
          child: _buildStatusBadge(activity5["status"]!),
        ),
      ],
    ),
  );
}
  /// ===============================
  /// STATUS BADGE
  /// ===============================

  Widget _buildStatusBadge(String status) {
    Color bgColor;
    Color textColor;

    switch (status) {
      case "Achieved":
        bgColor = Colors.green.withOpacity(0.2);
        textColor = Colors.green;
        break;
      case "Not Started":
        bgColor = Colors.grey.withOpacity(0.2);
        textColor = Colors.grey[800]!;
        break;
      default:
        bgColor = Colors.blue.withOpacity(0.2);
        textColor = Colors.blue;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }
}     