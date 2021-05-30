//import 'dart:html';

//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:recipe_batao/config/palette.dart';
import 'package:recipe_batao/screens/database.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'editPicture.dart';

class Profile {
  final String name;
  final String email;
  final int phno;
  final String image;
  final int age;
  final String cuisines;
  Profile(
      this.name, this.email, this.phno, this.image, this.age, this.cuisines);
}

class ProfileEdit extends StatefulWidget {
  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final Future<String> _calculation = Future<String>.delayed(
    const Duration(seconds: 2),
    () => 'Loaded',
  );

  String name = '';
  String email = '';
  String phNo = '';
  String age;
  List chosenCuisines = [];
  Map<String, dynamic> data = {};

  Map<String, bool> cuisines = {
    'North Indian': false,
    'South Indian': false,
    'Maharashtrian': false,
    'Gujarathi': false,
    'Rajasthani': false,
    'Punjabi': false,
    'Indori': false,
    'Bengali': false,
  };
  List getMyCuisines(Map cuisines) {
    List chosen = [];
    cuisines.forEach((key, value) {
      if (value == true) {
        chosen.add(key);
      }
    });
    return chosen;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit My Profile',
          style: TextStyle(
            color: DarkTheme.white,
            fontFamily: 'Bebas',
          ),
        ),
        centerTitle: true,
        backgroundColor: DarkTheme.grey1,
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: DarkTheme.black,
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 20.0, 40.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/food.jpg'),
                  radius: 40.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditPicture()),
                    );
                  },
                  child: Text(
                    'Edit Picture',
                    style: TextStyle(
                      fontFamily: 'Bebas',
                      color: DarkTheme.gold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              Divider(
                color: DarkTheme.grey5,
                height: 30.0,
                indent: 20,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Name: ',
                    style: TextStyle(
                      color: DarkTheme.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Bebas',
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  SizedBox(
                    width: 200.0,
                    height: 40.0,
                    child: TextField(
                      style: TextStyle(
                        color: DarkTheme.white,
                        fontFamily: 'Bebas',
                        letterSpacing: 1.0,
                      ),
                      onChanged: (text) {
                        name = text;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelText: 'Enter Name',
                        labelStyle: TextStyle(
                          fontFamily: 'Bebas',
                          color: DarkTheme.grey3,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Email ID: ',
                    style: TextStyle(
                      color: DarkTheme.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Bebas',
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  SizedBox(
                    width: 200.0,
                    height: 40.0,
                    child: TextField(
                      style: TextStyle(
                        color: DarkTheme.white,
                        fontFamily: 'Bebas',
                        letterSpacing: 1.0,
                      ),
                      onChanged: (text) {
                        email = text;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelText: 'Enter Email Id',
                        labelStyle: TextStyle(
                          fontFamily: 'Bebas',
                          color: DarkTheme.grey3,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Phone Number: ',
                    style: TextStyle(
                      color: DarkTheme.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Bebas',
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  SizedBox(
                    width: 200.0,
                    height: 40.0,
                    child: TextField(
                      style: TextStyle(
                        color: DarkTheme.white,
                        fontFamily: 'Bebas',
                        letterSpacing: 1.0,
                      ),
                      onChanged: (text) {
                        phNo = text;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelText: 'Enter Phone number',
                        labelStyle: TextStyle(
                          fontFamily: 'Bebas',
                          color: DarkTheme.grey3,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Age: ',
                    style: TextStyle(
                      color: DarkTheme.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Bebas',
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  SizedBox(
                    width: 200.0,
                    height: 40.0,
                    child: TextField(
                      style: TextStyle(
                        color: DarkTheme.white,
                        fontFamily: 'Bebas',
                        letterSpacing: 1.0,
                      ),
                      onChanged: (text) {
                        age = text;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelText: 'Enter Age',
                        labelStyle: TextStyle(
                          fontFamily: 'Bebas',
                          color: DarkTheme.grey3,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                height: 20.0,
                indent: 20,
                color: DarkTheme.grey6,
              ),
              Text(
                'Favourite cuisines',
                style: TextStyle(
                  color: DarkTheme.gold,
                  fontFamily: 'Bebas',
                  fontSize: 17,
                  letterSpacing: 1.0,
                ),
              ),
              Container(
                width: double.infinity,
                height: 150.0,
                child: Expanded(
                  child: ListView(
                    children: cuisines.keys.map((String key) {
                      return new CheckboxListTile(
                        title: new Text(
                          key,
                          style: TextStyle(
                            color: DarkTheme.white,
                            fontFamily: 'Bebas',
                            fontSize: 15.0,
                          ),
                        ),
                        value: cuisines[key],
                        activeColor: DarkTheme.grey2,
                        checkColor: DarkTheme.white,
                        onChanged: (bool value) {
                          setState(() {
                            cuisines[key] = value;
                            chosenCuisines = getMyCuisines(cuisines);
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
              Spacer(),
              Center(
                child: RaisedButton(
                  color: DarkTheme.grey1,
                  onPressed: () {
                    Database().addData(name, email, phNo, age, chosenCuisines);
                    //print(name);
                    //Database().fetchData();
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Done',
                    style: TextStyle(
                      color: DarkTheme.white,
                      fontFamily: 'Bebas',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
