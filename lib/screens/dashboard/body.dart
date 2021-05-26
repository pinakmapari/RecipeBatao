import 'package:flutter/material.dart';
import 'package:recipe_batao/screens/dashboard/recipesGrid.dart';
import 'package:recipe_batao/screens/dashboard/recipeDetails.dart';
import 'package:recipe_batao/screens/dashboard/categories.dart';
import 'package:recipe_batao/config/palette.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkTheme.black,
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            'Hello {name}!',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              fontFamily: 'Bebas',
              color: DarkTheme.gold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'What would you like to eat today?',
            style: TextStyle(
              fontSize: 23,
              fontStyle: FontStyle.normal,
              fontFamily: 'Bebas',
              color: DarkTheme.grey5,
              //letterSpacing: 2,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: DarkTheme.grey3,
            thickness: 3,
            indent: 17,
            endIndent: 17,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 17,
              ),
              Text(
                'Latest Recipes:',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Bebas',
                    color: DarkTheme.pink),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Latest(),
          //SizedBox(height: 10,),
          Divider(
            color: Theme3.purple,
            thickness: 1,
            indent: 17,
            endIndent: 17,
          ),
          Categories(), //change this while doing tab bar setup
          Divider(
            color: Theme3.purple,
            thickness: 1,
            indent: 17,
            endIndent: 17,
          ),
          //SizedBox(height: 10,),
          //RecipesGridView(mealtype: 'breakfast'),
          //SizedBox(height: 10,),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
