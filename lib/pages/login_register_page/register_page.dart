import 'package:first_app/pages/login_register_page/authentication/sign_in_button.dart';
import 'package:first_app/pages/login_register_page/login_page.dart';
import 'package:first_app/style/colours.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'auth.dart';
//import 'package:first_app/pages/login_register_page/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? errorMessage = '';

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // Future<void> createUserWithEmailAndPassword() async {
  //   try {
  //     await Auth().createUserWithEmailAndPassword(
  //       email: emailController.text,
  //       password: passwordController.text,
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     setState(() {
  //       errorMessage = e.message;
  //     });
  //   }
  // }

  void signUp() async {
    //show loading circle
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    //make sure password match
    if (passwordController.text != confirmPasswordController.text) {
      //pop loading circle
      Navigator.pop(context);
      //show error to user
      displayMessage("Passwords don't match!");
      return;
    }

    //try creating the user
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);

      //after creating the user, create a new document on firestore called Users
      FirebaseFirestore.instance
          .collection("Users")
          .doc(userCredential.user!.email)
          .set({
        'username': emailController.text.split('@')[0], //initial username
        'bio': 'Empty bio...', //intial bio
      });

      FirebaseFirestore.instance
          .collection("Sensor Data")
          .doc(userCredential.user!.email)
          .set({
        'Air Humidity': 0.0, //initial
        'Air Temperature': 0.0,
        'Soil Humidity': 0.0,
        'Risk Score': 0.0,
        'Date': "00/00/0000",
        'Time': "00:00:00",
      });

      //pop laoding circle
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop loading circle
      Navigator.pop(context);
      //show error to user
      displayMessage(e.code);
    }
  }

  //display a dialog message
  void displayMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xff433831),
            fontFamily: 'Poppins',
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget _msg() {
    return const Text(
      '\nLet\'s create an account for you',
      style: TextStyle(
        color: Color(0xff433831),
        fontSize: 16,
        fontFamily: 'Poppins',
      ),
    );
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        enabled: true,
        controller: controller,
        obscureText: title.contains('Password'),
        decoration: InputDecoration(
          hintText: title,
          hintStyle: const TextStyle(color: Colors.grey, fontFamily: 'Poppins'),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xfff8f7f4)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xfff8f7f4)),
          ),
          fillColor: const Color(0xfff8f7f4),
          filled: true,
        ),
      ),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Error: $errorMessage',
        style: const TextStyle(color: Colors.red));
  }

  Widget forgotPassword() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('Forgot Password?',
              style: TextStyle(
                color: Color(0xff433831),
                fontFamily: 'Poppins',
              )),
        ],
      ),
    );
  }

  Widget _submitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(300, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        backgroundColor: const Color(0xff433831),
        foregroundColor: Colors.white,
      ),
      onPressed: () {
        signUp();
      },
      child: const Text(
        'R e g i s t e r',
        style: TextStyle(
          color: AppColors.lightBrown,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      },
      child: const Text(
        'Already have an account ? Login Now',
        style: TextStyle(
          color: Color(0xff433831),
          decoration: TextDecoration.underline,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }

  Widget continueWith() {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 0.5,
            color: Color.fromARGB(255, 188, 171, 160),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text('Or continue with',
              style: TextStyle(
                  color: Color.fromARGB(255, 115, 100, 90),
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.w500)),
        ),
        Expanded(
          child: Divider(
            thickness: 0.5,
            color: Color.fromARGB(255, 184, 171, 163),
          ),
        ),
      ],
    );
  }

  Widget googleIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SignInButton(),
        //Image.asset('images/Google_Logo.png', height: 30, width: 30),
        const SizedBox(width: 30),
        Image.asset('images/Apple_Logo.png', height: 30, width: 30),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe8e0d8),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20),
                Image.asset('images/GNOME_Logo.png', height: 200, width: 200),
                _msg(),
                const SizedBox(height: 30),
                _entryField('Email', emailController),
                const SizedBox(height: 12),
                _entryField('Password', passwordController),
                const SizedBox(height: 15),
                _entryField('Confirm Password', confirmPasswordController),
                const SizedBox(height: 5),
                forgotPassword(),
                const SizedBox(height: 15),
                _errorMessage(),
                _submitButton(),
                const SizedBox(height: 15),
                continueWith(),
                const SizedBox(height: 12),
                googleIcon(),
                _loginOrRegisterButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
