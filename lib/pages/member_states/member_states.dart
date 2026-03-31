import 'package:flutter/material.dart';
import 'country_details_page.dart';

class MemberStates extends StatefulWidget {
  const MemberStates({super.key});

  @override
  State<MemberStates> createState() => _MemberStatesState();
}

class _MemberStatesState extends State<MemberStates> {

  // Search controller and query
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = "";
  
// Selected values
  String selectedRegion = "All Regions";
  String selectedLanguage = "All Languages";

// Dropdown options
  final List<String> regions = ["All Regions", "Africa", "Asia", "America"];
  final List<String> languages = ["All Languages", "Arabic", "French", "English"];

// Sample country data
  final List<Map<String, String>> countries = [
    {
      "name": "Kingdom of Morocco",
      "capital": "Rabat",
      "date": "18 November",
      "region": "Africa",
      "flag": "https://flagcdn.com/w320/ma.png",
      "language": "Arabic",
      "leader": "His Majesty the King Mohammed VI",
    },
    {
      "name": "Republic of Azerbaijan",
      "capital": "Bakou",
      "date": "28 May",
      "region": "Asia",
      "flag": "https://flagcdn.com/w320/az.png",
      "language": "English",
      "leader": "His Excellency the President Ilham Aliyev",
    },
  ];

  // Filtered country list based on selected region
  List<Map<String, String>> get filteredCountries {
    return countries.where((country) {
      final matchesRegion =
          selectedRegion == "All Regions" ||
          country["region"] == selectedRegion;

      final matchesLanguage =
          selectedLanguage == "All Languages" ||
          country["language"] == selectedLanguage;

      final matchesSearch =
          country["name"]!
              .toLowerCase()
              .contains(searchQuery);

      return matchesRegion && matchesLanguage && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;

    return Scaffold(
      backgroundColor: theme.colorScheme.onSurface,
      appBar:AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        centerTitle: true, // Ensures the title is centered in the expanded space
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Member States",
              style: TextStyle(
                  color: primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            const SizedBox(height: 5),
            Text(
              "Explore ICESCO member states and their contributions",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: primary.withOpacity(0.7),
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Search Bar
            Container(
              padding:  EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color:  theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(30),
              ),
              child:  TextField(
                controller: _searchController,
                style: const TextStyle(color: Colors.black), 
                onChanged: (value) {
                  setState(() {
                    searchQuery = value.toLowerCase();
                  });
                },
                decoration: InputDecoration(
                  icon: const Icon(Icons.search, color: Colors.black),
                  hintText: "Search countries",
                  hintStyle: const TextStyle(color: Colors.black54),
                  border: InputBorder.none,
                  suffixIcon: searchQuery.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear, color: Colors.black),
                          onPressed: () {
                            _searchController.clear();
                            setState(() {
                              searchQuery = "";
                            });
                          },
                        )
                      : null,
                ),
              ),
            ),
            const SizedBox(height: 25),

            // 2. Filter Row
        // Filter Row
        Row(
          children: [
            const Text(
              "Filter by:",
              style: TextStyle(
                color: Color(0xFF00696B),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 15),

            // Region Dropdown
            _buildFunctionalDropdown(
              value: selectedRegion,
              items: regions,
              onChanged: (String? newValue) {
                setState(() {
                  selectedRegion = newValue!;
                });
              },
            ),

            const SizedBox(width: 10),

            // Language Dropdown
            _buildFunctionalDropdown(
              value: selectedLanguage,
              items: languages,
              onChanged: (String? newValue) {
                setState(() {
                  selectedLanguage = newValue!;
                });
              },
            ),
          ],
        ),
            const SizedBox(height: 25),

            // 3. Country Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.8,
              ),
              itemCount: filteredCountries.isEmpty ? 1 : filteredCountries.length,
              itemBuilder: (context, index) {
                if (filteredCountries.isEmpty) {
                  return const  Text("No countries found", style: TextStyle(color: Colors.black54, fontSize: 14));
                }
                final country = filteredCountries[index];

                return _buildCountryCard(
                  context,
                  country,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFunctionalDropdown({
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          dropdownColor: Colors.white,
          icon: const Icon(Icons.arrow_drop_down, color: Colors.black87),
          style: const TextStyle(
            color: Color(0xFF00696B),
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
          onChanged: onChanged,
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }


 Widget _buildCountryCard(
  BuildContext context,
  Map<String, String> country,
) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => CountryDetailsPage(
            name: country["name"]!,
            capital: country["capital"]!,
            nationalDay: country["date"]!,
            region: country["region"]!,
            flagUrl: country["flag"]!,
            language: country["language"]!,
            leader: country["leader"]!,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.network(
                country["flag"]!,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    country["name"]!,
                    style: const TextStyle(
                      color: Color.fromRGBO(15, 115, 120, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text("Capital: ${country["capital"]}",
                      style: const TextStyle(
                          fontSize: 10,
                          color: Color.fromRGBO(15, 115, 120, 1))),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "National Day: ${country["date"]}",
                          style: const TextStyle(
                              fontSize: 9,
                              color:
                                  Color.fromRGBO(15, 115, 120, 1)),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color:
                              const Color.fromRGBO(255, 202, 40, 1.0),
                          borderRadius:
                              BorderRadius.circular(10),
                        ),
                        child: Text(country["region"]!,
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}