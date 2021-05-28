import 'package:flutter/material.dart';
import 'package:recipe_batao/screens/myKitchen/addItem.dart';
import 'package:recipe_batao/screens/myKitchen/items.dart';
import 'package:recipe_batao/screens/myKitchen/kitchenCategories.dart';
import 'package:recipe_batao/config/palette.dart';

class MyKitchen extends StatefulWidget {
  @override
  _MyKitchenState createState() => _MyKitchenState();
}

class _MyKitchenState extends State<MyKitchen> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Kitchen',
          style: TextStyle(
            fontFamily: 'Bebas',
            color: DarkTheme.white,
          ),
        ),
        backgroundColor: DarkTheme.grey1,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: DarkTheme.white,
              size: 24,
            ),
            onPressed: null,
          ),
          IconButton(
              icon: Icon(
                Icons.notifications,
                color: DarkTheme.white,
                size: 24,
              ),
              onPressed: null)
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        color: DarkTheme.black,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Welcome to your kitchen!',
              style: TextStyle(
                color: DarkTheme.white,
                fontSize: 20.0,
                fontFamily: 'Bebas',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            SizedBox(
              height: 35,
              child: KitchenCategories(),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(child: Items()),
            Container(
              height: 55,
              color: DarkTheme.grey2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.fastfood,
                        color: DarkTheme.gold,
                        size: 35,
                      ),
                      onPressed: null,
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.add,
                          color: DarkTheme.gold,
                          size: 35,
                        ),
                        onPressed: () {
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddItem()),
                            );
                          });
                        })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*

*/
