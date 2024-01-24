import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MobileLogin extends StatefulWidget {
  const MobileLogin({super.key});

  @override
  State<MobileLogin> createState() => _MobileLoginState();
}

class _MobileLoginState extends State<MobileLogin> {
  final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Mobile Number",
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.verifyPhoneNumber(
                  phoneNumber: textEditingController.text.toString(),
                  verificationCompleted: (e) {
                    print('===================');
                    print(e);
                    print('===================');
                  },
                  verificationFailed: (e) {
                    print('-----------------------');
                    print(e);
                    print('-----------------------');
                  },
                  codeSent: (String verificationId, int? token) {
                    Navigator.of(context)
                        .pushNamed('verify_otp', arguments: verificationId);
                  },
                  codeAutoRetrievalTimeout: (e) {
                    print('*****************');
                    print(e);
                    print('*****************');
                  },
                );
              },
              child: const Text("Get OTP"),
            ),
          ],
        ),
      ),
    );
  }
}
