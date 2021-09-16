import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/login.dart';
import 'package:flutter_app/provider/product.dart';
import 'package:flutter_app/provider/provider.dart';
import 'package:provider/provider.dart';
import './Pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/Pages/admin.dart';
void main() async
{ WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
  //ChangeNotifierProvider.value(value: UserProvider.initialize()),
    ChangeNotifierProvider.value(value: ProductProvider.initialize()),

],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  Login(),

      ),
  ),
  );
}
