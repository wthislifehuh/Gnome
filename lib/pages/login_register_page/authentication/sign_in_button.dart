import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth_class.dart';

class SignInButton extends StatefulWidget {
  const SignInButton({super.key});
  @override
  State<SignInButton> createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {
  var isSigningIn = false;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Authentication.initializeFirebase(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Error initializing Firebase');
        } else if (snapshot.connectionState == ConnectionState.done) {
          return GestureDetector(
            onTap: () async {
              setState(() {
                isSigningIn = true;
              });

              User? user =
                  await Authentication.signInWithGoogle(context: context);

              setState(() {
                isSigningIn = false;
              });

              if (user != null) {
                Get.to(() => const HomePage());
              }
              // if (user != null) {
              //   Get.off(() => UserInfoScreen(user: user));
              // }
            },
            child: Image.asset('images/Google_Logo.png', height: 30, width: 30),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
