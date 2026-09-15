import 'package:evently/core/routes_manager.dart';
import 'package:evently/core/vaildator/validator.dart';
import 'package:flutter/material.dart';

import '../../../core/assets_manager.dart';
import '../../../core/widgets/custom_elevated_buttom.dart';
import '../../../core/widgets/custom_text_button.dart';
import '../../../core/widgets/custometext.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailcontroller  ;
  late TextEditingController passcontroller  ;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailcontroller = TextEditingController();
    passcontroller = TextEditingController();
  }
  @override
  void dispose() {
    emailcontroller.dispose();
    passcontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(ImageAssets.logo),
                SizedBox(height: 30,),
                Text('Login To your Account' , style: Theme.of(context).textTheme.headlineLarge ,)
                ,SizedBox(height: 16,)
                ,Custometext(validator:Validator.validemail,controller :emailcontroller, hinttext: "Enter your Email",prefixicon: Icon(Icons.email),),
                SizedBox(height: 16,)
                ,Custometext(validator:Validator.validpass,controller: passcontroller,hinttext: "Enter your Password",prefixicon: Icon(Icons.lock),sufixicon: Icon(Icons.visibility),),
                SizedBox(height: 8,),
                CustomTextButton(text: "Forget password",textalign: TextAlign.end, ontap: (){})
                ,SizedBox(height: 52,),
                CustomElevatedButtom(title: 'Login', onpress: login) ,             SizedBox(height: 24,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an Account ?  " , style: Theme.of(context).textTheme.bodySmall,)
                    ,CustomTextButton(text: "Signup", ontap: (){
                      Navigator.pushReplacementNamed(context, RoutesManager.registerscreen);
                    })
                  ],
                )

              ],
            ),
          ),
        ),
      ),

    );
  }
  void login() {
    if (formkey.currentState!.validate() == false) return;
  }
}
