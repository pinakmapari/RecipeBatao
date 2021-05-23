import 'package:flutter/material.dart';
import 'package:recipe_batao/screens/profile/profile.dart';
import 'package:recipe_batao/screens/myKitchen/myKitchen.dart';

class MainDrawer extends StatelessWidget {
  final String name = 'Mrunmai';
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            CircleAvatar(
              backgroundImage: AssetImage('assets/cute_chefs.jpg'),
              radius: 50.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              name,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                fontFamily: 'AlwaysInMyHeart',
              ),
            ),
            Divider(
              height: 40.0,
              color: Colors.black,
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
                  fontWeight: FontWeight.bold,
                  fontFamily: 'CartoonistHand',
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
                  MaterialPageRoute(builder: (context) => MyProfile()),
                );
              },
              child: Text(
                'Favourites',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'CartoonistHand',
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
                  fontWeight: FontWeight.bold,
                  fontFamily: 'CartoonistHand',
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
                  MaterialPageRoute(builder: (context) => MyProfile()),
                );
              },
              child: Text(
                'Sign Out',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'CartoonistHand',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
