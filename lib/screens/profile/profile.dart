import 'package:flutter/material.dart';
import 'package:recipe_batao/screens/profile/profileEdit.dart';
import 'package:recipe_batao/screens/database.dart';
import 'package:recipe_batao/config/palette.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String name = 'ABC';
  String phone = '12345';
  String email = 'abc@def.com';
  String age = '20';
  String img = 'assets/food.jpg';
  List cuisines;
  Map data = {};
  @override
  void initState() {
    //Database().fetchData();
    data = Database.data;
    name = data['name'];
    phone = data['phno'];
    age = data['age'];
    email = data['email'];
    //cuisines = data['cuisines'];
    img = data['img'];
    super.initState();
  }

  void assignValues() {}

  @override
  Widget build(BuildContext context) {
    //Database().fetchData();
    //assignValues();
    //print(Database.data);
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
      body: Container(
        width: double.infinity,
        constraints: BoxConstraints.expand(),
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
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                'ABC',
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Database().fetchData();
            data = Database.data;
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
}
