import 'package:flutter/material.dart';

class CustomElevatedButtom extends StatelessWidget {
   CustomElevatedButtom({super.key, required this.title,required this.onpress});
String title;
VoidCallback onpress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onpress, child: Text(title));
  }
}
