import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:watsapp/models/user.dart';
import 'package:watsapp/services/database_base.dart';

class FirestoreDBService implements DbBase{
  final Firestore _fireBaseAuth=Firestore.instance;


  @override
  Future<bool> saveUser(User user) async{

    await _fireBaseAuth.collection("/users").document(user.userID).setData(user.toMap());

    DocumentSnapshot _okunanUser =await Firestore.instance.document("users/${user.userID}").get();
    Map _okunanUserBilgileriMap=_okunanUser.data;
    User okunanUSerBilgileriNesne=User.fromMap(_okunanUserBilgileriMap);
    debugPrint(okunanUSerBilgileriNesne.toString());
    return true;
  }

}