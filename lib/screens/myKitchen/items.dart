import 'package:flutter/material.dart';

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
    return Container(
      height: 125,
      child: Card(
        color: Colors.grey[800],
        child: Center(
          child: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              CircleAvatar(
                backgroundColor: Colors.amber,
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
                        color: Colors.white,
                        fontSize: 23,
                        fontFamily: 'QarmicSans',
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Center(
                      child: Text(
                        'Expires in x days',
                        style: TextStyle(
                          color: Colors.red[400],
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
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
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'QarmicSans',
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Fridge',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'ALittleSunshine',
                        fontWeight: FontWeight.bold,
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
