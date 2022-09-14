

import 'package:customerapp/CustomWidgets/customWidgets.dart';
import 'package:customerapp/Screens/InsuranceScreen.dart';
import 'package:customerapp/Screens/KycScreen.dart';
import 'package:customerapp/Screens/LimitScreen.dart';
import 'package:customerapp/Screens/NotificationScreen.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  _NavigationDrawerWidgetState createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {

  dynamic height, width;
  String name = "",email = "";

  @override
  void initState() {
    getUser();
    super.initState();
  }

  getUser()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      name = pref.getString('name')!;
      email = pref.getString('email')!;
    });
  }

  @override
  Widget build(BuildContext context) {

    // var profile = Provider.of<SignInProvider>(context,listen: false);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Icon(Icons.close),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: height*0.1,
                    width: width*0.2,
                    margin: const EdgeInsets.only(top: 10,right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: const Color(0xffD5DDE0))
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: const Icon(Icons.person,size: 45,),
                      // child: profile.imageUrl.isEmpty ? Image.asset("assets/images/person-icon.png",fit: BoxFit.fill) :
                      // Image.network(profile.imageUrl,fit: BoxFit.fill,),
                    )
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10,right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  const [
                      Text(/*profile.userName.capitalize()*/"DemoUser",style: TextStyle(
                          fontSize: 16,color: Color(0xffBE0027),fontWeight: FontWeight.bold
                      ),),
                      SizedBox(height: 8,),
                      Text(/*profile.userEmail*/"DemoUser@gmail.com",style:TextStyle(fontSize: 13,),),
                      // const SizedBox(height: 8,),

                    ],
                  ),
                ),

              ],
            ),
            const SizedBox(height: 10,),
            const Divider(color: Color.fromRGBO(0, 0, 0, 0.3),),
            text("Notifications",onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationScreen()));
            }),
            text("View Limits",onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const LimitScreen()));
            }),
            text("Upload KYC",onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const KycScreen()));
            }),

            text("Insurance",onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const InsuranceScreen()));
            }),
            text("Log out",onTap: (){

              showDialog(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(
                      builder: (context, setState) {
                        return AlertDialog(
                          title: const Text('Are you sure want to Logout?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: const Text('No'),
                            ),
                            // Consumer<SignInProvider>(
                            //   builder: (context, value, child) {
                            //     return value.logoutLoader ? const CircularProgressIndicator() :
                                TextButton(
                                  onPressed: () async{
                                    Navigator.pop(context, false);
                                    // update();
                                  }, // passing true
                                  child: const Text('Yes'),
                                ),
                              // },
                            // ),
                          ],
                        );
                      },
                    );
                  });
            }),
          ],
        ),
      ),
    );
  }

  Widget text(String text, {Function? onTap}){
    return InkWell(
      onTap: (){
        onTap!();
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10,top: 10,left: 8),
          child: Text(text,style: const TextStyle(
            color: Colors.black,fontWeight: FontWeight.w700,fontSize: 16,
          ),),
        ),
      ),
    );
  }

  update()async{
    SharedPreferences pref = await SharedPreferences.getInstance();

    // var cart = Provider.of<SignInProvider>(context,listen: false);
    ProgressDialog progressDialog = ProgressDialog(
      context,
      blur: 0,
      dialogTransitionType: DialogTransitionType.Shrink,
      message: const Text("    Loading..."),
    );
    progressDialog.setLoadingWidget(const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Color(0xffBE0027)),
    ));
    progressDialog.show();
    pref.remove('apiKey');
    CustomWidgets().snakbar("Logout successfully", context);
    progressDialog.dismiss();
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignIn()));
    // cart.logoutApi().then((val){
    //   if(val['success'] == true){
    //     pref.remove('apiKey');
    //     ConstantMethods().snakbar("Logout successfully", context);
    //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignIn()));
    //   }
    // });
  }
}