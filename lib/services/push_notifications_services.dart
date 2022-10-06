import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// SHA1: 44:DB:96:8D:99:A8:EA:7D:F2:E3:87:58:E7:56:35:A0:DD:AB:CD:E7



class PushNotificationService{

static FirebaseMessaging messaging = FirebaseMessaging.instance;
static String? token;
static final StreamController<String> _messageStream = new StreamController.broadcast();
static Stream<String> get messagesStream => _messageStream.stream;

static Future _backgroundHandler( RemoteMessage message ) async {
  // print(' onbackground Handler ${ message.messageId }');
  print( message.data );
  _messageStream.add( message.notification?.body ?? 'No title' );
}

static Future _onMessageHandler( RemoteMessage message ) async {
  // print('onMessage Handler ${ message.messageId }');
  print( message.data );
 _messageStream.add( message.notification?.body ?? 'No title' );

}

static Future _onMessageOpenApp( RemoteMessage message ) async {
  // print('onMessagwOpenApp Handler ${ message.messageId }');
 print( message.data );
 _messageStream.add( message.notification?.body ?? 'No title' );
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

  static closeStreams(){
    _messageStream.close();
  }

}