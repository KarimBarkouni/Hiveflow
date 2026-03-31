import 'package:flutter/material.dart';
import '../../bottom_navbar.dart';

class ProjectSuggestions extends StatefulWidget {
  const ProjectSuggestions({Key? key}) : super(key: key);

  @override
  State<ProjectSuggestions> createState() =>
      _ProjectSuggestionsState();
}

class _ProjectSuggestionsState
    extends State<ProjectSuggestions> {

  String selectedStatus = "All Status";
  String searchQuery = "";

  final List<String> statuses = [
    "All Status",
    "Draft",
    "Published",
  ];

  final List<Map<String, String>> goals = [
    {
      "goal": "Strengthening the capacity of educational systems in Member States to ensure sustainable development and reduce inequality",
      "pillar": "Investing in Innovative and Sustainable Education for All",
      "service": "Enhancing the quality of education and learning",
      "subservice": "Developing curricula and modernizing assessment mechanisms",
      "project": "تعليم العلوم وفق منحى STREAM",
      "status": "Draft",
    },
    {
      "goal": "Contributing to the achievement of social development, the consolidation of peace and security, and the building of sustainable societies.",
      "pillar": "Establishing peace through policies and programs that empower communities capable of facing challenges.",
      "service": "Education for peace and citizenship",
      "subservice": "Civic participation for social cohesion",
      "project": "الطبيعة في خدمة السلم",
      "status": "Published",
    },
    {
      "goal": "Promoting the cultural advancement of the Islamic world's peoples, fostering diversity and intercultural dialogue, and protecting heritage while upholding Islamic identity and local traditions.",
      "pillar": "Supporting the teaching and dissemination of the Arabic language to non-Arabic speakers",
      "service": "Developing teaching and learning capacities",
      "subservice": "Professional training for teachers",
      "project": "Atelier de formation sur le renforcement des compétences des Teachers de langue arabe",
      "status": "Draft",
    },
  ];
  
  List<Map<String, String>> get filteredGoals {
    return goals.where((goal) {
      final matchesStatus =
          selectedStatus == "All Status" ||
              goal["status"] == selectedStatus;

      final matchesSearch =
          goal["goal"]!
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
                    "Project Suggestions",
                    style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Submit and track project proposals from National Commissions",
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

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        _buildTableHeader(),
                        ...filteredGoals.map(_buildAGoalRow).toList(),
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
            "GOAL",
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
            "PILLAR",
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
            "SERVICE",
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
            "SUBSERVICE",
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
            "PROJECT",
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
  /// GOAL ROW
  /// ===============================
Widget _buildAGoalRow(Map<String, String> goal) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 14), // ✅ vertical spacing
    child: Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            goal["goal"]!,
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
            goal["pillar"]!,
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
            goal["service"]!,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ),
        const SizedBox(width: 20),

        SizedBox(
          width: 150,
          child: Text(
            goal["subservice"]!,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ),
        const SizedBox(width: 20),

        SizedBox(
          width: 150,
          child: Text(
            goal["project"]!,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ),

        const SizedBox(width: 20),

        SizedBox(
          width: 140,
          child: _buildStatusBadge(goal["status"]!),
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
      case "Published":
        bgColor = Colors.green.withOpacity(0.2);
        textColor = Colors.green;
        break;
      case "Draft":
        bgColor = Colors.yellow.withOpacity(0.2);
        textColor = Colors.yellow[800]!;
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