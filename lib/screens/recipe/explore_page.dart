import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:recipe_batao/config/palette.dart';
import 'package:recipe_batao/services/api_services.dart';
import 'package:http/http.dart';
import 'package:recipe_batao/screens/recipe/recipedetails.dart';

class ExplorePage extends StatefulWidget {
  final String query;

  ExplorePage({@required this.query});
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List<dynamic> _recipes = new List();

  void getRecipes() async {
    Response response = await get(
        'https://api.spoonacular.com/recipes/complexSearch?includeIngredients=${widget.query}&addRecipeNutrition=true&addRecipeInformation=true&apiKey=${ApiService.API_KEY}');

    final data = json.decode(response.body);

    _recipes = data["results"];

    setState(() {
      _recipes = data["results"] as List;
    });
  }

  @override
  void initState() {
    getRecipes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkTheme.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: _recipes.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeDetails(
                            recipeModel: _recipes[index],
                          ),
                        )),
                    child: RecipeCard(
                      recipeModel: _recipes[index],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class RecipeCard extends StatefulWidget {
  final recipeModel;
  RecipeCard({
    @required this.recipeModel,
  });

  @override
  _RecipeCardState createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  bool loved = false;
  bool saved = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Hero(
                  tag: widget.recipeModel['image'],
                  child: Image(
                    height: 320,
                    width: 320,
                    fit: BoxFit.cover,
                    image: NetworkImage('${widget.recipeModel['image']}'),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 40,
              child: InkWell(
                onTap: () {
                  setState(() {
                    saved = !saved;
                  });
                },
                child: Icon(
                  saved
                      ? FlutterIcons.bookmark_check_mco
                      : FlutterIcons.bookmark_outline_mco,
                  color: Colors.white,
                  size: 38,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.recipeModel['title'],
                      style: TextStyle(color: DarkTheme.gold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.recipeModel['sourceName'],
                      style: TextStyle(color: DarkTheme.grey7),
                    ),
                  ],
                ),
              ),
              // Spacer(),
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      FlutterIcons.timer_mco,
                      color: DarkTheme.grey4,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      widget.recipeModel['readyInMinutes'].toString() + '\'',
                      style: TextStyle(color: DarkTheme.grey5),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        setState(() {
                          loved = !loved;
                        });
                      },
                      child: Icon(
                        FlutterIcons.heart_circle_mco,
                        color: loved ? DarkTheme.pink : DarkTheme.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
