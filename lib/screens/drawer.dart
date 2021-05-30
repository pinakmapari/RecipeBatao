import 'package:flutter/material.dart';
import 'package:recipe_batao/screens/profile/profile.dart';
import 'package:recipe_batao/screens/myKitchen/myKitchen.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:recipe_batao/screens/auth/auth.dart';
import 'package:recipe_batao/config/palette.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  final Future<String> _calculation = Future<String>.delayed(
    const Duration(seconds: 2),
    () => 'Loaded',
  );
  String userid;
  String name = 'Name';
  Stream doc;
  String img;
  @override
  void initState() {
    super.initState();
    final litUser = context.getSignedInUser();
    litUser.when((user) => userid = user.uid,
        empty: () {}, initializing: () {});
    doc = Firestore.instance.collection('users').document(userid).snapshots();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: DarkTheme.black,
      ),
      child: Drawer(
        child: Center(
          child: returnFutureBuilder(_calculation, doc),
        ),
      ),
    );
  }

  Widget returnFutureBuilder(
      Future<String> _calculation, Stream<DocumentSnapshot> doc) {
    return FutureBuilder(
      future: _calculation, // a previously-obtained Future<String> or null
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        //Database().fetchData();
        List<Widget> children;
        if (snapshot.hasData) {
          children = <Widget>[
            returnStreamBuilder(doc),
          ];
        } else if (snapshot.hasError) {
          children = <Widget>[
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: ${snapshot.error}'),
            )
          ];
        } else {
          children = const <Widget>[
            SizedBox(
              child: CircularProgressIndicator(),
              width: 60,
              height: 60,
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                'Loading...',
                style: TextStyle(color: DarkTheme.grey6),
              ),
            ),
          ];
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        );
      },
    );
  }

  Widget returnStreamBuilder(Stream<DocumentSnapshot> snapshot) {
    return StreamBuilder(
        stream: snapshot,
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          } else if (snapshot.hasData) {
            var doc = snapshot.data.data;
            name = doc['name'];
            img = doc['imgAddress'];

          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              CircleAvatar(
                backgroundImage: AssetImage(img),
                radius: 50.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                name,
                style: TextStyle(
                  color: DarkTheme.pink,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  fontFamily: 'Bebas',
                ),
              ),
              Divider(
                height: 40.0,
                color: DarkTheme.gold,
                indent: 15,
                endIndent: 15,
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyProfile()),
                  );
                },
                child: Text(
                  'My Profile',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Bebas',
                    color: DarkTheme.grey6,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyKitchen()),
                  );
                },
                child: Text(
                  'My Kitchen',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Bebas',
                    color: DarkTheme.grey6,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              FlatButton(
                onPressed: () {
                  context.signOut();
                  Navigator.of(context).push(AuthScreen.route);
                },
                child: Text(
                  'Sign Out',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Bebas',
                    color: DarkTheme.grey6,
                  ),
                ),
              ),
            ],
          );
        });
  }
}
