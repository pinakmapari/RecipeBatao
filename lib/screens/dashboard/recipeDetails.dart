import 'package:flutter/material.dart';
import '../myKitchen/expiryDetails.dart';

class Recipes {
  const Recipes({this.name, this.imageName});
  final String name;
  final String imageName;
}

List<Recipes> recipeList = [
  const Recipes(imageName: 'CaesarSalad', name: 'Caesar Salad'),
  const Recipes(imageName: 'PastaSalad', name: 'Pasta Salad'),
  const Recipes(imageName: 'PotatoCurry', name: 'Potato Curry'),
  const Recipes(imageName: 'VegetableRice', name: 'Vegetable Rice'),
  const Recipes(imageName: 'MooliParatha', name: 'Mooli Paratha'),
  const Recipes(imageName: 'IceCream', name: 'Ice Cream'),
  const Recipes(imageName: 'Dosa', name: 'Dosa'),
  const Recipes(imageName: 'VegetableSoup', name: 'Vegetable Soup'),
  const Recipes(imageName: 'FruitSalad', name: 'Fruit Salad'),
  const Recipes(imageName: 'MasalaPapad', name: 'Masala Papad'),
  const Recipes(imageName: 'GulabJamun', name: 'Gulab Jamun'),
  const Recipes(imageName: 'Roti', name: 'Roti'),
];

class Latest extends StatefulWidget {
  @override
  _LatestState createState() => _LatestState();
}

class _LatestState extends State<Latest> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 5,
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
                      MaterialPageRoute(builder: (context) => IngredientDetails()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                      ),
                    ),
                    child: Image.asset(
                      "assets/images/${recipeList[index].imageName}.jpg",
                      height: 170,
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                  '${recipeList[index].name}',
                  style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 16,
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
