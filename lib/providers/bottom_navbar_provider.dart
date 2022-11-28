
import 'package:flutter/cupertino.dart';
import 'package:spotify_api_exam_yasin/ui/pages/details_page.dart';
import 'package:spotify_api_exam_yasin/ui/pages/home_page.dart';
import 'package:spotify_api_exam_yasin/ui/pages/search_page.dart';
import 'package:spotify_api_exam_yasin/ui/pages/users_page.dart';

class BottomNavbarProvider extends ChangeNotifier{

  int selectedIndex = 0;

  Widget? getChangePage(){
    switch (selectedIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const SearchPage();
      case 2:
        return const UsersPage();
    }
    //notifyListeners();
  }

  getChangeIndex(int index){
    selectedIndex = index;
    notifyListeners();
  }

}