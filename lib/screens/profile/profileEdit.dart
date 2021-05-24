//import 'dart:html';

//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:recipe_batao/config/palette.dart';
import 'package:recipe_batao/screens/database.dart';

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
            color: Palette.amber,
            fontFamily: 'ComingSoon',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      body: Container(
        width: double.infinity,
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Colors.grey[800],
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
                      fontFamily: 'CartoonistHand',
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.grey[100],
                height: 30.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Name: ',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
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
                        color: Colors.white,
                        fontFamily: 'QarmicSans',
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
                          fontFamily: 'BehindBlueEyes',
                          color: Colors.amber[300],
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
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
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
                        color: Colors.white,
                        fontFamily: 'QarmicSans',
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
                          fontFamily: 'BehindBlueEyes',
                          color: Colors.amber[300],
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
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
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
                        color: Colors.white,
                        fontFamily: 'QarmicSans',
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
                          fontFamily: 'BehindBlueEyes',
                          color: Colors.amber[300],
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
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
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
                        color: Colors.white,
                        fontFamily: 'QarmicSans',
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
                          fontFamily: 'BehindBlueEyes',
                          color: Colors.amber[300],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Favourite cuisines',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'QarmicSans',
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
                            color: Colors.white,
                            fontFamily: 'QarmicSans',
                            fontSize: 13.0,
                          ),
                        ),
                        value: cuisines[key],
                        activeColor: Colors.blue,
                        checkColor: Colors.white,
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
              RaisedButton(
                color: Colors.grey[800],
                onPressed: () {
                  Database().addData(name, email, phNo, age, chosenCuisines);
                  Database().fetchData();
                  print(Database.data);
                  Navigator.pop(context);
                },
                child: Text(
                  'Done',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
