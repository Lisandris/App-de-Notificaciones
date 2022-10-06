import 'package:flutter/material.dart';
import 'package:app_notificaciones/services/push_notifications_services.dart';
import 'package:app_notificaciones/screens/home_screen.dart';
import 'package:app_notificaciones/screens/message_screen.dart';

void main() async {

  
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();

  runApp(MyApp());

}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();

    // context!
    PushNotificationService.messagesStream.listen((message) {

      print('MyApp: $message');
    });
    
    
  }

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