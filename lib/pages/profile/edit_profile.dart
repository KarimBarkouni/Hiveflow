import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
              "Edit Profile",
              style: TextStyle(
                color: primary,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Update your member state information",
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
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [

            _sectionCard(
              title: "Basic Information",
              primary: primary,
              child: Column(
                children: [
                  _twoFieldsRow(
                    _textField("Country Name", hint: "Kingdom of Morocco",primary: primary),
                    _textField("Capital", hint: "Rabat",primary: primary),
                    
                  ),
                  const SizedBox(height: 20),
                  _twoFieldsRow(
                    _textField("Official Language", hint: "Arabic",primary: primary),
                    _textField("Official Leader", hint: "His Majesty the King Mohammed VI",primary: primary),  
                  ),
                  const SizedBox(height: 20),
                  _textField("National Day", hint: "", primary: primary),
                ],
              ),
            ),

            const SizedBox(height: 24),

            MinisterCard(sectionTitle: 'Ministers', name: 'H.E Mr. Mohamed Saad Barada', title: 'Minister of National Education, Preschool and Sports',),

            const SizedBox(height: 24),

              CommissionCard(),

            const SizedBox(height: 24),
            _sectionCard(
              title: "Contact Information",
              primary: primary,
              child: Column(
                children: [
                  _twoFieldsRow(
                    _textField("Email", hint: "m.tamenaoul@marocnatcom.ma",primary: primary),
                    _textField("Phone", hint: "05 37 65 43 21",primary: primary),
                    
                  ),
                  const SizedBox(height: 20),
                  _twoFieldsRow(
                    _textField("fax", hint: "05 37 65 43 21",primary: primary),
                    _textField("Website", hint: "www.marocnatcom.ma",primary: primary),  
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
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
                  "Save Changes",
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                ),
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
}

class MinisterCard extends StatefulWidget {
  final String sectionTitle;
  final String name;
  final String title;

  const MinisterCard({
    super.key,
    required this.sectionTitle,
    required this.name,
    required this.title,
  });

  @override
  State<MinisterCard> createState() => _MinisterCardState();
}

class _MinisterCardState extends State<MinisterCard> {
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked =
        await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      setState(() {
        _image = File(picked.path);
      });
    }
  }

  void _removeImage() {
    setState(() {
      _image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Section Title
          Text(
            widget.sectionTitle,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: primary,
            ),
          ),
          const SizedBox(height: 20),

          /// Name & Title Row
          Row(
            children: [
              Expanded(
                child: _buildField("Name", widget.name, primary),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: _buildField("Title", widget.title, primary),
              ),
            ],
          ),

          const SizedBox(height: 20),

          /// Profile Photo
          Text(
            "Profile Photo",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
              color: primary,
            ),
          ),
          const SizedBox(height: 10),

          _image == null
              ? GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey.shade400,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.upload_outlined,
                            color: Colors.grey.shade600),
                        const SizedBox(height: 8),
                        Text(
                          "Upload Photo",
                          style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                )
              : Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        _image!,
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      right: -8,
                      top: -8,
                      child: IconButton(
                        icon: const Icon(Icons.close,
                            color: Colors.red),
                        onPressed: _removeImage,
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildField(
      String label, String value, Color primary) {
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
        const SizedBox(height: 6),
        Container(
          padding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border:
                Border.all(color: primary.withOpacity(0.4)),
          ),
          child: Text(
            value,
            style: TextStyle(color: primary),
          ),
        ),
      ],
    );
  }
}

class CommissionCard extends StatefulWidget {
  const CommissionCard({super.key});

  @override
  State<CommissionCard> createState() => _CommissionCardState();
}

class _CommissionCardState extends State<CommissionCard> {
  File? headImage;
  File? secretaryImage;
  DateTime? sinceDate;

  Future<void> _pickImage(bool isHead) async {
    final picker = ImagePicker();
    final picked =
        await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      setState(() {
        if (isHead) {
          headImage = File(picked.path);
        } else {
          secretaryImage = File(picked.path);
        }
      });
    }
  }

  void _removeImage(bool isHead) {
    setState(() {
      if (isHead) {
        headImage = null;
      } else {
        secretaryImage = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
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
            "Commission",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: primary,
            ),
          ),
          const SizedBox(height: 20),

          /// Head of Commission
          _buildPersonSection(
            context: context,
            title: "Head of Commission",
            image: headImage,
            primary: primary,
            onPick: () => _pickImage(true),
            onRemove: () => _removeImage(true),
            showExtraFields: false,
          ),

          const SizedBox(height: 30),

          /// Secretary General
          _buildPersonSection(
            context: context,
            title: "Secretary General",
            image: secretaryImage,
            primary: primary,
            onPick: () => _pickImage(false),
            onRemove: () => _removeImage(false),
            showExtraFields: true,
          ),

          const SizedBox(height: 40),
          const Divider(),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Commission Team",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: primary,
                ),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text(
                  "Add Team Member",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          )
        ],
      )
    );
  }

  Widget _buildPersonSection({
    required BuildContext context,
    required String title,
    required File? image,
    required VoidCallback onPick,
    required VoidCallback onRemove,
    required Color primary,
    required bool showExtraFields,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 15),

        _textField("Name", primary),
        const SizedBox(height: 15),

        _textField("Title", primary),
        const SizedBox(height: 15),

        if (showExtraFields) ...[
          _textField("Email", primary),
          const SizedBox(height: 15),
          _textField("Phone", primary),
          const SizedBox(height: 15),
          _dateField(context, primary),
          const SizedBox(height: 15),
        ],

        Text(
          "Profile Photo",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13,
            color: primary,
          ),
        ),
        const SizedBox(height: 10),

        image == null
            ? GestureDetector(
                onTap: onPick,
                child: Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: const Icon(Icons.upload_outlined),
                ),
              )
            : Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      image,
                      height: 110,
                      width: 110,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: -8,
                    top: -8,
                    child: IconButton(
                      icon: const Icon(Icons.close,
                          color: Colors.red),
                      onPressed: onRemove,
                    ),
                  ),
                ],
              ),
      ],
    );
  }

  Widget _textField(String label, Color primary) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: primary)),
        const SizedBox(height: 6),
        TextField(
          decoration: InputDecoration(
            isDense: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  BorderSide(color: primary.withOpacity(0.4)),
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

  Widget _dateField(BuildContext context, Color primary) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Since",
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: primary)),
        const SizedBox(height: 6),
        InkWell(
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: sinceDate ?? DateTime.now(),
              firstDate: DateTime(1950),
              lastDate: DateTime(2100),
            );

            if (picked != null) {
              setState(() => sinceDate = picked);
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border:
                  Border.all(color: primary.withOpacity(0.4)),
            ),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  sinceDate == null
                      ? "mm/dd/yyyy"
                      : "${sinceDate!.month}/${sinceDate!.day}/${sinceDate!.year}",
                  style: TextStyle(
                    color: sinceDate == null
                        ? Colors.grey
                        : primary,
                  ),
                ),
                Icon(Icons.calendar_today,
                    size: 18, color: primary)
              ],
            ),
          ),
        ),
      ],
    );
  }
}