import 'package:flutter/material.dart';
import '../../../core/assets_manager.dart';
import '../../../core/colors_manager.dart';
class Profiletab extends StatelessWidget {
  const Profiletab({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 38, horizontal: 8),
        child: Column(
          children: [
            SizedBox(
              height: 32,
            ),
            Image.asset(ImageAssets.Profilepic),
            SizedBox(height: 16,),
            Text("Fayza tarek", style: Theme.of(context).textTheme.headlineMedium,)
            ,Text("Zoza@gmail.com", style: Theme.of(context).textTheme.labelSmall,)
            ,SizedBox(height: 32,),
            Card(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Dark Mode", style: Theme.of(context).textTheme.labelMedium,),
                  Spacer(),
                  Switch(
                      activeColor: ColorsManager.darkBlue,

                      value: false, onChanged: (isDarkEnabled){})
                ],
              ),
            )),
            SizedBox(height: 16,),
            Card(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Language", style: Theme.of(context).textTheme.labelMedium,),
                  Spacer(),

                  DropdownButton(
                    icon: Icon(Icons.arrow_forward_ios_outlined),
                    underline: Container(),
                    items: ["English", "Arabic"].map((val)=>DropdownMenuItem(value: val,child: Text(val))).toList(),
                    onChanged: (newLang) {
                                         },
                  )


                ],
              ),
            )),
            SizedBox(height: 16,),
            Card(child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text("Logout", style: Theme.of(context).textTheme.labelMedium,),
                  Spacer(),


                  Icon(Icons.logout)


                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}