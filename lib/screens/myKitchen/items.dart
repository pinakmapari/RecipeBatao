import 'package:flutter/material.dart';
import 'package:recipe_batao/config/palette.dart';
import 'dart:math';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Items extends StatefulWidget {
  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  final Future<String> _calculation = Future<String>.delayed(
    const Duration(seconds: 2),
    () => 'Loaded',
  );
  String userid;
  List itemDetails = [];
  Stream collectionStream;
  @override
  void initState() {
    super.initState();
    final litUser = context.getSignedInUser();
    litUser.when((user) => userid = user.uid,
        empty: () {}, initializing: () {});
    print(userid);
    collectionStream =
        Firestore.instance.collection('kitchenItems').snapshots();
    setState(() {});
  }

  List<String> names = [
    'Tomato',
    'Cucumber',
    'Curd',
    'Aamras',
    'IceCream',
    'Maggi',
    'Paneer',
    'Upma Mix',
  ];

  var curdate = DateTime.now();

  var colors = [
    Colors.pink,
    Colors.yellow,
    Colors.blue,
    Colors.deepOrange,
    Colors.cyan,
    Colors.amber,
    Colors.redAccent
  ];

  final _random = new Random();

  List<String> category = ['Fridge', 'Freezer', 'Dry'];

  @override
  Widget build(BuildContext buildContext) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: returnFB(_calculation, collectionStream),
    );
  }

  Widget createCard(String name, String days, String qty, String loc) {
    var color = colors[_random.nextInt(colors.length)];
    return Container(
      height: 125,
      width: double.infinity,
      child: Card(
        color: DarkTheme.grey1,
        child: Center(
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              CircleAvatar(
                backgroundColor: color,
                radius: 45,
              ),
              SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 130,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                        color: DarkTheme.gold,
                        fontSize: 23,
                        fontFamily: 'Bebas',
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Center(
                      child: Text(
                        'Expires in ' + days + '  days',
                        style: TextStyle(
                          color: DarkTheme.pink,
                          fontSize: 15,
                          fontFamily: 'Bebas',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 15,
              ),
              SizedBox(
                child: Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      qty,
                      style: TextStyle(
                        color: DarkTheme.white,
                        fontSize: 30,
                        fontFamily: 'Bebas',
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      loc,
                      style: TextStyle(
                        color: DarkTheme.grey4,
                        fontSize: 25,
                        fontFamily: 'Bebas',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget returnFB(Future<String> _calculation, Stream<QuerySnapshot> doc) {
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

  Widget returnStreamBuilder(Stream<QuerySnapshot> snapshot) {
    return StreamBuilder(
        stream: snapshot,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          } else if (snapshot.hasData) {
            List<Map> dataOfItems = [];
            snapshot.data.documents.forEach((element) {
              var items = element.data;
              dataOfItems.add(items);
              //print(items);
            });
            //print(dataOfItems);
            itemDetails = sortData(dataOfItems);
            //print(itemDetails);

          }

          return Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = 0; i < itemDetails.length; i++)
                    createCard(itemDetails[i][0], itemDetails[i][1],
                        itemDetails[i][2], itemDetails[i][3])
                ],
              ),
            ),
          );
        });
  }

  List sortData(List itemDet) {
    print(itemDet);
    List finalList = [];
    for (int i = 0; i < itemDet.length; i++) {
      Map singleItem = itemDet[i];
      //print(singleItem);
      String expDate = singleItem['date'];
      //print(expDate);
      List<String> dlist = expDate.split('/');
      var edate = DateTime(
          int.parse(dlist[2]), int.parse(dlist[1]), int.parse(dlist[0]));
      //print(edate);
      //print(curdate);
      int x = edate.difference(curdate).inDays;
      //print(x);
      String itemName = singleItem['name'];
      //print(itemName);
      String fqty = singleItem['qty'];
      //print(fqty);
      String loc = singleItem['loc'];
      //print(loc);
      List newList = [itemName, x.toString(), fqty, loc];
      //createCard(itemName, x.toString(), fqty, loc);
      finalList.add(newList);
      //print(finalList);
    }
    return finalList;
  }
}
