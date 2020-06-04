import 'package:watsapp/models/user.dart';

abstract class AuthBase{
  Future<User>currentUser();
  Future<User> signInAnonymously();
  Future<bool> signOut();
  Future<User> signInWithGoogle();
  Future<User> signInWithFaceBook();
  Future<User> signInWithEmailAndPassword(String email,String password);
  Future<User> createUserEmailAndPassword(String email,String password);
}