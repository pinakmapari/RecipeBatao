import 'package:flutter/material.dart';
import 'package:recipe_batao/screens/myKitchen/cookitwith.dart';
import 'package:recipe_batao/config/palette.dart';

class IngredientDetails extends StatefulWidget {
  final List details;
  const IngredientDetails({Key key, @required this.details}) : super(key: key);
  @override
  _IngredientDetailsState createState() => _IngredientDetailsState();
}

class _IngredientDetailsState extends State<IngredientDetails> {
  @override
  IngredientDetails get widget => super.widget;
  Widget buildResults(BuildContext context) {
    return Latest1(query: ingredient,);
  }
  String ingredient = "Ingredient Name";
  String category = "Category";
  int kitchenSince = 3;
  int expiringIn = 4;
  String amount = '750';
  List det;
  @override
  void initState() {
    super.initState();
    det = widget.details;
    ingredient = det[0];
    category = det[3];
    expiringIn = int.parse(det[1]);
    amount = det[2];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DarkTheme.black,
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
      backgroundColor: DarkTheme.black,
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
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontFamily: 'Bebas',
                  color: DarkTheme.gold,
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
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 1,
                  fontFamily: 'Bebas',
                  color: DarkTheme.grey5,
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
                height: 180,
                child: Column(
                  children: [
                    Text(
                      'In the kitchen\nsince',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Bebas',
                        color: DarkTheme.pink,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '$kitchenSince\ndays',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Bebas',
                        color: DarkTheme.grey5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                height: 180,
                child: VerticalDivider(
                  color: Theme3.purple,
                  thickness: 2,
                ),
              ),
              Container(
                height: 180,
                child: Column(
                  children: [
                    Text(
                      'Expiring\nin',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Bebas',
                        color: DarkTheme.pink,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '$expiringIn\ndays',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Bebas',
                        color: DarkTheme.grey5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                height: 180,
                child: VerticalDivider(
                  color: Theme3.purple,
                  thickness: 2,
                ),
              ),
              Container(
                height: 180,
                child: Column(
                  children: [
                    Text(
                      'Amount\n',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Bebas',
                        color: DarkTheme.pink,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '$amount\ngm',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Bebas',
                        color: DarkTheme.grey5,
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
            color: Theme3.purple,
            thickness: 2,
            indent: 17,
            endIndent: 17,
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            'Let\'s cook it with',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              fontFamily: 'Bebas',
              color: DarkTheme.pink,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Latest1(query: '$ingredient',),
          Divider(
            color: Theme3.purple,
            thickness: 2,
            indent: 17,
            endIndent: 17,
          ),
        ],
      ),
    );
  }
}
