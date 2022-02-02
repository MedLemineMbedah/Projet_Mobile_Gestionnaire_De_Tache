import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:projects3/src/daos/user_dao.dart';
import 'package:projects3/src/models/user.dart';
import 'package:projects3/src/screens/signIn.dart';
import 'package:projects3/src/screens/controllers/user_controller.dart';
import 'package:provider/provider.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return  StreamProvider<User?>(
      create:(context)=> FirebaseAuth.instance.authStateChanges(),
      initialData: null,
      builder: (context,_) {
        return MaterialApp(
              // Providing a restorationScopeId allows the Navigator built by the
              // MaterialApp to restore the navigation stack when a user leaves and
              // returns to the app after it has been killed while running in the
              // background.
              restorationScopeId: 'app',

              // Provide the generated AppLocalizations to the MaterialApp. This
              // allows descendant Widgets to display the correct translations
              // depending on the user's locale.
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', ''), // English, no country code
              ],

              // Use AppLocalizations to configure the correct application title
              // depending on the user's locale.
              //
              // The appTitle is defined in .arb files found in the localization
              // directory.
              onGenerateTitle: (BuildContext context) =>
                  AppLocalizations.of(context)!.appTitle,

              // Define a light and dark color theme. Then, read the user's
              // preferred ThemeMode (light, dark, or system default) from the
              // SettingsController to display the correct theme.
              theme: ThemeData(),
              darkTheme: ThemeData.dark(),
              

              // Define a function to handle named routes in order to support
              // Flutter web url navigation and deep linking.
           builder: (context,_){
             return Consumer<User?>(
               builder: (context,user,_){
                 if(user == null){
                   return  LoginScreen();
                 }
                 return  FutureProvider<UserMadel?>(
                   create :(context) => UserDao.getUser(user!.uid),
                   initialData: null,
                   builder: (context,_) {
                      return LoginScreen();
                   }
               
               );
           },
            
            );
      }


    );

    });
     
      }
}
