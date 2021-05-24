import 'package:flutter/material.dart';
import '../dashboard/recipeDetails.dart';

class FoodList extends StatefulWidget {
  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
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
                        onPressed: () {},
                        shape: CircleBorder(),
                        child: Container(
                          //child: Image.asset("assets/images/${recipeList[index].imageName}.jpg"),
                          child: CircleAvatar(
                            backgroundImage: AssetImage("assets/images/${recipeList[index].imageName}.jpg"),
                            radius: 45,
                          ),
                        ),
                      ),
                    SizedBox(height: 5,),
                    Text(
                      'Ingredient\n        ${index+1}',
                      style: TextStyle(
                        fontSize: 16,
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
