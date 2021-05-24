import 'package:flutter/material.dart';
import 'package:recipe_batao/screens/profile/profileEdit.dart';
import 'package:recipe_batao/screens/database.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String name = '';
  String phone = '';
  String email = '';
  String age = '';
  String img = 'assets/food.jpg';
  List cuisines;
  Map data = Database.data;
  void assignValues() {
    name = data['name'];
    phone = data['phno'];
    age = data['age'];
    email = data['email'];
    //cuisines = data['cuisines'];
    img = data['img'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: TextStyle(
            fontFamily: 'ComingSoon',
            fontWeight: FontWeight.bold,
            color: Colors.amber,
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
                color: Colors.black,
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                'NAME ',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0,
                  fontFamily: 'ALittleSunshine',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                name,
                style: TextStyle(
                  color: Colors.blue[200],
                  letterSpacing: 2.0,
                  fontSize: 20.0,
                  fontFamily: 'CartoonistHand',
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
                    color: Colors.red[300],
                  ),
                  Text(
                    'EMAIL ',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 2.0,
                      fontFamily: 'ALittleSunshine',
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
                  color: Colors.blue[200],
                  letterSpacing: 2.0,
                  fontSize: 20.0,
                  fontFamily: 'CartoonistHand',
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
                    color: Colors.red[300],
                  ),
                  Text(
                    'PHONE NUMBER ',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 2.0,
                      fontFamily: 'ALittleSunshine',
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
                  color: Colors.blue[200],
                  letterSpacing: 1.0,
                  fontSize: 20.0,
                  fontFamily: 'CartoonistHand',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'AGE ',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0,
                  fontFamily: 'ALittleSunshine',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                age,
                style: TextStyle(
                  color: Colors.blue[200],
                  letterSpacing: 2.0,
                  fontSize: 20.0,
                  fontFamily: 'CartoonistHand',
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
            print(data);
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
        backgroundColor: Colors.deepOrange[400],
      ),
    );
  }
}
