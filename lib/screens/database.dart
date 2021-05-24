import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  static String userid;
  static Map data = {};
  Database();
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future updateUserData(String uid) async {
    userid = uid;
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
  }
}
