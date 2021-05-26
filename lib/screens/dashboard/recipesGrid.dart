import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:recipe_batao/screens/dashboard/recipeDetails.dart';
import 'package:recipe_batao/config/palette.dart';
import 'package:http/http.dart';
import 'package:recipe_batao/services/api_services.dart';

class RecipesGridView extends StatefulWidget {
  final String mealtype;
  RecipesGridView({@required this.mealtype});
  @override
  _RecipesGridViewState createState() => _RecipesGridViewState();
}

class _RecipesGridViewState extends State<RecipesGridView> {
  List<dynamic> recipeList = new List();

  void getRecipes() async {
    Response response = await get(
        'https://api.spoonacular.com/recipes/complexSearch?type=${widget.mealtype}&apiKey=${ApiService.API_KEY}');

    //print(response.body);
    final data = json.decode(response.body);
    //print(data);
    //print(data["results"]);
    recipeList = data["results"];
    //print(recipeList);
    //print(data["results"][0]["title"]);

    setState(() {
      recipeList = data["results"] as List;
    });
  }

  @override
  void initState() {
    getRecipes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: recipeList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Column(
              children: [
                FlatButton(
                  onPressed: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                      ),
                    ),
                    child: Image(
                      image: NetworkImage("${recipeList[index]['image']}"),
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
                    fontSize: 14,
                    fontFamily: 'Bebas',
                    color: DarkTheme.grey7,
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
