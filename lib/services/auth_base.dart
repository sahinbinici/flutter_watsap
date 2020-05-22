import 'package:watsapp/models/user_model.dart';

abstract class AuthBase{
  Future<User>currentUser();
  Future<User> signInAnonymously();
  Future<bool> signOut();
  Future<User> signInWithGoogle();
  Future<User> signInWithFaceBook();
  Future<User> signInWithEmailAndPassword(String email,String password);
  Future<User> createUserEmailAndPassword(String emaiil,String password);
}