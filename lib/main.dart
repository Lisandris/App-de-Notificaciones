import 'package:app_notificaciones/screens/home_screen.dart';
import 'package:app_notificaciones/screens/message_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home'   : ( _ ) => HomeScreen(),
        'message': ( _ ) => MessageScreen(),
      },
    );
  }
}