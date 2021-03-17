import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  String userid;
  Database();
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future updateUserData(String uid) async {
    userid = uid;
    return await userCollection.document(uid).setData({
      'uid': uid,
    });
  }

  Future addData(
      String name, String email, String phNo, String age, List cuisines) async {
    return await userCollection.document(userid).setData({
      'uid': userid,
      'name': name,
      'email': email,
      'phNo': phNo,
      'age': age,
      'cuisines': cuisines,
    });
  }

  Future addImage(String imgAddress) async {
    return await userCollection.document(userid).setData({
      'imgAddress': imgAddress,
    });
  }
}
