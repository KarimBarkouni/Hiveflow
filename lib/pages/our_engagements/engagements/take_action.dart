import 'package:flutter/material.dart';
import '../../bottom_navbar.dart';

class TakeAction extends StatefulWidget {
  const TakeAction({Key? key}) : super(key: key);

  @override
  State<TakeAction> createState() =>
      _TakeActionState();
}

class _TakeActionState
    extends State<TakeAction> {
  

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
                    "Take Action",
                    style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Participate in or host ICESCO activities and initiatives",
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
                  GridView.count(
              crossAxisCount: 1,
              crossAxisSpacing: 20,
              mainAxisSpacing: 25,
              childAspectRatio: 2.5,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _quickCard( "First goal","Strengthening the capacity of educational systems in Member States to ensure sustainable development and reduce inequality", primary, () {
                
                }),
                
                _quickCard( "Second goal","Accelerating the Islamic World countries integration into the global economies and sustainable societies focusing on the production of knowledge, scientific development, innovation, strategic foresight and environmental protection", primary, () {
                 
                }),
             
                _quickCard( "Third goal","Contributing to achieving social development, consolidating the foundations of peace and security, and building sustainable societies", primary, () {
                 
                }),
              
                _quickCard( "Fourth goal","Contributing in the overall cultural development of the Islamic world communities, encouraging cultural diversity and dialogue among civilizations, protecting heritage while respecting local specificities and our Islamic identity", primary, () {
         
                }),
     
                _quickCard( "Fifth goal","Achieving coherence, integration and strategic coordination among the Islamic world countries in the Organization's areas of work by creating an institutional environment characterized by efficiency, effectiveness and good governance", primary, () {
                  
                }),
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
   static Widget _quickCard(
  String title,
  String subtitle,
  Color primary,
  VoidCallback onTap,
) {
  return Material(
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(20),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        constraints: const BoxConstraints(minHeight: 90), // 👈 smaller height
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14, // 👈 reduced vertical padding
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // 👈 important
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: primary,
              ),
            ),
            const SizedBox(height: 6), // 👈 smaller spacing
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                height: 1.4,
                color: primary.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}