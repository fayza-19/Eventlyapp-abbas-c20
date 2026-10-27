import 'package:evently/core/assets_manager.dart';
import 'package:evently/core/vaildator/validator.dart';
import 'package:evently/core/widgets/custom_elevated_buttom.dart';
import 'package:evently/core/widgets/custometext.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/routes_manager.dart';
import '../../../core/utils/dialogutils.dart';
import '../../../core/widgets/custom_google_login_button.dart';
import '../../../core/widgets/custom_text_button.dart';
import '../../../firebase_services/firebaseservices.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/user_model.dart';

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
                Text(AppLocalizations.of(context)!.create_your_account, style: Theme.of(context).textTheme.headlineLarge ,)
                ,SizedBox(height: 16,)
                ,Custometext( validator : Validator.validname,controller: namecontroller,hinttext: AppLocalizations.of(context)!.enter_your_name,prefixicon: Icon(Icons.person),),
                SizedBox(height: 16,)
                ,Custometext(
                  validator : Validator.validemail,
                  controller: emailcontroller,hinttext: AppLocalizations.of(context)!.enter_your_email,prefixicon: Icon(Icons.email),),
                SizedBox(height: 16,)
                ,Custometext(validator : Validator.validpass,controller: passcontroller,hinttext: AppLocalizations.of(context)!.enter_your_password,prefixicon: Icon(Icons.lock),sufixicon: Icon(Icons.visibility),),
                SizedBox(height: 16,)
                ,Custometext(validator : (input){
                  if(input != passcontroller.text){
                    return  AppLocalizations.of(context)!.password_dont_match;
                  }
                  return null;
                },controller: confermpasscontroller,hinttext: AppLocalizations.of(context)!.confirm_your_password,prefixicon: Icon(Icons.lock),sufixicon: Icon(Icons.visibility)),
                SizedBox(height: 52,),
             CustomElevatedButtom(title: AppLocalizations.of(context)!.sign_up, onpress: _createAccount) ,             SizedBox(height: 24,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text( AppLocalizations.of(context)!.already_have_an_account, style: Theme.of(context).textTheme.bodySmall,)
                    ,CustomTextButton(text: AppLocalizations.of(context)!.login, ontap: (){
                      Navigator.pushReplacementNamed(context, RoutesManager.loginscreen);
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
                  title: AppLocalizations.of(context)!.sign_up_with_google,
                  onpress:
                    signUpWithGoogle,
                ),

                ],
            ),
          ),
        ),
      ),

    );
  }

  void _createAccount() async{
 if (formkey.currentState!.validate() == false) return;
 try {
   DialogUtils.showLoading(context, dismissible: false);
   UserCredential userCredential = await FirebaseServices.createAccount(email: emailcontroller.text, password: passcontroller.text);
   UserModel user = UserModel(id: userCredential.user!.uid, name: namecontroller.text, email: emailcontroller.text ,   favouriteEventsIds: [],
   );
   await FirebaseServices.addUserToFireStore(user);
   DialogUtils.hideDialog(context);
   DialogUtils.showToast("User Registered Successfully", Colors.green);
   Navigator.pushReplacementNamed(context, RoutesManager.loginscreen);
 } on FirebaseAuthException catch (exception) {
   DialogUtils.hideDialog(context);
   if (exception.code == 'weak-password') {
     DialogUtils.showDialogMessage(context, message: "The password provided is too weak.", posTitle: "Try again", posAction: (){
       Navigator.pop(context);
     });

   } else if (exception.code == "email-already-in-use") {
     DialogUtils.showDialogMessage(context, message: "The account already exists for that email.", posTitle: "Try again", posAction: (){
       Navigator.pop(context);
     });

   }
 } catch (exception) {
   DialogUtils.hideDialog(context);
   DialogUtils.showDialogMessage(context, message: exception.toString(), posTitle: "Try again", posAction: (){
     Navigator.pop(context);
   });

 }
  }
   void signUpWithGoogle() async {
     try {
       DialogUtils.showLoading(context, dismissible: false);
       final user = await FirebaseServices.signInWithGoogle();
       DialogUtils.hideDialog(context);
       if (user == null) return;
       UserModel.currentUser = user;
       DialogUtils.showToast("User Registered Successfully", Colors.green);
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
