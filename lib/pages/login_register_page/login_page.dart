import 'package:first_app/pages/login_register_page/authentication/sign_in_button.dart';
import 'package:first_app/pages/login_register_page/register_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'authentication/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _title() {
    return const Text('Welcome !',
        style: TextStyle(
            color: Color(0xff433831),
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins'));
  }

  Widget _msg() {
    return const Text(
      '\nTo continue using Gnome, please login first.',
      style: TextStyle(
          color: Color(0xff433831), fontSize: 15, fontFamily: 'Poppins'),
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
        obscureText: title == 'Password' ? true : false,
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
          Text(
            'Forgot Password?',
            style: TextStyle(
              color: Color.fromARGB(255, 146, 144, 141),
              fontFamily: 'Poppins',
              fontSize: 15,
            ),
          ),
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
        backgroundColor: const Color(0xff433831),
        foregroundColor: Colors.white,
      ),
      onPressed: () {
        signInWithEmailAndPassword();
      },
      child: const Text('L o g i n',
          style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
          textAlign: TextAlign.center),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RegisterPage()),
        );
      },
      child: const Text('Need an account ? Register Now',
          style: TextStyle(
              color: Color(0xff433831),
              decoration: TextDecoration.underline,
              fontFamily: 'Poppins')),
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
                  fontFamily: 'Poppins')),
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
                const SizedBox(height: 60),
                _title(),
                _msg(),
                Image.asset('images/GNOME_Logo.png', height: 200, width: 200),
                _entryField('Email', emailController),
                const SizedBox(height: 12),
                _entryField('Password', passwordController),
                const SizedBox(height: 5),
                forgotPassword(),
                const SizedBox(height: 15),
                _errorMessage(),
                _submitButton(),
                const SizedBox(height: 15),
                continueWith(),
                const SizedBox(height: 12),
                googleIcon(),
                const SizedBox(height: 20),
                _loginOrRegisterButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
