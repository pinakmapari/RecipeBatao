import 'package:flutter/material.dart';
import 'package:recipe_batao/screens/profile/profileEdit.dart';
import 'package:recipe_batao/screens/database.dart';
import 'package:recipe_batao/config/palette.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final Future<String> _calculation = Future<String>.delayed(
    const Duration(seconds: 2),
    () => 'Loaded',
  );

  String name = 'ABC';
  String phone = '12345';
  String email = 'abc@def.com';
  String age = '20';
  String img = 'assets/food.jpg';
  List cuisines;
  Map data = {};
  String userid;
  Stream<QuerySnapshot> documentStream;
  @override
  void initState() {
    final user = context.getSignedInUser();
    user.when(
      (value) {
        userid = value.uid;
        //Database().fetchData();
      },
      empty: () {},
      initializing: () {},
    );
    documentStream = Firestore.instance.collection('users').snapshots();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: TextStyle(
            fontFamily: 'Bebas',
            fontWeight: FontWeight.bold,
            color: DarkTheme.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: DarkTheme.grey1,
      ),
      resizeToAvoidBottomInset: false,
      body:
          SingleChildScrollView(child: returnFB(_calculation, documentStream)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            //assignValues();
          });

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfileEdit()),
          );
        },
        child: Icon(
          Icons.edit,
        ),
        backgroundColor: DarkTheme.grey3,
      ),
    );
  }

  Widget returnFB(Future<String> _calculation, Stream<QuerySnapshot> doc) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headline2,
      textAlign: TextAlign.center,
      child: FutureBuilder(
        future: _calculation, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          //Database().fetchData();
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              returnStream(doc),
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
              Padding(
                padding: EdgeInsets.fromLTRB(60, 50, 40, 40),
                child: SizedBox(
                  child: CircularProgressIndicator(),
                  //width: 60,
                  //height: 60,
                ),   
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(80, 10, 40, 60),
                child: Text('Loading...',
                style: TextStyle(
                  color: DarkTheme.white,
                  fontSize: 60,
                  fontFamily: 'Bebas'
                ),),
              )
            ];
          }
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: DarkTheme.black,
                      child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }

  Widget returnStream(Stream<QuerySnapshot> doc) {
    return StreamBuilder<QuerySnapshot>(
        stream: doc,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          data = matchID(snapshot.data.documents);
          name = data['name'];
          email = data['email'];
          age = data['age'];
          phone = data['phNo'];
          if (data['imgAddress'] != '') {
            img = data['imgAddress'];
          }
          return Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: DarkTheme.black,
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 40.0, 40.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: CircleAvatar(
                          backgroundImage: AssetImage(img),
                          radius: 40.0,
                        ),
                      ),
                      Divider(
                        height: 40.0,
                        color: DarkTheme.gold,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'NAME ',
                        style: TextStyle(
                          color: DarkTheme.white,
                          letterSpacing: 2.0,
                          fontFamily: 'Bebas',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        name,
                        style: TextStyle(
                          color: DarkTheme.gold,
                          letterSpacing: 2.0,
                          fontSize: 20.0,
                          fontFamily: 'Bebas',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.email,
                            color: DarkTheme.pink,
                          ),
                          Text(
                            'EMAIL ',
                            style: TextStyle(
                              color: DarkTheme.white,
                              letterSpacing: 2.0,
                              fontFamily: 'Bebas',
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        email,
                        style: TextStyle(
                          color: DarkTheme.gold,
                          letterSpacing: 2.0,
                          fontSize: 20.0,
                          fontFamily: 'Bebas',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.phone,
                            color: DarkTheme.pink,
                          ),
                          Text(
                            'PHONE NUMBER ',
                            style: TextStyle(
                              color: DarkTheme.white,
                              letterSpacing: 2.0,
                              fontFamily: 'Bebas',
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        phone,
                        style: TextStyle(
                          color: DarkTheme.gold,
                          letterSpacing: 1.0,
                          fontSize: 20.0,
                          fontFamily: 'Bebas',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'AGE ',
                        style: TextStyle(
                          color: DarkTheme.white,
                          letterSpacing: 2.0,
                          fontFamily: 'Bebas',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        age,
                        style: TextStyle(
                          color: DarkTheme.gold,
                          letterSpacing: 2.0,
                          fontSize: 20.0,
                          fontFamily: 'Bebas',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }

  Map matchID(List<DocumentSnapshot> snapshot) {
    int n = snapshot.length;
    for (var map in snapshot) {
      String uid = map['uid'];
      if (userid == uid) {
        return map.data;
      }
    }
    //return {};
  }
}
