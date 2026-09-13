import 'package:flutter/material.dart';

import '../colors_manager.dart';

class Custometext extends StatelessWidget {
  Custometext ({required this.hinttext , this.prefixicon ,this.sufixicon , required this.controller, required this.Validator});
  String hinttext;
  Widget? prefixicon;
  Widget? sufixicon;
  TextEditingController controller;
  String? Function(String?) Validator;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: Validator,
      controller: controller,
        decoration: InputDecoration(
          prefixIcon: prefixicon,
            hintText: hinttext,
          suffixIcon: sufixicon,

        )
    );
  }
}
