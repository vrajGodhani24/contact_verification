import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyOTP extends StatefulWidget {
  const VerifyOTP({super.key});

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  final verifyEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String verificationId =
        ModalRoute.of(context)!.settings.arguments.toString();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: verifyEditingController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "6 digit Code",
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                final credential = PhoneAuthProvider.credential(
                  verificationId: verificationId,
                  smsCode: verifyEditingController.text.toString(),
                );

                await FirebaseAuth.instance.signInWithCredential(credential);

                Navigator.of(context).pushNamed('/');
              },
              child: const Text("Verify"),
            ),
          ],
        ),
      ),
    );
  }
}
