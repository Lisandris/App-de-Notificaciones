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

  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey = new GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();

    // context!
    PushNotificationService.messagesStream.listen((message) {

      print('MyApp: $message');
      // Navigator.pushNamed(context, 'message');
      navigatorKey.currentState?.pushNamed('message', arguments: message);

      final snackBar = SnackBar(content: Text (message));
      messengerKey.currentState?.showSnackBar(snackBar);
    });
    
    
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      navigatorKey: navigatorKey, /* Para navegar */
      scaffoldMessengerKey: messengerKey, /* Snakcs */
      routes: {
        'home'   : ( _ ) => HomeScreen(),
        'message': ( _ ) => MessageScreen(),
      },
    );
  }
}