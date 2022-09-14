import 'package:customerapp/provider/DashBoardProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class BottomNavigationCustom extends StatelessWidget {
  const BottomNavigationCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic width = MediaQuery.of(context).size.width;
    return Consumer<DashBoardProvider>(builder: (context, dashBoardProvider, child) {
      return  Container(
        height: 60,width: width,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                dashBoardProvider.changeScreenIndex(0, context );
              },
              child: SizedBox(
                width: 50,
                height: 50,
                child: Center(
                    child: Icon(
                      Icons.home,
                      size: 35,
                      color: dashBoardProvider.currentIndex == 0
                          ? const Color(0xffBE0027)
                          : const Color(0xffD9D8D8),
                    )),
              ),
            ),
            InkWell(
              onTap: () {
                dashBoardProvider.changeScreenIndex(1, context);
              },
              child: SizedBox(
                width: 50,
                height: 50,
                child: Center(
                  child: Icon(
                    Icons.category,
                    size: 35,
                    color: dashBoardProvider.currentIndex == 1
                        ? const Color(0xffBE0027)
                        : const Color(0xffD9D8D8),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                dashBoardProvider.changeScreenIndex(2, context);
              },
              child: SizedBox(
                width: 50,
                height: 50,
                child: Center(
                    child: Icon(
                      Icons.menu,
                      size: 35,
                      color: dashBoardProvider.currentIndex == 2
                          ? const Color(0xffBE0027)
                          : const Color(0xffD9D8D8),
                    )),
              ),
            ),
            InkWell(
              onTap: () {
                dashBoardProvider.changeScreenIndex(3, context);
              },
              child: SizedBox(
                width: 50,
                height: 50,
                child: Center(
                    child: Icon(
                      Icons.person,
                      size: 35,
                      color: dashBoardProvider.currentIndex == 3
                          ? const Color(0xffBE0027)
                          : const Color(0xffD9D8D8),
                    )),
              ),
            ),
          ],
        ),
      );
    },);
  }

}
