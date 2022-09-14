import 'package:flutter/material.dart';

class LimitScreen extends StatefulWidget {
  const LimitScreen({Key? key}) : super(key: key);

  @override
  State<LimitScreen> createState() => _LimitScreenState();
}

class _LimitScreenState extends State<LimitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Limit Screen"),),
    );
  }
}
