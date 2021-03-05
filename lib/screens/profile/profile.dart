import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 40.0, 40.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/food.jpg'),
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
                color: Colors.grey[800],
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              'Mrunmai',
              style: TextStyle(
                color: Colors.blue[800],
                letterSpacing: 2.0,
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                Text(
                  'EMAIL ',
                  style: TextStyle(
                    color: Colors.grey[800],
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              'kshitiabhyankar@gmail.com',
              style: TextStyle(
                color: Colors.blue[800],
                letterSpacing: 2.0,
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.phone,
                  color: Colors.black,
                ),
                Text(
                  'PHONE NUMBER ',
                  style: TextStyle(
                    color: Colors.grey[800],
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              '+91 95272 96748',
              style: TextStyle(
                color: Colors.blue[800],
                letterSpacing: 2.0,
                fontSize: 20.0,
              ),
            ),
            Divider(
              height: 40.0,
              color: Colors.black,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfileEdit()),
          );
        },
        child: Icon(
          Icons.edit,
        ),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}

class ProfileEdit extends StatefulWidget {
  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit My Profile'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 30.0, 40.0, 0.0),
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
              height: 20.0,
            ),
            Row(
              children: <Widget>[
                Text(
                  'Name: ',
                  style: TextStyle(
                    color: Colors.black,
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
                    onChanged: (text) {
                      name = text;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Name',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
