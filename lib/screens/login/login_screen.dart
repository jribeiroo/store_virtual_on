
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:store_virtual_pro/helpers/validators.dart';
import 'package:store_virtual_pro/models/user_manager.dart';
import 'package:store_virtual_pro/models/user_person.dart';


class LoginScreen extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              children: <Widget>[
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(hintText: 'E-mail'),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  validator: (email){
                    if(!emailValid(email!)) {
                      return 'E-mail inválido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  controller: passController,
                  decoration: const InputDecoration(hintText: 'Senha'),
                  autocorrect: false,
                  obscureText: true,
                  validator: (pass){
                    if(pass!.isEmpty || pass.length < 6) {
                      return 'Senha inválida';
                    }
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: (){

                    },
                    style: TextButton.styleFrom(
                      primary: const Color.fromARGB(255, 94, 94, 94),
                    ),
                    child: const Text(
                      'Esqueci minha senha', 
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                const SizedBox(height: 16,),
                SizedBox(
                  height: 44,
                  child: ElevatedButton(
                    onPressed: (){
                      // ignore: unnecessary_new
                      FocusScope.of(context).requestFocus(new FocusNode());
                      if(formKey.currentState!.validate()){
                        context.read<UserManager>().signIn(
                          userPerson: UserPerson(
                            email: emailController.text,
                            password: passController.text
                          ),
                          onFail: (e){
                            scaffoldKey.currentState?.showSnackBar(
                              SnackBar(
                                content: Text('Falha ao entrar: $e'),
                                backgroundColor: Colors.red,
                              )
                            );
                          },
                          onSuccess: (){
                            // TODO: FECHAR TELA DE LOGIN
                          }
                        );
                      }
                    },
                    child: const Text(
                      'Entrar',
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}