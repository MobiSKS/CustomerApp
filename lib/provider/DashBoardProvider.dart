import 'package:customerapp/Screens/AllCategories.dart';
import 'package:customerapp/Screens/HomeScreen.dart';
import 'package:customerapp/Screens/ProfileScreen.dart';
import 'package:customerapp/Screens/UserLimitScreen.dart';
import 'package:flutter/material.dart';

import '../main_screen.dart';


class DashBoardProvider with ChangeNotifier{
  int currentIndex = 0;

  List screenList = [
    const HomeScreen(),
    const AllCategories(),
    const UserLimitScreen(),
    const ProfileScreen(),
  ];

  changeScreenIndex(int index, BuildContext context){
    currentIndex = index;
    notifyListeners();
    // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const MainScreen() ), (route) => false);

  }


}
