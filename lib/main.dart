import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/screens/signup_screen.dart';
import 'package:instagram_clone/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyCJLaNGr4eTZUnXQK2CWGKhrniD9uZ1tGw',
        appId: '1:636073620275:web:b9db016f528402f74e0446',
        messagingSenderId: '636073620275',
        projectId: 'instagram-clone-55427',
        storageBucket: 'instagram-clone-55427.appspot.com',
        authDomain: "instagram-clone-55427.firebaseapp.com",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      // home: const ResponsiveLayout(webScreenLayout: WebsiteScreenLayout(), mobileScreenLayout: MobileScreenLayout()),
      home: const SignupScreen(),
    );
  }
}