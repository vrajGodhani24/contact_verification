import 'package:contact_verification/verify_otp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'homepage.dart';
import 'login_mobile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'mobile_login',
      routes: {
        '/': (context) => const HomePage(),
        'mobile_login': (context) => const MobileLogin(),
        'verify_otp': (context) => const VerifyOTP(),
      },
    ),
  );
}
