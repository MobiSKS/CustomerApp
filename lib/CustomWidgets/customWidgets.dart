import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomWidgets{

  static Widget customTextField(w,len, keyboardType, _controller, icon, hint) {
    return Container(
      width: w,
      // height: 60,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: const Color(0xff424056)),
      ),
      child: TextField(
        keyboardType: keyboardType,
        controller: _controller,
        inputFormatters: [
          LengthLimitingTextInputFormatter(len),

        ],
        style: const TextStyle(fontSize: 18, color: Colors.black87),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(8),
          prefixIcon: icon,
          hintText: hint,
          hintStyle: GoogleFonts.poppins(
              fontSize: 14,
              color: const Color(0xff81808E),
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }


  void snakbar(String text, BuildContext context){
    final snackBar = SnackBar(
      content: Text(text,style: const TextStyle(color: Colors.white),),
      backgroundColor: (Colors.black),
      duration: Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}