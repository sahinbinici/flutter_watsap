import 'package:watsapp/models/user.dart';

abstract class DbBase{
  Future<bool> saveUser(User user);
}