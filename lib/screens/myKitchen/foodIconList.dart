import 'package:flutter/material.dart';
import '../dashboard/recipeDetails.dart';
import 'package:recipe_batao/config/palette.dart';

class FoodList extends StatefulWidget {
  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  List<dynamic> recipeList = new List();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 155,
      child: ListView.builder(
          itemCount: 7,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(7),
                child: Column(
                  children: [
                      RaisedButton(
                        onPressed: () {
                         
                        },
                        shape: CircleBorder(),
                        child: Container(
                          child: CircleAvatar(

                            backgroundImage: NetworkImage("${recipeList[index]['image']}"),
                            radius: 45,
                          ),
                        ),
                      ),
                    SizedBox(height: 5,),
                    Text(
                      'Ingredient\n        ${index+1}',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Bebas',
                        color: DarkTheme.grey5,
                      ),
                    ),
                  ],
                ),
              );
          },
      ),
    );
  }
}
