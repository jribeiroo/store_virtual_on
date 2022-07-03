import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:store_virtual_pro/helpers/firebase_erros.dart';
import 'package:store_virtual_pro/models/user_person.dart';



class UserManager {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signIn({required UserPerson userPerson, required Function onFail, required Function onSuccess}) async {
    //onFail para quando falhar chamar para tela de login com erro aplicado(callBack)
    try {
      //login com sucesso
      final UserCredential credential = await auth.signInWithEmailAndPassword(email: userPerson.email, password: userPerson.password);

      onSuccess();
    }
    on PlatformException catch (e) {
     
    onFail(getErrorString(e.code));
    }
  }
}
