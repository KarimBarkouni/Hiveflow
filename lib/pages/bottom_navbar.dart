import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'home/home_page.dart';
import 'knowledge_hub/knowledge_hub.dart';
import 'member_states/member_states.dart';
import 'our_engagements/our_engagements.dart';
import 'profile/edit_profile.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatefulWidget {
  int initialIndex;

  BottomNavBar({super.key, this.initialIndex = 0});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  late int _currentIndex;
  late PageController _pageController;

  final List<Widget> _pages = [
    HomePage(),
    MemberStates(),
    KnowledgeHub(),
    OurEngagementsPage(),
    EditProfile(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    _pageController.jumpToPage(index);
  }

  Widget _buildNavItem(String svgPathDark, String svgPathLight, bool isSelected, int index) {
    final bool isSelected = _currentIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            isSelected ? svgPathDark : svgPathLight,
            color: Theme.of(context).colorScheme.primary,
            width: 30,
            height: 30,
          ),/*
          const SizedBox(height: 5),
          if (isSelected)
            Container(
              height: 3.5,
              width: 40,
              color: Theme.of(context).colorScheme.primary,
            ),*/
        ],
      ),
    );
  }

  Future<bool> _showExitDialog() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text("Exit App",style: TextStyle(color: Theme.of(context).colorScheme.primary),),
        content: Text("Are you sure you want to quit?",style: TextStyle(color: Colors.black)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true); // close dialog
              Future.delayed(Duration(milliseconds: 100), () {
                SystemNavigator.pop(); // 🚀 CLOSE APP
              });
            },
            child: Text("Exit",style: TextStyle(color:Colors.red)),
          ),
        ],
      ),
    ) ?? false;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_currentIndex != 0) {
          // 👉 Go to first tab instead of exiting
          _onItemTapped(0);
          return false;
        } else {
          // 👉 Show exit confirmation
          return await _showExitDialog();
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        body: PageView(
          controller: _pageController,
          physics: const BouncingScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: _pages,
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5 ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.white60,
                  blurRadius: 2,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BottomAppBar(
                color: Theme.of(context).colorScheme.surface,
                elevation: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildNavItem('assets/icons/home_dark.svg', 'assets/icons/home.svg', _currentIndex == 0, 0),
                    _buildNavItem('assets/icons/people_dark.svg', 'assets/icons/people_light.svg', _currentIndex == 1, 1),
                    _buildNavItem('assets/icons/notebook_dark.svg', 'assets/icons/notebook.svg', _currentIndex == 2, 2),
                    _buildNavItem('assets/icons/calender_dark.svg', 'assets/icons/calender.svg', _currentIndex == 3, 3),
                    _buildNavItem('assets/icons/profile_dark.svg', 'assets/icons/profile.svg', _currentIndex == 4, 4),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}