import 'package:evently/core/assets_manager.dart';
import 'package:evently/core/colors_manager.dart';
import 'package:evently/core/widgets/custom_elevated_buttom.dart';
import 'package:evently/core/widgets/custometext.dart';
import 'package:flutter/material.dart';

import '../../../core/routes_manager.dart';
import '../../../core/widgets/custom_text_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(ImageAssets.logo),
              SizedBox(height: 24,),
              Text('Create your Account' , style: Theme.of(context).textTheme.headlineLarge ,)
              ,SizedBox(height: 16,)
              ,Custometext(hinttext: "Enter your Name",prefixicon: Icon(Icons.person),),
              SizedBox(height: 16,)
              ,Custometext(hinttext: "Enter your Email",prefixicon: Icon(Icons.email),),
              SizedBox(height: 16,)
              ,Custometext(hinttext: "Enter your Password",prefixicon: Icon(Icons.lock),sufixicon: Icon(Icons.visibility),),
              SizedBox(height: 16,)
              ,Custometext(hinttext: "Confirm your password",prefixicon: Icon(Icons.lock),sufixicon: Icon(Icons.visibility)),
              SizedBox(height: 52,),
           CustomElevatedButtom(title: 'Sign-Up', onpress: (){}) ,             SizedBox(height: 24,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an Account ? " , style: Theme.of(context).textTheme.bodySmall,)
                  ,CustomTextButton(text: "Login", ontap: (){
                    Navigator.pushReplacementNamed(context, RoutesManager.loginscreen);

                  })
                ],
              )

              ],
          ),
        ),
      ),

    );
  }
}
