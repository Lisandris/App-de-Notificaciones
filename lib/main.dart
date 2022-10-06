import 'package:flutter/material.dart';
import 'package:app_notificaciones/services/push_notifications_services.dart';
import 'package:app_notificaciones/screens/home_screen.dart';
import 'package:app_notificaciones/screens/message_screen.dart';

void main() async {

  
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();

  runApp(MyApp());

}

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