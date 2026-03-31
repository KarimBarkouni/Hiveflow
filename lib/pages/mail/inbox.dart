import 'package:flutter/material.dart';
import 'mail.dart';

class Messageinbox extends StatefulWidget {
  const Messageinbox({super.key});

  @override
  State<Messageinbox> createState() => _MessageinboxState();
}

class _MessageinboxState extends State<Messageinbox> {

  bool isReceivedSelected = true;
  DateTime? selectedDate;

  Future<void> _pickDate() async {
  DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2020),
    lastDate: DateTime(2100),

    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          dialogBackgroundColor: Colors.white, // popup background
          colorScheme: const ColorScheme.light(
            primary: Color(0xFF1F7A7A), // header color
            onPrimary: Colors.white, // header text
            onSurface: Colors.black, // calendar text
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Color(0xFF1F7A7A), // OK / CANCEL color
            ),
          ),
        ),
        child: child!,
      );
    },
  );

  if (picked != null) {
    setState(() {
      selectedDate = picked;
    });
  }
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
                    Mail(),
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
                    "Message Inbox",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "View and manage your communications",
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
             Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [

                  /// SEARCH BAR
                  TextField(
                    style: const TextStyle(
                      color: Colors.black, // ✅ typed text color
                    ),
                    decoration: InputDecoration(
                      hintText: "Search by subject, sender, or recipient...",
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
                  ),

                  const SizedBox(height: 20),

                  /// BUTTONS + DATE FILTER
                  Row(
                    children: [

                      /// RECEIVED
                      _buildTabButton(
                        title: "Received Messages",
                        selected: isReceivedSelected,
                        onTap: () {
                          setState(() {
                            isReceivedSelected = true;
                          });
                        },
                      ),

                      const SizedBox(width: 10),

                      /// SENT
                      _buildTabButton(
                        title: "Sent Messages",
                        selected: !isReceivedSelected,
                        onTap: () {
                          setState(() {
                            isReceivedSelected = false;
                          });
                        },
                      ), 
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        "Filter by Date:",
                        style: TextStyle(fontWeight: FontWeight.w600, color: primary),
                      ),

                      const SizedBox(width: 10),

                      /// DATE PICKER
                      InkWell(
                        onTap: _pickDate,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color:primary),
                          ),
                          child: Row(
                            children: [
                              Text(
                                selectedDate == null
                                    ? "mm/dd/yyyy"
                                    : "${selectedDate!.month}/${selectedDate!.day}/${selectedDate!.year}",style: TextStyle(color: primary),
                              ),
                              const SizedBox(width: 10),
                              const Icon(Icons.calendar_today, size: 18),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
  Widget _buildTabButton({
    required String title,
    required bool selected,
    required VoidCallback onTap,
  }) {
    final primary = const Color(0xFF1F7A7A);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: selected ? primary : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: primary),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
            )
          ],
        ),
        child: Text(
          title,
          style: TextStyle(
            color: selected ? Colors.white : primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}