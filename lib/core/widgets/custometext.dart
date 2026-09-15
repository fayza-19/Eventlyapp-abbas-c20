import 'package:evently/core/vaildator/validator.dart';
import 'package:flutter/material.dart';

import '../colors_manager.dart';

class Custometext extends StatelessWidget {
  Custometext ({required this.hinttext , this.prefixicon ,this.sufixicon ,  this.controller , this.validator , this.lines = 1});
  String hinttext;
  Widget? prefixicon;
  Widget? sufixicon;
  TextEditingController? controller;
  String? Function(String?)? validator;
  int lines ;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
        maxLines: lines,

        validator:validator ,
      controller: controller,
        decoration: InputDecoration(
          prefixIcon: prefixicon,
            hintText: hinttext,
          suffixIcon: sufixicon,

        )
    );
  }
}
