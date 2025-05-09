import 'package:applications_dao/app/util/message.dart';
import 'package:applications_dao/app/view/home/hoempage.dart';
import 'package:applications_dao/app/view/register_screens/sigin_screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController username = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isSignin = false;

  @override
  Future<void> SignUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Showmessage(context, "Sign Up Successfuly",
          icon: Icons.flash_auto_rounded,
          backgroundColor: const Color.fromARGB(255, 33, 243, 121));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } on FirebaseAuthException catch (e) {
      Showmessage(context, "Can't Sign Up Please Try Again",
          icon: Icons.error,
          backgroundColor: const Color.fromARGB(255, 255, 93, 82));
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png', height: 100),
                const SizedBox(height: 16),
                const Text('Create Account',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                const Text(
                    'Fill Your Information Below Or\nRegister with your social account',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 24),
                TextField(
                  controller: username,
                  decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: 'your name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'your email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: '******',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    SignUp();
                  },
                  child: const Text('Sign Up'),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Already have an account? Sign In",
                    style: TextStyle(color: Colors.green),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
