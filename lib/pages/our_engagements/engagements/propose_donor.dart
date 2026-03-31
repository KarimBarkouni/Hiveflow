import 'package:flutter/material.dart';
import '../../bottom_navbar.dart';

class ProposeDonor extends StatefulWidget {
  const ProposeDonor({Key? key}) : super(key: key);

  @override
  State<ProposeDonor> createState() =>
      _ProposeDonorState();
}

class _ProposeDonorState
    extends State<ProposeDonor> {
  String? selectedCategory;
  String? selectedSize;
  String? selectedScope;
  String? selectedCommunication;
  Map<String, bool> checkboxValues = {};

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
                    "Propose a Donor",
                    style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Submit potential donor information to support ICESCO's initiatives",
                    textAlign: TextAlign.center, 
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
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [

                  /// =======================
                  /// GENERAL INFORMATION
                  /// =======================
                  _sectionCard(
                    title: "General Information",
                    primary: primary,
                    child: Column(
                      children: [
                        _twoFieldsRow(
                          _textField("Donor Name", hint: "Full official name",primary: primary),
                          _dropdownField(
                            label: "Category/Type",
                            primary: primary,
                            value: selectedCategory,
                            options: [
                              "Private sector company",
                              "Government-affiliated development organization",
                              "Investment fund or authority",
                              "Public funding institution / Foundation",
                              "Development/financial organization",
                              "Individual philanthropist",
                            ],
                            onChanged: (value) {
                              setState(() {
                                selectedCategory = value;
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        _twoFieldsRow(
                          _dropdownField( 
                            label: "Organization Size",
                            primary: primary,
                            value: selectedSize,
                            options: [
                              "Small",
                              "Medium",
                              "Large",
                            ],
                            onChanged: (value) {
                              setState(() {
                                selectedSize = value;
                              });
                            },),
                          _dropdownField(
                            label: "Country/Region Scope",
                            primary: primary,
                            value: selectedScope,
                            options: [
                              "National",
                              "Regional",
                              "Global",
                            ],
                            onChanged: (value) {
                              setState(() {
                                selectedScope = value;
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        _textArea("Background/History",primary: primary),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// =======================
                  /// CONTACT INFORMATION
                  /// =======================
                  _sectionCard(
                    title: "Contact Information",
                    primary: primary,
                    child: Column(
                      children: [
                        _twoFieldsRow(
                          _textField("Address", primary: primary),
                          _textField("Email", primary: primary),
                        ),
                        const SizedBox(height: 20),
                        _twoFieldsRow(
                          _textField("Phone Number", primary: primary),
                          _textField("Mobile Number", primary: primary),
                        ),
                        const SizedBox(height: 20),
                        _twoFieldsRow(
                          _textField("Website", hint: "Official website", primary: primary),
                          _dropdownField(
                            label: "Preferred Communication Method",
                            primary: primary,
                            value: selectedCommunication,
                            options: [
                              "Email",
                              "Phone",
                              "Other",
                            ],
                            onChanged: (value) {
                              setState(() {
                                selectedCommunication = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// =======================
                  /// FUNDING DETAILS
                  /// =======================
                  _sectionCard(
                    title: "Funding Details",
                    primary: primary,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text("Type of Support Provided",
                            style: TextStyle(fontWeight: FontWeight.w600,color: primary)),
                        const SizedBox(height: 10),
                        _checkboxWrap([
                          "Grants",
                          "Loans",
                          "Technical assistance",
                          "In-kind contributions",
                          "Matching funds",
                          
                        ], primary: primary),

                        const SizedBox(height: 25),

                        Text("Funding Focus Areas",
                            style: TextStyle(fontWeight: FontWeight.w600,color: primary)),
                        const SizedBox(height: 10),
                        _checkboxWrap([
                          "Education",
                          "Research & Development",
                          "Health",
                          "Social development",
                          "Culture",
                          "Science and technology",
                          "Economic development",
                          "Youth empowerment",
                          "Heritage",
                          "Artificial Intelligence",
                          "Climate and environment",
                          "Community Development",
                        ], primary: primary),

                        const SizedBox(height: 25),

                        _twoFieldsRow(
                          _textArea("Geographic Focus",
                              hint: "Regions or countries where they fund projects",primary: primary),
                          _textArea("Average Grant Size",
                              hint: "Typical funding amounts and cycles",primary: primary),
                        ),

                        const SizedBox(height: 20),

                        _textArea("Eligibility Criteria",
                            hint: "Key requirements for funding",primary: primary),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// Submit Button
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        padding:
                            const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Submit Donor Proposal",
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                      ),
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

  /// ===============================
  /// SECTION CARD
  /// ===============================
  static Widget _sectionCard({
    required String title,
    required Widget child,
    required Color primary,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: primary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 25),
          child,
        ],
      ),
    );
  }

  /// ===============================
  /// TWO COLUMN ROW
  /// ===============================
  static Widget _twoFieldsRow(Widget left, Widget right) {
    return Row(
      children: [
        Expanded(child: left),
        const SizedBox(width: 20),
        Expanded(child: right),
      ],
    );
  }

  /// ===============================
  /// TEXT FIELD
  /// ===============================
 static Widget _textField(String label,
    {String? hint, required Color primary}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13,
            color: primary,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          style: TextStyle(color: primary), // 👈 typed text
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: primary.withOpacity(0.6)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: primary.withOpacity(0.4)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: primary),
            ),
            isDense: true,
          ),
        ),
      ],
    );
  }

  /// ===============================
  /// TEXT AREA
  /// ===============================
  static Widget _textArea(String label,
    {String? hint, required Color primary}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13,
            color: primary,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          maxLines: 4,
          style: TextStyle(color: primary),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: primary.withOpacity(0.6)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: primary.withOpacity(0.4)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: primary),
            ),
          ),
        ),
      ],
    );
  }

  /// ===============================
  /// DROPDOWN FIELD
  /// ===============================
  static Widget _dropdownField({
    required String label,
    required Color primary,
    required List<String> options,
    required String? value,
    required Function(String?) onChanged,
  }) {
    final safeValue = options.contains(value) ? value : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13,
            color: primary,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: safeValue,
          isExpanded: true, // 👈 VERY IMPORTANT
          dropdownColor: Colors.white,
          style: TextStyle(color: primary),
          iconEnabledColor: primary,
          items: options.map((option) {
            return DropdownMenuItem<String>(
              value: option,
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  option,
                  style: TextStyle(color: primary),
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: primary.withOpacity(0.4)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: primary),
            ),
            isDense: true,
          ),
        ),
      ],
    );
  }
  /// ===============================
  /// CHECKBOX WRAP
  /// ===============================
  Widget _checkboxWrap(List<String> items,
    {required Color primary, int columns = 2}) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double itemWidth = constraints.maxWidth / columns;

        return Wrap(
          children: items.map((item) {
            checkboxValues.putIfAbsent(item, () => false);

            return SizedBox(
              width: itemWidth,
              child: Row(
                children: [
                  Checkbox(
                    value: checkboxValues[item],
                    activeColor: primary,
                    checkColor: Colors.white,
                    side: BorderSide(color: primary),
                    onChanged: (value) {
                      setState(() {
                        checkboxValues[item] = value ?? false;
                      });
                    },
                  ),
                  Expanded(
                    child: Text(
                      item,
                      style: TextStyle(color: primary),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}  