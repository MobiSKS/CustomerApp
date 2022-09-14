import 'package:flutter/material.dart';

class UserLimitScreen extends StatefulWidget {
  const UserLimitScreen({Key? key}) : super(key: key);

  @override
  State<UserLimitScreen> createState() => _UserLimitScreenState();
}

class _UserLimitScreenState extends State<UserLimitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("UserLimit Screen"),),
    );
  }
}
