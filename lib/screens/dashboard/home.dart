import 'package:flutter/material.dart';
import 'package:recipe_batao/screens/dashboard/body.dart';
import 'package:recipe_batao/config/palette.dart';
import 'package:recipe_batao/screens/recipe/explore_page.dart';
import '../drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  static MaterialPageRoute get route => MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      drawer: MainDrawer(),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      /*leading: IconButton(
        icon: Image.asset("assets/icons/side_menu.png"),
        onPressed: () {},
      ),*/
      backgroundColor: DarkTheme.grey1,
      title: Padding(
        padding: const EdgeInsets.all(50),
        child: Image.asset(
          "assets/icons/RecipeBataoIcon_Cream.png",
        ),
      ),
      centerTitle: true,
      iconTheme: IconThemeData(color: DarkTheme.white),
      actions: [
        //seach button
        IconButton(
          icon: Icon(
            Icons.search,
            color: DarkTheme.white,
            size: 32,
          ),
          onPressed: () {
            showSearch(delegate: DataSearch(), context: context);
          },
        ),
        SizedBox(
          width: 10,
        ), // Default size is 10
      ],
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  //add suggestion strings here
  final recipes = ['palak paneer', 'maggi'];

  //for recent search
  final recentRecipes = [];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return ExplorePage(query: query,);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentRecipes
        : recipes.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
          onTap: () {
            showResults(context);
          },
          leading: Icon(Icons.food_bank),
          title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey),
                  )
                ]),
          )),
      itemCount: suggestionList.length,
    );
  }
}
