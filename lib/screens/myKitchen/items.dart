import 'package:flutter/material.dart';
import 'package:recipe_batao/config/palette.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

class Items extends StatelessWidget {
  final Future<String> _calculation = Future<String>.delayed(
    const Duration(seconds: 2),
    () => 'Loaded',
  );
  List itemDetails = [];
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
      height: 450,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Expanded(
        child: ListView(
          children: [for (var i in names) createCard(i)],
        ),
      ),
    );
  }

  Widget createCard(String name) {
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
                        'Expires in x days',
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
                      'y kg',
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
                      'Fridge',
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

  Widget returnStreamBuilder(Stream<QuerySnapshot> doc) {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasError) {
        return Text('Something went wrong');
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Text("Loading");
      }
      var items = snapshot.data.documents;
      for (var item in items) {
        Map singleItem = item.data;
        itemDetails.add(singleItem);
      }
      return Text('These are your items');
    });
  }
}
