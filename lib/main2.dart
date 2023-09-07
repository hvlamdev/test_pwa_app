import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyD2DcWvX9mT1RLecqMBlzXN9VpmZuk91Gs',
        authDomain: 'pwatesting-29f3c.firebaseapp.com',
        databaseURL: 'https://pwatesting-29f3c.firebaseio.com',
        projectId: 'pwatesting-29f3c',
        storageBucket: 'pwatesting-29f3c.appspot.com',
        messagingSenderId: '661701596572',
        appId: '1:661701596572:web:1f60660d790175e1fd6459',
      ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// Create a [AndroidNotificationChannel] for heads up notifications
  late AndroidNotificationChannel channel;

  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  bool isFlutterLocalNotificationsInitialized = false;

  @override
  void initState() {
    super.initState();
    requestPermission();
  }

  void messageListener(BuildContext context) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification?.body}');
        showDialog(
            context: context,
            builder: ((BuildContext context) {
              return AlertDialog(
                  title: Text(message.notification?.title ?? ''), content: Text(message.notification?.body ?? ''));
            }));
      }
    });
  }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');
  }

  @override
  Widget build(BuildContext context) {
    return const NotificationPage();
  }
}

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<StatefulWidget> createState() => _Application();
}

class _Application extends State<NotificationPage> {
  String? _token;
  Stream<String>? _tokenStream;
  int notificationCount = 0;

  void setToken(String? token) {
    print('FCM TokenToken: $token');
    setState(() {
      _token = token ?? '';
    });
  }

  @override
  void initState() {
    super.initState();
    //get token
    FirebaseMessaging.instance
        .getToken(vapidKey: 'BEfMlYPQbdyDhb_luhWHkEwpW0nbW0ehpatVRBw7M67DBJWRT8V-bXcxe2NSLsVAoneDssI1ImO41GBasGz_wOs')
        .then(setToken);
    _tokenStream = FirebaseMessaging.instance.onTokenRefresh;
    _tokenStream?.listen(setToken);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Firebase push notification'),
        ),
        body: Center(
          child: Card(
            margin: const EdgeInsets.all(10),
            elevation: 10,
            child: ListTile(
              title: Center(
                child: Column(
                  children: [
                    Text('_token: $_token'),
                    OutlinedButton.icon(
                      label: const Text(
                        'Push Notification',
                        style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      icon: const Icon(Icons.notifications),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
