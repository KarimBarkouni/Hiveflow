import 'package:flutter/material.dart';
import '../../bottom_navbar.dart';

class Suggestions extends StatefulWidget {
  const Suggestions({Key? key}) : super(key: key);

  @override
  State<Suggestions> createState() =>
      _SuggestionsState();
}

class _SuggestionsState
    extends State<Suggestions> {

  String selectedStatus = "All Status";
  String searchQuery = "";

  final List<String> statuses = [
    "All Status",
    "Approved",
    "Declined",
    "To be considered",
    "Outside",
    "To be reviewed",
  ];

  final List<Map<String, String>> suggestions = [
    {
      "id": "531",
      "suggestions": "festivale international personnes à besoins spécifiques",
      "date": "02/09/2024",
      "business_unit": "Education Sector",
      "status": "To be considered",
      "justification": "This proposal cannot be adopted for 2024-2025 Action Plan; however, it will be considered as an input for further planning"
    },
  ];
    final List<Map<String, String>> suggestions2 = [
    {
     "id": "",
      "suggestions": "",
      "date": "",
      "business_unit":"",
      "status": "",
      "justification":""
    },
  ];

  final List<Map<String, String>> suggestions3 = [
    {
     "id": "",
      "suggestions": "",
      "date": "",
      "business_unit":"",
      "status": "",
      "justification":""
    },
  ];
  final List<Map<String, String>> suggestions4 = [
    {
     "id": "",
      "suggestions": "",
      "date": "",
      "business_unit":"",
      "status": "",
      "justification":""
    },
  ];
  final List<Map<String, String>> suggestions5 = [
   {
     "id": "",
      "suggestions": "",
      "date": "",
      "business_unit":"",
      "status": "",
      "justification":""
    },
  ];

  List<Map<String, String>> get filteredSuggestions {
    return suggestions.where((suggestion) {
      final matchesStatus =
          selectedStatus == "All Status" ||
              suggestion["status"] == selectedStatus;

      final matchesSearch =
          suggestion["suggestions"]!
              .toLowerCase()
              .contains(searchQuery.toLowerCase());

      return matchesStatus && matchesSearch;
    }).toList();
  }

  List<Map<String, String>> get filteredSuggestions2 {
    return suggestions2.where((suggestion2) {
      final matchesStatus =
          selectedStatus == "All Status" ||
              suggestion2["status"] == selectedStatus;

      final matchesSearch =
          suggestion2["suggestions"]!
              .toLowerCase()
              .contains(searchQuery.toLowerCase());

      return matchesStatus && matchesSearch;
    }).toList();
  }

  List<Map<String, String>> get filteredSuggestions3 {
    return suggestions3.where((suggestion3) {
      final matchesStatus =
          selectedStatus == "All Status" ||
              suggestion3["status"] == selectedStatus;

      final matchesSearch =
          suggestion3["suggestions"]!
              .toLowerCase()
              .contains(searchQuery.toLowerCase());

      return matchesStatus && matchesSearch;
    }).toList();
  }

  List<Map<String, String>> get filteredSuggestions4 {
    return suggestions4.where((suggestion4) {
      final matchesStatus =
          selectedStatus == "All Status" ||
              suggestion4["status"] == selectedStatus;

      final matchesSearch =
          suggestion4["suggestions"]!
              .toLowerCase()
              .contains(searchQuery.toLowerCase());

      return matchesStatus && matchesSearch;
    }).toList();
  }

  List<Map<String, String>> get filteredSuggestions5 {
    return suggestions5.where((suggestion5) {
      final matchesStatus =
          selectedStatus == "All Status" ||
              suggestion5["status"] == selectedStatus;

      final matchesSearch =
          suggestion5["suggestions"]!
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
                    "Suggestions",
                    style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Track the status of your submitted suggestions",
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
                        ...filteredSuggestions.map(_buildSuggestionRow).toList(),
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
                        ...filteredSuggestions2.map(_buildSuggestionRow2).toList(),
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
                        ...filteredSuggestions3.map(_buildSuggestionRow3).toList(),
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
                        ...filteredSuggestions4.map(_buildSuggestionRow4).toList(),
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
                        ...filteredSuggestions5.map(_buildSuggestionRow5).toList(),
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
            "ID",
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
            "Suggestions",
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
            "Date",
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
            "Business Unit",
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
                SizedBox(width: 20),

        SizedBox(
          width: 150,
          child: Text(
            "Justification",
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
  /// Suggestions ROW
  /// ===============================
Widget _buildSuggestionRow(Map<String, String> suggestion) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 14), // ✅ vertical spacing
    child: Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            suggestion["id"]!,
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
            suggestion["suggestions"]!,
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
            suggestion["date"]!,
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
            suggestion["business_unit"]!,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ),

        const SizedBox(width: 20),

        SizedBox(
          width: 140,
          child: _buildStatusBadge(suggestion["status"]!),
        ),

        const SizedBox(width: 20),

        SizedBox(
          width: 150,
          child: Text(
            suggestion["justification"]!,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ),

      ],
    ),
  );
}
Widget _buildSuggestionRow2(Map<String, String> suggestion2) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 14), // ✅ vertical spacing
    child: Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            suggestion2["id"]!,
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
            suggestion2["suggestions"]!,
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
            suggestion2["date"]!,
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
            suggestion2["business_unit"]!,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ),

        const SizedBox(width: 20),

        SizedBox(
          width: 140,
          child: _buildStatusBadge(suggestion2["status"]!),
        ),

        const SizedBox(width: 20),

        SizedBox(
          width: 150,
          child: Text(
            suggestion2["justification"]!,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ),

      ],
    ),
  );
}
Widget _buildSuggestionRow3(Map<String, String> suggestion3) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 14), // ✅ vertical spacing
    child: Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            suggestion3["id"]!,
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
            suggestion3["suggestions"]!,
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
            suggestion3["date"]!,
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
            suggestion3["business_unit"]!,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ),

        const SizedBox(width: 20),

        SizedBox(
          width: 140,
          child: _buildStatusBadge(suggestion3["status"]!),
        ),

        const SizedBox(width: 20),

        SizedBox(
          width: 150,
          child: Text(
            suggestion3["justification"]!,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ),

      ],
    ),
  );
}
Widget _buildSuggestionRow4(Map<String, String> suggestion4) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 14), // ✅ vertical spacing
    child: Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            suggestion4["id"]!,
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
            suggestion4["suggestions"]!,
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
            suggestion4["date"]!,
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
            suggestion4["business_unit"]!,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ),

        const SizedBox(width: 20),

        SizedBox(
          width: 140,
          child: _buildStatusBadge(suggestion4["status"]!),
        ),

        const SizedBox(width: 20),

        SizedBox(
          width: 150,
          child: Text(
            suggestion4["justification"]!,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ),

      ],
    ),
  );
}
Widget _buildSuggestionRow5(Map<String, String> suggestion5) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 14), // ✅ vertical spacing
    child: Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            suggestion5["id"]!,
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
            suggestion5["suggestions"]!,
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
            suggestion5["date"]!,
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
            suggestion5["business_unit"]!,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ),

        const SizedBox(width: 20),

        SizedBox(
          width: 140,
          child: _buildStatusBadge(suggestion5["status"]!),
        ),

        const SizedBox(width: 20),

        SizedBox(
          width: 150,
          child: Text(
            suggestion5["justification"]!,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
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
      case "Approved":
        bgColor = Colors.green.withOpacity(0.2);
        textColor = Colors.green;
        break;
      case "Declined":
        bgColor = Colors.red.withOpacity(0.2);
        textColor = Colors.red[800]!;
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