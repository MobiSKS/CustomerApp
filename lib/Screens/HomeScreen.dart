import 'package:carousel_slider/carousel_slider.dart';
import 'package:customerapp/CustomWidgets/NavigationDrawerWidget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  dynamic h, w;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text(
          "Home Screen",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: h,
        width: w,
        // margin: EdgeInsets.symmetric(horizontal: w * 0.02),
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                  // border: Border.all(color: Colors.black87,width: 1)
              ),
              height: h * 0.3,
              width: w,
              margin: EdgeInsets.symmetric(horizontal: w * 0.02 ),
              // color: Colors.red,
              child: CarouselSlider.builder(
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    child: Center(
                        child: Image.network("https://www.pngall.com/wp-content/uploads/2/Credit-Card-PNG-HD-Image.png",
                            fit: BoxFit.cover/*, width: 1000*/)),
                  );
                },
                itemCount: 10,
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 1.5,
                  enlargeCenterPage: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
