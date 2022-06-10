// ignore_for_file: avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_virtual_pro/screens/base/base_screend.dart';

import 'models/user_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create:(_) => UserManager(),
      child: MaterialApp(
        title: 'Loja do jorge',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        primarySwatch: Colors.teal,
         scaffoldBackgroundColor: Colors.teal,
         appBarTheme: const AppBarTheme(elevation:0),
         visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BaseScreen(),
      ),
    );
  }
}
