import 'package:customerapp/CustomWidgets/BottomNavigationCustom.dart';
import 'package:customerapp/provider/DashBoardProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const BottomNavigationCustom(),
      body: Consumer<DashBoardProvider>(builder: (context, dashBoardProvider, child) {
        return dashBoardProvider.screenList[dashBoardProvider.currentIndex];
      },),
    );
  }
}
