import 'package:flutter/material.dart';
import 'package:recipe_batao/screens/dashboard/body.dart';
import '../drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  static MaterialPageRoute get route => MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      drawer: MainDrawer(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      /*leading: IconButton(
        icon: Image.asset("assets/icons/side_menu.png"),
        onPressed: () {},
      ),*/
      title: Padding(
        padding: const EdgeInsets.all(50),
        child: Image.asset("assets/icons/RecipeBataoIcon.png"),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Image.asset("assets/icons/search_icon.png"),
          onPressed: () {},
        ),
        SizedBox(
          width: 10,
        ), // Default size is 10
      ],
    );
  }
}
