import 'package:evently/core/assets_manager.dart';
import 'package:evently/core/colors_manager.dart';
import 'package:evently/core/vaildator/validator.dart';
import 'package:evently/core/widgets/custom_elevated_buttom.dart';
import 'package:evently/core/widgets/custometext.dart';
import 'package:flutter/material.dart';

import '../../../core/routes_manager.dart';
import '../../../core/widgets/custom_text_button.dart';

class RegisterScreen extends StatefulWidget {
   RegisterScreen({super.key });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
   late TextEditingController namecontroller ;

   late TextEditingController emailcontroller  ;

   late TextEditingController passcontroller  ;

   late TextEditingController confermpasscontroller ;

GlobalKey<FormState> formkey = GlobalKey<FormState>();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    namecontroller = TextEditingController();
    emailcontroller = TextEditingController();
    passcontroller = TextEditingController();
    confermpasscontroller = TextEditingController();

}
@override
  void dispose() {
    // TODO: implement dispose
    namecontroller.dispose();
    emailcontroller.dispose();
    passcontroller.dispose();
    confermpasscontroller.dispose();
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
                SizedBox(height: 24,),
                Text('Create your Account' , style: Theme.of(context).textTheme.headlineLarge ,)
                ,SizedBox(height: 16,)
                ,Custometext( Validator : Validator.validname,controller: namecontroller,hinttext: "Enter your Name",prefixicon: Icon(Icons.person),),
                SizedBox(height: 16,)
                ,Custometext(
                  Validator : Validator.validemail,
                  controller: emailcontroller,hinttext: "Enter your Email",prefixicon: Icon(Icons.email),),
                SizedBox(height: 16,)
                ,Custometext(Validator : Validator.validpass,controller: passcontroller,hinttext: "Enter your Password",prefixicon: Icon(Icons.lock),sufixicon: Icon(Icons.visibility),),
                SizedBox(height: 16,)
                ,Custometext(Validator : (input){
                  if(input != passcontroller.text){
                    return"Password doesn't match";
                  }
                  return null;
                },controller: confermpasscontroller,hinttext: "Confirm your password",prefixicon: Icon(Icons.lock),sufixicon: Icon(Icons.visibility)),
                SizedBox(height: 52,),
             CustomElevatedButtom(title: 'Sign-Up', onpress: _createAccount) ,             SizedBox(height: 24,),
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
      ),

    );
  }

  void _createAccount() {
 if (formkey.currentState!.validate() == false) return;
  }
}
