
import 'package:get_it/get_it.dart';
import 'package:watsapp/repository/user_repository.dart';
import 'package:watsapp/services/fake_auth_service.dart';
import 'package:watsapp/services/firebase_auth_service.dart';
import 'package:watsapp/services/firestoreDb_service.dart';

GetIt locator=GetIt();
void setupLocator(){
  locator.registerLazySingleton(()=>FirebaseAuthService());
  locator.registerLazySingleton(()=>FakeAuthService());
  locator.registerLazySingleton(()=>UserRepository());
  locator.registerLazySingleton(() => FirestoreDBService());
}