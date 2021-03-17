//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:recipe_batao/screens/profile/profileEdit.dart';
//import 'package:recipe_batao/screens/profile/profile.dart';

import 'auth/auth.dart';
import 'drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  static MaterialPageRoute get route => MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color c = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signed in'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          Center(
            child: Material(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileEdit()),
                  );
                },
                child: Text(
                  'Complete profile now',
                  style: TextStyle(color: c),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Center(
            child: RaisedButton(
              onPressed: () {
                context.signOut();
                Navigator.of(context).push(AuthScreen.route);
              },
              child: const Text('Sign out'),
            ),
          ),
        ],
      ),
    );
  }
}
