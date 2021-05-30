import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:recipe_batao/config/palette.dart';
import 'package:recipe_batao/screens/recipeData.dart';
import 'package:recipe_batao/services/api_services.dart';

class Latest1 extends StatefulWidget {
  final String query;

  Latest1({@required this.query});
  @override
  _LatestState createState() => _LatestState();
}

class _LatestState extends State<Latest1> {
  List<dynamic> recipeList = new List();

  void getRecipes() async {
    Response response = await get(
        'https://api.spoonacular.com/recipes/complexSearch?includeIngredients=${widget.query}&addRecipeNutrition=true&addRecipeInformation=true&apiKey=${ApiService.API_KEY}');
    final data = json.decode(response.body);
    recipeList = data['results'];
    print(recipeList);
    setState(() {
      recipeList = data['results'] as List;
    });
  }

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  @override
  Widget build(BuildContext context) {
    if (recipeList.length == 0) {
      return Text('Unable to find recipe. Try other keywords...');
    } else {
      return SingleChildScrollView(
              child: Container(
          height: 200,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: recipeList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Column(
                  children: [
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  RecipeDetails(recipeModel: recipeList[index])),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Image(
                          image: NetworkImage("${recipeList[index]['image']}"),
                          height: 170,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${recipeList[index]['title']}',
                      style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 16,
                        fontFamily: 'Bebas',
                        color: DarkTheme.grey7,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );
    }
  }
}
