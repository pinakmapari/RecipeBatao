import 'package:flutter/material.dart';

class KitchenCategories extends StatefulWidget {
  @override
  _KitchenCategoriesState createState() => _KitchenCategoriesState();
}

class _KitchenCategoriesState extends State<KitchenCategories> {
  List<String> categories = ['All', 'Fridge', 'Freezer', 'Dry Items'];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext buildContext) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) => buildCategories(index),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
      ),
    );
  }

  Widget buildCategories(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 20),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color:
              selectedIndex == index ? Colors.amber[100] : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          categories[index],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: selectedIndex == index ? Colors.red[700] : Colors.amber,
          ),
        ),
      ),
    );
  }
}
