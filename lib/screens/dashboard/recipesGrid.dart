import 'package:flutter/material.dart';
import 'package:recipe_batao/screens/dashboard/recipeDetails.dart';

class RecipesGridView extends StatefulWidget {
  @override
  _RecipesGridViewState createState() => _RecipesGridViewState();
}

class _RecipesGridViewState extends State<RecipesGridView> {
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
                      child: Image.asset(
                        "assets/images/${recipeList[index].imageName}.jpg",
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    '${recipeList[index].name}',
                    style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 14,
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
