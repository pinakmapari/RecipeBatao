import 'package:flutter/material.dart';

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
        height: 35,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => buildCategories(index),
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
          color: selectedIndex == index ? Colors.purple[100] : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
            categories[index],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: selectedIndex == index ? Colors.purple[700] : Colors.grey,
            ),
          ),
      ),
    );
  }
}
