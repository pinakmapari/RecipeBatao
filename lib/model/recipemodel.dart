// import 'package:flutter/material.dart';

// class RecipeModel {
//   String title, writer, description;
//   int cookingTime;
//   int servings;
//   List<String> ingredients = [];
//   String imgPath;
//   RecipeModel({
//     @required this.title,
//     @required this.writer,
//     @required this.description,
//     @required this.cookingTime,
//     @required this.servings,
//     @required this.imgPath,
//     @required this.ingredients,
//   });
//   static List<RecipeModel> demoRecipe = [
//     RecipeModel(
//       title: 'Bacon and Scrambled Eggs',
//       writer: "Imran Sefat",
//       description:
//           'A touch of Dijon mustard, salty bacon, melty cheese, and a handful of greens seriously upgrades scrambled eggs, without too much effort!',
//       cookingTime: 10,
//       servings: 4,
//       imgPath: 'assets/images/Roti.jpg',
//       ingredients: [
//         '8 large eggs',
//         '1 tsp. Dijon mustard',
//         'Kosher salt and pepper',
//         '1 tbsp. olive oil or unsalted butter',
//         '2 slices thick-cut bacon, cooked and broken into pieces',
//         '2 c. spinach, torn',
//         '2 oz. Gruyère cheese, shredded',
//       ],
//     ),
//     RecipeModel(
//       title: 'Classic Omelet and Greens ',
//       writer: "Imran Sefat",
//       description:
//           'Sneak some spinach into your morning meal for a boost of nutrients to start your day off right.',
//       cookingTime: 10,
//       servings: 4,
//       imgPath: 'assets/images/IceCream.jpg',
//       ingredients: [
//         '8 large eggs',
//         '1 tsp. Dijon mustard',
//         'Kosher salt and pepper',
//         '1 tbsp. olive oil or unsalted butter',
//         '2 slices thick-cut bacon, cooked and broken into pieces',
//         '2 c. spinach, torn',
//         '2 oz. Gruyère cheese, shredded',
//       ],
//     ),
//     RecipeModel(
//       title: 'Sheet Pan Sausage and Egg Breakfast Bake ',
//       writer: "Imran Sefat",
//       description:
//           'A hearty breakfast that easily feeds a family of four, all on one sheet pan? Yes, please.',
//       cookingTime: 10,
//       servings: 4,
//       imgPath: 'assets/images/MasalaPapad.jpg',
//       ingredients: [
//         '8 large eggs',
//         '1 tsp. Dijon mustard',
//         'Kosher salt and pepper',
//         '1 tbsp. olive oil or unsalted butter',
//         '2 slices thick-cut bacon, cooked and broken into pieces',
//         '2 c. spinach, torn',
//         '2 oz. Gruyère cheese, shredded',
//       ],
//     ),
//     RecipeModel(
//       title: 'Shakshuka',
//       writer: "Imran Sefat",
//       description:
//           'Just wait til you break this one out at the breakfast table: sweet tomatoes, runny yolks, and plenty of toasted bread for dipping.',
//       cookingTime: 10,
//       servings: 4,
//       imgPath: 'assets/images/img4.jpg',
//       ingredients: [
//         '8 large eggs',
//         '1 tsp. Dijon mustard',
//         'Kosher salt and pepper',
//         '1 tbsp. olive oil or unsalted butter',
//         '2 slices thick-cut bacon, cooked and broken into pieces',
//         '2 c. spinach, torn',
//         '2 oz. Gruyère cheese, shredded',
//       ],
//     ),
//   ];
// }

// To parse this JSON data, do
//
//     final recipes = recipesFromJson(jsonString);

import 'dart:convert';

Recipes recipesFromJson(String str) => Recipes.fromJson(json.decode(str));

String recipesToJson(Recipes data) => json.encode(data.toJson());

class Recipes {
  Recipes({
    this.results,
    this.offset,
    this.number,
    this.totalResults,
  });

  List<Result> results;
  int offset;
  int number;
  int totalResults;

  factory Recipes.fromJson(Map<String, dynamic> json) => Recipes(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        offset: json["offset"],
        number: json["number"],
        totalResults: json["totalResults"],
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "offset": offset,
        "number": number,
        "totalResults": totalResults,
      };
}

class Result {
  Result({
    this.vegetarian,
    this.vegan,
    this.glutenFree,
    this.dairyFree,
    this.veryHealthy,
    this.cheap,
    this.veryPopular,
    this.sustainable,
    this.weightWatcherSmartPoints,
    this.gaps,
    this.lowFodmap,
    this.aggregateLikes,
    this.spoonacularScore,
    this.healthScore,
    this.creditsText,
    this.license,
    this.sourceName,
    this.pricePerServing,
    this.id,
    this.title,
    this.readyInMinutes,
    this.servings,
    this.sourceUrl,
    this.image,
    this.imageType,
    this.nutrition,
    this.summary,
    this.cuisines,
    this.dishTypes,
    this.diets,
    this.occasions,
    this.analyzedInstructions,
    this.spoonacularSourceUrl,
    this.preparationMinutes,
    this.cookingMinutes,
  });

  bool vegetarian;
  bool vegan;
  bool glutenFree;
  bool dairyFree;
  bool veryHealthy;
  bool cheap;
  bool veryPopular;
  bool sustainable;
  int weightWatcherSmartPoints;
  String gaps;
  bool lowFodmap;
  int aggregateLikes;
  double spoonacularScore;
  double healthScore;
  String creditsText;
  String license;
  String sourceName;
  double pricePerServing;
  int id;
  String title;
  int readyInMinutes;
  int servings;
  String sourceUrl;
  String image;
  String imageType;
  Nutrition nutrition;
  String summary;
  List<String> cuisines;
  List<String> dishTypes;
  List<String> diets;
  List<String> occasions;
  List<AnalyzedInstruction> analyzedInstructions;
  String spoonacularSourceUrl;
  int preparationMinutes;
  int cookingMinutes;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        vegetarian: json["vegetarian"],
        vegan: json["vegan"],
        glutenFree: json["glutenFree"],
        dairyFree: json["dairyFree"],
        veryHealthy: json["veryHealthy"],
        cheap: json["cheap"],
        veryPopular: json["veryPopular"],
        sustainable: json["sustainable"],
        weightWatcherSmartPoints: json["weightWatcherSmartPoints"],
        gaps: json["gaps"],
        lowFodmap: json["lowFodmap"],
        aggregateLikes: json["aggregateLikes"],
        spoonacularScore: json["spoonacularScore"],
        healthScore: json["healthScore"],
        creditsText: json["creditsText"],
        license: json["license"] == null ? null : json["license"],
        sourceName: json["sourceName"],
        pricePerServing: json["pricePerServing"].toDouble(),
        id: json["id"],
        title: json["title"],
        readyInMinutes: json["readyInMinutes"],
        servings: json["servings"],
        sourceUrl: json["sourceUrl"],
        image: json["image"],
        imageType: json["imageType"],
        nutrition: Nutrition.fromJson(json["nutrition"]),
        summary: json["summary"],
        cuisines: List<String>.from(json["cuisines"].map((x) => x)),
        dishTypes: List<String>.from(json["dishTypes"].map((x) => x)),
        diets: List<String>.from(json["diets"].map((x) => x)),
        occasions: List<String>.from(json["occasions"].map((x) => x)),
        analyzedInstructions: List<AnalyzedInstruction>.from(
            json["analyzedInstructions"]
                .map((x) => AnalyzedInstruction.fromJson(x))),
        spoonacularSourceUrl: json["spoonacularSourceUrl"],
        preparationMinutes: json["preparationMinutes"] == null
            ? null
            : json["preparationMinutes"],
        cookingMinutes:
            json["cookingMinutes"] == null ? null : json["cookingMinutes"],
      );

  Map<String, dynamic> toJson() => {
        "vegetarian": vegetarian,
        "vegan": vegan,
        "glutenFree": glutenFree,
        "dairyFree": dairyFree,
        "veryHealthy": veryHealthy,
        "cheap": cheap,
        "veryPopular": veryPopular,
        "sustainable": sustainable,
        "weightWatcherSmartPoints": weightWatcherSmartPoints,
        "gaps": gaps,
        "lowFodmap": lowFodmap,
        "aggregateLikes": aggregateLikes,
        "spoonacularScore": spoonacularScore,
        "healthScore": healthScore,
        "creditsText": creditsText,
        "license": license == null ? null : license,
        "sourceName": sourceName,
        "pricePerServing": pricePerServing,
        "id": id,
        "title": title,
        "readyInMinutes": readyInMinutes,
        "servings": servings,
        "sourceUrl": sourceUrl,
        "image": image,
        "imageType": imageType,
        "nutrition": nutrition.toJson(),
        "summary": summary,
        "cuisines": List<dynamic>.from(cuisines.map((x) => x)),
        "dishTypes": List<dynamic>.from(dishTypes.map((x) => x)),
        "diets": List<dynamic>.from(diets.map((x) => x)),
        "occasions": List<dynamic>.from(occasions.map((x) => x)),
        "analyzedInstructions":
            List<dynamic>.from(analyzedInstructions.map((x) => x.toJson())),
        "spoonacularSourceUrl": spoonacularSourceUrl,
        "preparationMinutes":
            preparationMinutes == null ? null : preparationMinutes,
        "cookingMinutes": cookingMinutes == null ? null : cookingMinutes,
      };
}

class AnalyzedInstruction {
  AnalyzedInstruction({
    this.name,
    this.steps,
  });

  String name;
  List<Step> steps;

  factory AnalyzedInstruction.fromJson(Map<String, dynamic> json) =>
      AnalyzedInstruction(
        name: json["name"],
        steps: List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "steps": List<dynamic>.from(steps.map((x) => x.toJson())),
      };
}

class Step {
  Step({
    this.number,
    this.step,
    this.ingredients,
    this.equipment,
    this.length,
  });

  double number;
  String step;
  List<Ent> ingredients;
  List<Ent> equipment;
  Length length;

  factory Step.fromJson(Map<String, dynamic> json) => Step(
        number: json["number"],
        step: json["step"],
        ingredients:
            List<Ent>.from(json["ingredients"].map((x) => Ent.fromJson(x))),
        equipment:
            List<Ent>.from(json["equipment"].map((x) => Ent.fromJson(x))),
        length: json["length"] == null ? null : Length.fromJson(json["length"]),
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "step": step,
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
        "equipment": List<dynamic>.from(equipment.map((x) => x.toJson())),
        "length": length == null ? null : length.toJson(),
      };
}

class Ent {
  Ent({
    this.id,
    this.name,
    this.localizedName,
    this.image,
    this.temperature,
  });

  int id;
  String name;
  String localizedName;
  String image;
  Length temperature;

  factory Ent.fromJson(Map<String, dynamic> json) => Ent(
        id: json["id"],
        name: json["name"],
        localizedName: json["localizedName"],
        image: json["image"],
        temperature: json["temperature"] == null
            ? null
            : Length.fromJson(json["temperature"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "localizedName": localizedName,
        "image": image,
        "temperature": temperature == null ? null : temperature.toJson(),
      };
}

class Length {
  Length({
    this.number,
    this.unit,
  });

  double number;
  String unit;

  factory Length.fromJson(Map<String, dynamic> json) => Length(
        number: json["number"],
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "unit": unit,
      };
}

class Nutrition {
  Nutrition({
    this.nutrients,
    this.properties,
    this.flavanoids,
    this.ingredients,
    this.caloricBreakdown,
    this.weightPerServing,
  });

  List<Flavanoid> nutrients;
  List<Flavanoid> properties;
  List<Flavanoid> flavanoids;
  List<Ingredient> ingredients;
  CaloricBreakdown caloricBreakdown;
  WeightPerServing weightPerServing;

  factory Nutrition.fromJson(Map<String, dynamic> json) => Nutrition(
        nutrients: List<Flavanoid>.from(
            json["nutrients"].map((x) => Flavanoid.fromJson(x))),
        properties: List<Flavanoid>.from(
            json["properties"].map((x) => Flavanoid.fromJson(x))),
        flavanoids: List<Flavanoid>.from(
            json["flavanoids"].map((x) => Flavanoid.fromJson(x))),
        ingredients: List<Ingredient>.from(
            json["ingredients"].map((x) => Ingredient.fromJson(x))),
        caloricBreakdown: CaloricBreakdown.fromJson(json["caloricBreakdown"]),
        weightPerServing: WeightPerServing.fromJson(json["weightPerServing"]),
      );

  Map<String, dynamic> toJson() => {
        "nutrients": List<dynamic>.from(nutrients.map((x) => x.toJson())),
        "properties": List<dynamic>.from(properties.map((x) => x.toJson())),
        "flavanoids": List<dynamic>.from(flavanoids.map((x) => x.toJson())),
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
        "caloricBreakdown": caloricBreakdown.toJson(),
        "weightPerServing": weightPerServing.toJson(),
      };
}

class CaloricBreakdown {
  CaloricBreakdown({
    this.percentProtein,
    this.percentFat,
    this.percentCarbs,
  });

  double percentProtein;
  double percentFat;
  double percentCarbs;

  factory CaloricBreakdown.fromJson(Map<String, dynamic> json) =>
      CaloricBreakdown(
        percentProtein: json["percentProtein"].toDouble(),
        percentFat: json["percentFat"].toDouble(),
        percentCarbs: json["percentCarbs"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "percentProtein": percentProtein,
        "percentFat": percentFat,
        "percentCarbs": percentCarbs,
      };
}

class Flavanoid {
  Flavanoid({
    this.name,
    this.title,
    this.amount,
    this.unit,
    this.percentOfDailyNeeds,
  });

  String name;
  String title;
  double amount;
  Unit unit;
  double percentOfDailyNeeds;

  factory Flavanoid.fromJson(Map<String, dynamic> json) => Flavanoid(
        name: json["name"],
        title: json["title"],
        amount: json["amount"].toDouble(),
        unit: unitValues.map[json["unit"]],
        percentOfDailyNeeds: json["percentOfDailyNeeds"] == null
            ? null
            : json["percentOfDailyNeeds"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "title": title,
        "amount": amount,
        "unit": unitValues.reverse[unit],
        "percentOfDailyNeeds":
            percentOfDailyNeeds == null ? null : percentOfDailyNeeds,
      };
}

enum Unit { MG, EMPTY, G, KCAL, UNIT_G, IU }

final unitValues = EnumValues({
  "": Unit.EMPTY,
  "µg": Unit.G,
  "IU": Unit.IU,
  "kcal": Unit.KCAL,
  "mg": Unit.MG,
  "g": Unit.UNIT_G
});

class Ingredient {
  Ingredient({
    this.id,
    this.name,
    this.amount,
    this.unit,
    this.nutrients,
  });

  int id;
  String name;
  double amount;
  String unit;
  List<Flavanoid> nutrients;

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        id: json["id"],
        name: json["name"],
        amount: json["amount"].toDouble(),
        unit: json["unit"],
        nutrients: List<Flavanoid>.from(
            json["nutrients"].map((x) => Flavanoid.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "amount": amount,
        "unit": unit,
        "nutrients": List<dynamic>.from(nutrients.map((x) => x.toJson())),
      };
}

class WeightPerServing {
  WeightPerServing({
    this.amount,
    this.unit,
  });

  int amount;
  Unit unit;

  factory WeightPerServing.fromJson(Map<String, dynamic> json) =>
      WeightPerServing(
        amount: json["amount"],
        unit: unitValues.map[json["unit"]],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "unit": unitValues.reverse[unit],
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
