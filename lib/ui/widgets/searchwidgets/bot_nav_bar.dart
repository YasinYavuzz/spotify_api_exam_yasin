import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_api_exam_yasin/providers/bottom_navbar_provider.dart';

class BotNavBar extends StatefulWidget {
  const BotNavBar({super.key});

  @override
  State<BotNavBar> createState() => _BotNavBarState();
}

class _BotNavBarState extends State<BotNavBar> {
  // int currentIndex = 0 ;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, BottomNavbarProvider value, Widget? child) { 
        return BottomNavigationBar(
          currentIndex: value.selectedIndex,
          onTap: (index) {
            // setState(() {
            //   currentIndex = value;
            //   print(currentIndex);
            // });
              value.getChangeIndex(index);
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.white,
          selectedLabelStyle: const TextStyle(
            height: 1.5,
            color: Colors.green
          ),
          unselectedLabelStyle: const TextStyle(
            color: Colors.white,
            height: 1.5
    
          ),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          backgroundColor: Colors.black.withOpacity(0.5),
          elevation: 1,
          items: [
            BottomNavigationBarItem(icon: Image.asset('assets/ic_home.png',color: value.selectedIndex == 0 ? Colors.green : Colors.white,height: 22,),label: 'Ana Sayfa'),
            BottomNavigationBarItem(icon: Image.asset('assets/ic_search.png',color: value.selectedIndex == 1 ? Colors.green : Colors.white,height: 22,),label: 'Search'),
            BottomNavigationBarItem(icon: Image.asset('assets/ic_spotify.png',color: value.selectedIndex == 2 ? Colors.green : Colors.white,height: 22,),label: 'Premium'),
          ],
        );
       },
      
    );
  }
}