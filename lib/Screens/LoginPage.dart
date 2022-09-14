import 'package:customerapp/CustomWidgets/customWidgets.dart';
import 'package:customerapp/Screens/HomeScreen.dart';
import 'package:customerapp/main_screen.dart';
import 'package:customerapp/provider/DashBoardProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  dynamic h, w;
  final numberController = TextEditingController();
  final otpController = TextEditingController();

  bool sendOtp = false;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    DashBoardProvider dashBoardProvider = Provider.of(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: h,
        width: w,
        margin: EdgeInsets.symmetric(horizontal: w * 0.05),
        child: sendOtp
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // const Text(
                  //   "Login Screen",
                  //   style: TextStyle(
                  //       fontSize: 40,
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.black54),
                  // ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Enter Your Otp",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                        )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomWidgets.customTextField(w, 6, TextInputType.number,
                          otpController, null, "OTP")
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                      onPressed: () async {

                        if (otpController.text.isNotEmpty &&
                            otpController.text.length == 6) {

                          await dashBoardProvider.changeScreenIndex(0, context);
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (BuildContext context) =>
                              const MainScreen()));
                        }
                        else{
                          CustomWidgets().snakbar("Invalid OTP Entered", context);
                        }

                      },
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: Text("Verify"),
                        ),
                      ))
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Login Screen",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Enter Your Mobile Number",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                        )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomWidgets.customTextField(w, 10, TextInputType.number,
                          numberController, null, "Mobile Number")
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (numberController.text.isNotEmpty &&
                            numberController.text.length == 10) {
                          setState(() {
                            sendOtp = true;
                          });
                        }
                        else{
                          CustomWidgets().snakbar("Please enter 10 digit number", context);
                        }
                      },
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: Text("Sent Otp"),
                        ),
                      ))
                ],
              ),
      ),
    );
  }
}
