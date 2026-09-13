import 'package:evently/core/colors_manager.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
   CustomTextButton ({super.key , required this.text , required this.ontap , this.textalign =TextAlign.start} );
String text;
VoidCallback ontap;
TextAlign textalign;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
        child: Text(text ,
          textAlign : textalign,style: TextStyle(
            decoration: TextDecoration.underline,
            fontSize: 14 , fontWeight: FontWeight.w500 , color: ColorsManager.darkBlue),));
  }
}
