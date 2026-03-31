import 'package:flutter/material.dart';
import '../host_specialized_meeting.dart';

class MinisterialConference extends StatefulWidget {
  const MinisterialConference({super.key});

  @override
  State<MinisterialConference> createState() => _MinisterialConferenceState();
}

class _MinisterialConferenceState extends State<MinisterialConference> {

  String? selectedMinisterialconference;
  
  DateTime? selectedConferencestartDate;
  DateTime? selectedConferenceendDate;

  Map<String, bool> checkboxValues = {};

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
                      HostSpecializedMeeting(),
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
                    "Ministerial Conference",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Specialized meetings for ministers of member states",
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
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [

                  /// =======================
                  /// MINISTERIAL INFORMATION
                  /// =======================
                  _sectionCard(
                    title: "Host Ministerial Conference",
                    primary: primary,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _dropdownField(
                          label: "Ministerial conference",
                          primary: primary,
                          value: selectedMinisterialconference,
                          options: [
                            "Environment ministers",
                            "Ministers of Education",
                            "Ministers of higher education and scientific research",
                            "Ministers of Culture",
                            "Ministers of Communications and Technology",
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedMinisterialconference = value;
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        _textField("Session Number", hint: "",primary: primary),
                        const SizedBox(height: 20),
                        _dateField(
                          context: context,
                          label: "Start Date",
                          primary: primary,
                          selectedDate: selectedConferencestartDate,
                          onDateSelected: (date) {
                            setState(() {
                              selectedConferencestartDate = date;
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        _dateField(
                          context: context,
                          label: "End Date",
                          primary: primary,
                          selectedDate: selectedConferenceendDate,
                          onDateSelected: (date) {
                            setState(() {
                              selectedConferenceendDate = date;
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        _textField("Hosting Place", hint: "",primary: primary),
                        const SizedBox(height: 20),
                        _textArea("Sponsorship Proposal",primary: primary),
                        const SizedBox(height: 20),
                        Text("Sponsorship Proposal", style: TextStyle(fontWeight: FontWeight.w600,color: primary)),
                        const SizedBox(height: 10),
                        _checkboxWrap([
                          "Seminar",
                          "Exhibition",
                          "Consultative meeting",
                          "Signing an agreement",
                        ], primary: primary),
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
                        "Submit Request",
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
  /// DATE FIELD
  /// ===============================

  static Widget _dateField({
  required BuildContext context,
  required String label,
  required Color primary,
  required DateTime? selectedDate,
  required Function(DateTime) onDateSelected,
}) {
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
      InkWell(
        onTap: () async {
          DateTime now = DateTime.now();

          final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: selectedDate ?? now,
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            builder: (context, child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.light(
                    primary: primary,
                    onPrimary: Colors.white,
                    onSurface: primary,
                  ),
                ),
                child: child!,
              );
            },
          );

          if (picked != null) {
            onDateSelected(picked);
          }
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: primary.withOpacity(0.4)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedDate != null
                    ? "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"
                    : "Select date",
                style: TextStyle(
                  color: selectedDate != null
                      ? primary
                      : primary.withOpacity(0.6),
                ),
              ),
              Icon(Icons.calendar_today, color: primary, size: 18),
            ],
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