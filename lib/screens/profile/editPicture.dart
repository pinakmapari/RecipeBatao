import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:recipe_batao/config/palette.dart';
import 'package:recipe_batao/screens/database.dart';

//import 'package:recipe_batao/screens/database.dart';

class EditPicture extends StatefulWidget {
  @override
  _EditPictureState createState() => _EditPictureState();
}

class _EditPictureState extends State<EditPicture> {
  List<String> names = [
    'assets/banana.jpg',
    'assets/bread.jpg',
    'assets/burger.jpg',
    'assets/cake.jpg',
    'assets/cake2.jpg',
    'assets/cheese.jpg',
    'assets/chicken.jpg',
    'assets/cupcake.jpg',
    'assets/doughnut.jpg',
    'assets/fish.jpg',
    'assets/food.jpg',
    'assets/fries.jpg',
    'assets/grapes.jpg',
    'assets/hotdog.jpg',
    'assets/icecream.jpg',
    'assets/juice.jpg',
    'assets/kiwi.jpg',
    'assets/mango.jpg',
    'assets/milkshake.jpg',
    'assets/omlette.jpg',
    'assets/pear.jpg',
    'assets/pineapple.jpg',
    'assets/pizza.jpg',
    'assets/popcorn.jpg',
    'assets/sushi.jpg',
    'assets/waffle.jpg',
    'assets/wine.jpg',
    'assets/wrap.jpg'
  ];
  String img = 'assets/food.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DarkTheme.grey1,
        title: Text(
          'Edit Profile Picture',
          style: TextStyle(
            color: DarkTheme.white,
            fontFamily: 'Decour',
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: DarkTheme.black,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 30),
            ),
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage(img),
                radius: 40.0,
              ),
            ),
            Divider(
              height: 20.0,
              endIndent: 20,
              indent: 20,
              thickness: 1.0,
              color: DarkTheme.grey6,
            ),
            Expanded(
                child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    crossAxisCount: 4,
                    children: List.generate(names.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                img = names[index];
                              });
                            },
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(names[index]),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                        ),
                      );
                    }))),
            RaisedButton(
              onPressed: () {
                Database().addImage(img);
                Navigator.pop(context);
              },
              color: DarkTheme.grey1,
              child: Text(
                'Save',
                style: TextStyle(
                  color: DarkTheme.gold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
