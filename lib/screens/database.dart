import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  static String userid;
  static String itemid;
  static Map data = {};
  static Map itemData = {};
  Database();
  final CollectionReference userCollection =
      Firestore.instance.collection('users');
  final CollectionReference itemCollection =
      Firestore.instance.collection('kitchenItems');

//for user
  void updateUserData(String uid) {
    userid = uid;
    userCollection.document(uid).updateData({
      'uid': uid,
    });
  }

  void addData(
      String name, String email, String phNo, String age, List cuisines) {
    //print("User ID: " + userid);
    userCollection.document(userid).updateData({
      'name': name,
      'email': email,
      'phNo': phNo,
      'age': age,
      'cuisines': cuisines,
    });
  }

  void addImage(String imgAddress) {
    userCollection.document(userid).updateData({
      'imgAddress': imgAddress,
    });
  }

  //for items

  void addItem(
      String name, String date, String qty, String location, String color) {
    itemCollection.document(itemid).setData({
      'id': userid,
      'name': name,
      'date': date,
      'qty': qty,
      'loc': location,
      'color': color,
    });
  }

  void fetchItems() {}
}
