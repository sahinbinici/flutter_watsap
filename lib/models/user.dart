import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class User{
  final String userID;
  String email;
  String username;
  String profilURL;
  DateTime createdAt;
  DateTime updatedAt;
  int seviye;
  User({@required this.userID,@required this.email});

  Map<String,dynamic> toMap(){
    return {
      'userID':userID,
      'email':email,
      'username': username,
      'proilURL':profilURL,
      'createdAt':createdAt ?? FieldValue.serverTimestamp(),
      'updatedAt':updatedAt ?? FieldValue.serverTimestamp(),
      'seviye':seviye ?? 1
    };

  }

  User.fromMap(Map<String,dynamic> map):
      userID=map['userID'],
      email=map['email'],
      username=map['username'],
      profilURL=map['profilURL'],
      createdAt=(map['createdAt'] as Timestamp).toDate(),
      updatedAt=(map['updatedAt'] as Timestamp).toDate(),
      seviye=map['seviye'];

  @override
  String toString() {
    return 'User{userID: $userID, email: $email, username: $username, profilURL: $profilURL, createdAt: $createdAt, updatedAt: $updatedAt, seviye: $seviye}';
  }

  String randomSayiUret() {
    int rastgeleSayi=Random().nextInt(99999);
    return rastgeleSayi.toString();
  }
}