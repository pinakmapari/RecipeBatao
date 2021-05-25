import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  static String userid;
  String itemid;
  static Map data = {};
  static Map itemData = {};
  Database();
  final CollectionReference userCollection =
      Firestore.instance.collection('users');
  final CollectionReference itemCollection =
      Firestore.instance.collection('kitchenItems');

//for user
  Future updateUserData(String uid) async {
    userid = uid;
    data = {
      'uid': uid,
      'name': '',
      'email': '',
      'phNo': '',
      'age': '',
      'cuisines': [],
      'imgAddress': '',
    };
    return await userCollection.document(uid).setData({
      'uid': uid,
      'name': '',
      'email': '',
      'phNo': '',
      'age': '',
      'cuisines': [],
      'imgAddress': '',
    });
  }

  Future addData(
      String name, String email, String phNo, String age, List cuisines) async {
    return await userCollection.document(userid).updateData({
      'uid': userid,
      'name': name,
      'email': email,
      'phNo': phNo,
      'age': age,
      'cuisines': cuisines,
    });
  }

  Future addImage(String imgAddress) async {
    return await userCollection.document(userid).updateData({
      'imgAddress': imgAddress,
    });
  }

  Future fetchData() async {
    DocumentSnapshot doc =
        await Firestore.instance.collection('users').document(userid).get();
    data = doc.data;
    print(data);
  }

  //for items

  Future addItem(String name, String date, String qty, String location,
      String color) async {
    return await itemCollection.document(itemid).setData({
      'id': userid,
      'name': name,
      'date': date,
      'qty': qty,
      'loc': location,
      'color': color,
    });
  }

  Future fetchItems() async {
    DocumentSnapshot itemdoc = await Firestore.instance
        .collection('kitchenItems')
        .document(itemid)
        .get();
    itemData = itemdoc.data;
  }
}
