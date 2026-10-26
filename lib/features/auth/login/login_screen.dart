import 'package:evently/core/routes_manager.dart';
import 'package:evently/core/vaildator/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/assets_manager.dart';
import '../../../core/utils/dialogutils.dart';
import '../../../core/widgets/custom_elevated_buttom.dart';
import '../../../core/widgets/custom_google_login_button.dart';
import '../../../core/widgets/custom_text_button.dart';
import '../../../core/widgets/custometext.dart';
import '../../../firebase_services/firebaseservices.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/user_model.dart';

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
                Text(AppLocalizations.of(context)!.login_to_your_account, style: Theme.of(context).textTheme.headlineLarge ,)
                ,SizedBox(height: 16,)
                ,Custometext(validator:Validator.validemail,controller :emailcontroller, hinttext: AppLocalizations.of(context)!.enter_your_email,prefixicon: Icon(Icons.email),),
                SizedBox(height: 16,)
                ,Custometext(validator:Validator.validpass,controller: passcontroller,hinttext: AppLocalizations.of(context)!.enter_your_password,prefixicon: Icon(Icons.lock),sufixicon: Icon(Icons.visibility),),
                SizedBox(height: 8,),
                CustomTextButton(text: AppLocalizations.of(context)!.forget_password,textalign: TextAlign.end, ontap: (){})
                ,SizedBox(height: 52,),
                CustomElevatedButtom(title: AppLocalizations.of(context)!.login, onpress: login) ,             SizedBox(height: 24,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppLocalizations.of(context)!.dont_have_an_account, style: Theme.of(context).textTheme.bodySmall,)
                    ,CustomTextButton(text:AppLocalizations.of(context)!.sign_up , ontap: (){
                      Navigator.pushReplacementNamed(context, RoutesManager.registerscreen);
                    })
                  ],
                ),
                SizedBox(height: 24,),
                Center(
                  child: Text(
                    AppLocalizations.of(context)!.or,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                SizedBox(height: 24,),
                CustomGoogleLoginButton(
                  title: AppLocalizations.of(context)!.login_with_google,
                  onpress:
                    loginWithGoogle
                  ,
                ),



              ],
            ),
          ),
        ),
      ),

    );
  }
  void login() async{
    if (formkey.currentState!.validate() == false) return;
    try{
      DialogUtils.showLoading(context, dismissible: false);
      UserCredential userCredential = await FirebaseServices.login(email: emailcontroller.text, password: passcontroller.text);
      UserModel user = await  FirebaseServices.getUserFromFireStore(userCredential.user!.uid);
      UserModel.loggedInUser = user;
      DialogUtils.hideDialog(context);
      DialogUtils.showToast("User Logged-In Successfully", Colors.green);
      Navigator.pushReplacementNamed(context, RoutesManager.mainlayout);
    }on FirebaseAuthException catch(exception){
      DialogUtils.hideDialog(context);
      DialogUtils.showDialogMessage(context, message: "Wrong email or password.",posTitle: "Try again",);
    }catch(exception){
      DialogUtils.hideDialog(context);
      DialogUtils.showDialogMessage(context, message: exception.toString(),posTitle: "Try again",);
    }


  }
  void loginWithGoogle() async {
    try {
      DialogUtils.showLoading(context, dismissible: false);
      final user = await FirebaseServices.signInWithGoogle();
      DialogUtils.hideDialog(context);
      if (user == null) return; // لغى الاختيار
      UserModel.loggedInUser = user;
      DialogUtils.showToast("User Logged-In Successfully", Colors.green);
      Navigator.pushReplacementNamed(context, RoutesManager.mainlayout);
    } catch (exception) {
      DialogUtils.hideDialog(context);
      DialogUtils.showDialogMessage(
        context,
        message: exception.toString(),
        posTitle: "Try again",
      );
    }
  }
}
