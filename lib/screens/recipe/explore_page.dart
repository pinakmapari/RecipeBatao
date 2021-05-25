import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:recipe_batao/services/api_services.dart';
//import 'dart:convert' as convert;
import 'package:http/http.dart';
import 'package:recipe_batao/screens/recipe/recipedetails.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List<dynamic> _recipes = new List();

  void getRecipes() async {
    Response response = await get(
        'https://api.spoonacular.com/recipes/complexSearch?includeIngredients=tomato,+cheese&addRecipeNutrition=true&addRecipeInformation=true&apiKey=${ApiService.API_KEY}');

    //print(response.body);
    final data = json.decode(response.body);
    //print(data);
    //print(data["results"]);
    _recipes = data["results"];
    //print(data["results"][0]["title"]);

    setState(() {
      _recipes = data["results"] as List;
    });
    //print(_recipes[0]['id']);
    // print(_recipes);
    //Recipes recipeslist = Recipes.fromMap(data);
    //print(recipeslist);
    //return recipeslist;
    //return Recipes.fromMap(data[0]);
  }
  //   // setState(() {
  //   //   _recipes = data as List;
  //   // });
  //   // print(_recipes);
  //   //Recipes recipeslist = Recipes.fromMap(data);
  //   //print(recipeslist);
  //   //return recipeslist;
  //   //return Recipes.fromMap(data[0]);
  // }

  // Future<Recipes> getRecipes() async {
  //   Response response = await get(
  //       'https://api.spoonacular.com/recipes/complexSearch?includeIngredients=tomato,+cheese&addRecipeNutrition=true&addRecipeInformation=true&apiKey=${ApiService.API_KEY}');
  //   Map<String, dynamic> map = json.decode(response.body);
  //   List<dynamic> data = map["results"];
  //   Recipes recipes = Recipes.fromMap(map);
  //   print(data[0]);
  //   setState(() {
  //     _recipes = data as List;
  //   });
  //   return recipes;
  //Recipes recipeslist = Recipes.fromMap(data);
  //print(recipeslist);
  //return recipeslist;
  //return Recipes.fromMap(data[0]);
  // }

  @override
  void initState() {
    getRecipes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //   return Container(
    //     child: ListView(children: [
    //       //Text('${title}'),
    //       Text('${_recipes[0]['id']}'),
    //       Text('${_recipes[0]['image']}'),
    //       Text('${_recipes[0]['sourceUrl']}'),
    //       Text('${_recipes[0]['nutrition']}'),
    //     ]),
    //   );
    // }

    return Scaffold(
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
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.recipeModel['sourceName'],
                      style: Theme.of(context).textTheme.caption,
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
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      widget.recipeModel['readyInMinutes'].toString() + '\'',
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
                        color: loved ? Colors.red : Colors.black,
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

