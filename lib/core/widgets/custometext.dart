import 'package:flutter/material.dart';

import '../colors_manager.dart';

class Custometext extends StatelessWidget {
  Custometext ({required this.hinttext , this.prefixicon ,this.sufixicon});
  String hinttext;
  Widget? prefixicon;
  Widget? sufixicon;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
          prefixIcon: prefixicon,
            hintText: hinttext,
          suffixIcon: sufixicon,

        )
    );
  }
}
