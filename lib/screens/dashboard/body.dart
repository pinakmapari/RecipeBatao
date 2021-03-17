import 'package:flutter/material.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:recipe_batao/screens/dashboard/recipesGrid.dart';
import '../auth/auth.dart';
import 'package:recipe_batao/screens/dashboard/recipeDetails.dart';
import 'package:recipe_batao/screens/dashboard/categories.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              'Hello Insaan!',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
          ),
          SizedBox(height: 15,),
          Text(
            'What would you like to eat today?',
            style: TextStyle(
              fontSize: 23,
              fontStyle: FontStyle.italic,
              //letterSpacing: 2,
            ),
          ),
          SizedBox(height: 10,),
          Divider(
            color: Colors.black,
            thickness: 3,
            indent: 17,
            endIndent: 17,
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(width: 17,),
              Text(
                'Latest Recipes:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          SizedBox(height: 10,),
          Latest(),
          //SizedBox(height: 10,),
          Divider(
            color: Colors.black,
            thickness: 1,
            indent: 17,
            endIndent: 17,
          ),
          Categories(),
          Divider(
            color: Colors.black,
            thickness: 1,
            indent: 17,
            endIndent: 17,
          ),
          //SizedBox(height: 10,),
          RecipesGridView(),
          //SizedBox(height: 10,),
          Center(
            child: RaisedButton(
              onPressed: () {
                context.signOut();
                Navigator.of(context).push(AuthScreen.route);
              },
              child: const Text('Sign out'),
            ),
          ),
          SizedBox(height: 5,),
        ],
    ),
    );
  }
}
