import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/assets_manager.dart';
import '../../../core/colors_manager.dart';
import '../../../core/routes_manager.dart';
import '../../../firebase_services/firebaseservices.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/user_model.dart';
import '../../../providers/lang_provider.dart';
import '../../../providers/theme_provider.dart';
class Profiletab extends StatelessWidget {
  const Profiletab({super.key});
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    LangProvider langProvider = Provider.of<LangProvider>(context);
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
            Text(UserModel.loggedInUser!.name,
                 style: Theme.of(context).textTheme.headlineMedium,)
            ,Text(UserModel.loggedInUser!.email,
          style: Theme.of(context).textTheme.labelSmall,)
            ,SizedBox(height: 32,),
            Card(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(AppLocalizations.of(context)!.dark_mode, style: Theme.of(context).textTheme.labelMedium,),
                  Spacer(),
                  Switch(
                      activeColor: ColorsManager.darkBlue,

                      value: themeProvider.isDark,
                      onChanged: (isDarkEnabled){
                    if (isDarkEnabled) {
                      themeProvider.changeAppTheme(ThemeMode.dark);
                    }else{
                      themeProvider.changeAppTheme(ThemeMode.light);
                    }
                  })
                ],
              ),
            )),
            SizedBox(height: 16,),
            Card(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(AppLocalizations.of(context)!.language, style: Theme.of(context).textTheme.labelMedium,),
                  Spacer(),

                  DropdownButton(
                    icon: Icon(Icons.arrow_forward_ios_outlined),
                    underline: Container(),
                    items: ["English", "Arabic"].map((val)=>DropdownMenuItem(value: val,child: Text(val))).toList(),
                    onChanged: (newLang) {
                      if(newLang == "English"){
                        langProvider.changeAppLang('en');
                      }else{
                        langProvider.changeAppLang('ar');
                      }
                                         },
                  )


                ],
              ),
            )),
            SizedBox(height: 16,),
            InkWell(
              onTap: ()async{
                await FirebaseServices.logOut();
                Navigator.pushReplacementNamed(context, RoutesManager.loginscreen);
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.logout,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Spacer(),

                      Icon(Icons.logout),
                    ],
                  ),
                ),
              ),
            ),          ],
        ),
      ),
    );
  }
}