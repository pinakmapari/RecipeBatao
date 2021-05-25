import 'package:flutter/material.dart';
import 'foodIconList.dart';

class IngredientDetails extends StatefulWidget {
  @override
  _IngredientDetailsState createState() => _IngredientDetailsState();
}

class _IngredientDetailsState extends State<IngredientDetails> {
  String ingredient = "Ingredient Name";
  String category = "Category";
  int kitchenSince = 3;
  int expiringIn = 4;
  int amount = 750;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        actions: [
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.cyanAccent[50],
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Text(
                '$ingredient',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Text(
                '$category',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 1,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 130,
                child: Column(
                  children: [
                    Text(
                      'In the kitchen\nsince',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '$kitchenSince\ndays',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                height: 130,
                child: VerticalDivider(
                  color: Colors.black,
                  thickness: 1,
                ),
              ),
              Container(
                height: 130,
                child: Column(
                  children: [
                    Text(
                      'Expiring\nin',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '$expiringIn\ndays',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                height: 130,
                child: VerticalDivider(
                  color: Colors.black,
                  thickness: 1,
                ),
              ),
              Container(
                height: 130,
                child: Column(
                  children: [
                    Text(
                      'Amount\n',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '$amount\ngm',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 13,
          ),
          Divider(
            color: Colors.black,
            thickness: 2,
            indent: 17,
            endIndent: 17,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Let\'s cook it with',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          FoodList(),
          Divider(
            color: Colors.black,
            thickness: 2,
            indent: 17,
            endIndent: 17,
          ),
        ],
      ),
    );
  }
}
