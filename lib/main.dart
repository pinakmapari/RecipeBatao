import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';

import 'package:recipe_batao/screens/splash.dart';

import 'config/palette.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LitAuthInit(
      authProviders: const AuthProviders(
        emailAndPassword: true,
        apple: true,
        google: true,
        twitter: true,
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: GoogleFonts.muliTextTheme(),
            accentColor: Palette.darkBlue,
            appBarTheme: AppBarTheme(color: Colors.cyan[100], elevation: 3),
        ),
        // home: LitAuthState(
        //   authenticated: HomeScreen(),
        //   unauthenticated: AuthScreen(),
        // ),
        home: SplashScreen(),
      ),
    );
  }
}
