import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:store_virtual_pro/models/user_person.dart';

class UserManager {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signIn(UserPerson userPerson) async {
    try { //login com sucesso
      final UserCredential credential = await auth.signInWithEmailAndPassword(
          email: userPerson.email, password: userPerson.password);
      if (kDebugMode) {
        print(credential.user?.uid);
      } 
    } on PlatformException catch (e) { //login com erro
      if (kDebugMode) {
        print(e);  
      }
    }
  }
}
