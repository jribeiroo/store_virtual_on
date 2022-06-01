import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../helps/validators.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<
      FormState>(); // cria chave global para o formulario para poder validar

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
                    controller:
                        emailController, // para acessar o campo de email
                    decoration: const InputDecoration(
                      hintText: 'E-mail',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    validator: (email) {
                      if (!emailValid(email!)) {
                        return 'E-mail inválido';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller:
                        passwordController, // passar acessar o compo de senha
                    decoration: const InputDecoration(
                      hintText: 'Senha',
                    ),
                    autocorrect: false,
                    obscureText: true,
                    validator: (pass) {
                      if (pass!.isEmpty || pass.length < 6) {
                        return 'Senha inválida';
                      } else {
                        return null;
                      }
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      child: const Text(
                        'Esqueci minha senha',
                        style: TextStyle(
                            color: Color.fromARGB(255, 139, 139, 139)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 44,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          //validaçaõ de todos os campos
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
