import 'dart:io';
import 'package:flutter/material.dart';
import 'mail.dart';
import 'package:file_picker/file_picker.dart';

class ContactDepartement extends StatefulWidget {
  const ContactDepartement({super.key});

  @override
  State<ContactDepartement> createState() => _ContactDepartementState();
}

class _ContactDepartementState extends State<ContactDepartement> {
  final List<String> commissions = [
    "Education Sector",
    "Director General Office",
    "General Secretariat of National Commissions and Conferences",
    "epartment of legal affairs and international standards",
    "Advisors",
    "Deputy Director General for Programs",
    "External Specialized Offices and Centers"
  ];

  List<String> selectedCommissions = [];
  String searchQuery = "";
  List<File> attachedFiles = [];

  Future<void> pickFiles() async {

  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['pdf', 'doc', 'docx'],
    allowMultiple: true,
  );

  if (result != null) {

    for (var file in result.files) {

      final fileSize = file.size / (1024 * 1024); // MB

      if (fileSize <= 10) {
        setState(() {
          attachedFiles.add(File(file.path!));
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("File must be under 10MB"),
          ),
        );
      }
    }
  }
}
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    final filtered = commissions
        .where((c) => c.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
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
                    "Contact Commission",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Communicate with National Commissions",
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// COMMISSIONS
                  const Text(
                    "Select Commissions (max 5)",
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54),
                  ),

                  const SizedBox(height: 10),

                  /// SEARCH
                  TextField(
                    style: const TextStyle(
                      color: Colors.black, // ✅ typed text color
                    ),
                    decoration: InputDecoration(
                      hintText: "Search commissions...",
                      hintStyle: TextStyle(
                        color: Colors.black45,
                      ),
                      prefixIcon: Icon(Icons.search, color: primary),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black45,
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                    ),
                  ),


                  const SizedBox(height: 10),

                  /// COMMISSION LIST
                  Container(
                    height: 180,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color:Colors.black),
                    ),
                    child: ListView(
                      children: filtered.map((commission) {

                        final isSelected =
                            selectedCommissions.contains(commission);

                        return CheckboxListTile(
                          side: const BorderSide(color: Colors.black),
                          title: Text(
                            commission,
                            style: const TextStyle(color: Colors.black87),
                          ),
                          value: isSelected,
                          activeColor: Colors.black, // checkbox when selected
                          checkColor: Colors.white,  // check icon color
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (value) {

                            if (value == true && selectedCommissions.length >= 5) return;

                            setState(() {
                              if (value == true) {
                                selectedCommissions.add(commission);
                              } else {
                                selectedCommissions.remove(commission);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// SUBJECT
                  const Text(
                    "Subject",
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54),
                  ),

                  const SizedBox(height: 8),

                  TextField(
                    decoration: InputDecoration(
                      hintText: "Enter message subject",
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black, width: 2),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// MESSAGE
                  const Text(
                    "Message",
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54),
                  ),

                  const SizedBox(height: 8),

                  TextField(
                    maxLines: 6,
                    decoration: InputDecoration(
                      hintText: "Type your message here...",
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black, width: 2),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// ATTACHMENTS
                  const Text(
                    "Attachments",
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54),
                  ),

                  const SizedBox(height: 10),

                  GestureDetector(
                    onTap: pickFiles,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey.shade400,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Column(
                        children: [

                          const Icon(Icons.upload_file, size: 40, color: Colors.grey),

                          const SizedBox(height: 10),

                          const Text(
                            "Upload files or tap here",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),

                          const SizedBox(height: 4),

                          const Text(
                            "PDF, DOC, DOCX up to 10MB each",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),

                          const SizedBox(height: 10),

                          /// FILE LIST
                          ...attachedFiles.map((file) {
                            return ListTile(
                              leading: const Icon(Icons.insert_drive_file),
                              title: Text(file.path.split('/').last),
                              trailing: IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () {
                                  setState(() {
                                    attachedFiles.remove(file);
                                  });
                                },
                              ),
                            );
                          }).toList(),

                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// SEND BUTTON
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.send, color: Colors.white),
                      label: const Text("Send Message", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}