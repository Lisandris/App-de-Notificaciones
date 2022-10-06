import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// SHA1: 44:DB:96:8D:99:A8:EA:7D:F2:E3:87:58:E7:56:35:A0:DD:AB:CD:E7



class PushNotificationService{

static FirebaseMessaging messaging = FirebaseMessaging.instance;
static String? token;


static Future _backgroundHandler( RemoteMessage message ) async {
  print(' onbackground Handler ${ message.messageId }');
}

static Future _onMessageHandler( RemoteMessage message ) async {
  print('onMessage Handler ${ message.messageId }');
}

static Future _onMessageOpenApp( RemoteMessage message ) async {
  print('onMessagwOpenApp Handler ${ message.messageId }');
}


static Future initializeApp() async {

  // pushh notifications
  await Firebase.initializeApp();
  token = await FirebaseMessaging.instance.getToken();
  print('Token: $token');

  // Handlers
  FirebaseMessaging.onBackgroundMessage( _backgroundHandler);
  FirebaseMessaging.onMessage.listen( _onMessageHandler);
  FirebaseMessaging.onMessageOpenedApp.listen( _onMessageOpenApp);

  // local notifications
}


}