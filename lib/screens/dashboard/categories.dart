import 'package:flutter/material.dart';
import 'package:recipe_batao/config/palette.dart';
import 'package:recipe_batao/screens/dashboard/recipesGrid.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ['All', 'Breakfast', 'Lunch', 'Snack', 'Dinner'];
  int selectedIndex = 0; // By default All section is displayed
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: DefaultTabController(
          length: 5,
          initialIndex: 0,
          child: Column(
            children: [
              TabBar(
                isScrollable: true,
                indicatorColor: Colors.red,
                tabs: [
                  Tab(
                    child: Text(
                      "Breakfast".toUpperCase(),
                      style: TextStyle(
                        fontFamily: 'Bebas',
                        letterSpacing: 2,
                        color: DarkTheme.gold,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Main Course".toUpperCase(),
                      style: TextStyle(
                        fontFamily: 'Bebas',
                        letterSpacing: 2,
                        color: DarkTheme.gold,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Snacks".toUpperCase(),
                      style: TextStyle(
                        fontFamily: 'Bebas',
                        letterSpacing: 2,
                        color: DarkTheme.gold,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Beverage".toUpperCase(),
                      style: TextStyle(
                        fontFamily: 'Bebas',
                        letterSpacing: 2,
                        color: DarkTheme.gold,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Desserts".toUpperCase(),
                      style: TextStyle(
                        fontFamily: 'Bebas',
                        letterSpacing: 2,
                        color: DarkTheme.gold,
                      ),
                    ),
                  ),
                ],
                labelColor: Colors.black,
                indicator: DotIndicator(
                  color: DarkTheme.gold,
                  distanceFromCenter: 16,
                  radius: 3,
                  paintingStyle: PaintingStyle.fill,
                ),
                unselectedLabelColor: Colors.black.withOpacity(0.3),
                labelStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                labelPadding: EdgeInsets.symmetric(
                  horizontal: 32,
                ),
              ),
              Divider(
                color: Colors.black.withOpacity(0.3),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    RecipesGridView(mealtype: 'breakfast'),
                    RecipesGridView(mealtype: 'main course'),
                    RecipesGridView(mealtype: 'snacks'),
                    RecipesGridView(mealtype: 'beverage'),
                    RecipesGridView(mealtype: 'desserts'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
