import 'package:flutter/material.dart';
import 'package:recipe_batao/config/palette.dart';
import 'dart:math';

class Items extends StatelessWidget {
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
      child: Card(
        color: DarkTheme.grey1,
        child: Center(
          child: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              CircleAvatar(
                backgroundColor: color,
                radius: 45,
              ),
              SizedBox(
                width: 15,
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
                width: 30,
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
}
