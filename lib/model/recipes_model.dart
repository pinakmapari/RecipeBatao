// class Recipes {
//   final int id;
//   final String title;
//   final String image;

//   Recipes({this.id, this.title, this.image});

//   factory Recipes.fromMap(Map<String, dynamic> json) {
//     return Recipes(id: json['id'], title: json['title'], image: json['image']);
//   }
// }

// class Recipes {
//   final int id, readyInMinutes, servings;
//   final String sourceName, title, sourceURL, image;
//   final List<String> steps, dishTypes, cuisines;
//   final List<dynamic> nutrients, ingredients;

//   Recipes(
//       {this.sourceName,
//       this.id,
//       this.title,
//       this.readyInMinutes,
//       this.servings,
//       this.sourceURL,
//       this.image,
//       this.nutrients,
//       this.ingredients,
//       this.steps,
//       this.dishTypes,
//       this.cuisines});

//   factory Recipes.fromMap(Map<String, dynamic> map) {
//     // List<Recipes> recipes = [];
//     // map['results']
//     //     .forEach((recipeMap) => recipes.add(Recipes.fromMap(recipeMap)));
//     return Recipes(
//         sourceName: map['sourceName'],
//         id: map['id'],
//         title: map['title'],
//         readyInMinutes: map['readyInMinutes'],
//         servings: map['servings'],
//         sourceURL: map['sourceURL'],
//         image: map['image'],
//         dishTypes: map['dishTypes'],
//         cuisines: map['cuisines'],
//         nutrients: map['nutrients'],
//         ingredients: map['ingredients']);
//   }
// }
