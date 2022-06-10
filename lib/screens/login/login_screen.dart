import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helpers/validators.dart';
import '../../models/user_manager.dart';
import '../../models/user_person.dart';

class LoginScreen extends StatelessWidget {
 LoginScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Entrar'),
          centerTitle: true,
        ),
        body: Center(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(16),
                shrinkWrap: true,
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: 'E-mail',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    validator: (email) {
                      if (!emailValid(email!)) {
                        return 'E-mail inválido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      hintText: 'Senha',
                    ),
                    autocorrect: false,
                    obscureText: true,
                    validator: (pass) {
                      if (pass!.isEmpty || pass.length < 6) {
                        return 'Senha inválida';
                      }else{
                        return null;
                      }
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      child: const Text('Esqueci minha senha' , style: TextStyle(color: Color.fromARGB(255, 68, 68, 68)),),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 44,
                    child: ElevatedButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                         context.read<UserManager>().signIn( // pega o provider e faz login
                          UserPerson( // recebe usuario com parametros do model e construtor
                            email: emailController.text,
                            password: passwordController.text,
                          )
                         );
                        }
                      },
                      child: const Text(
                        'Entrar',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
