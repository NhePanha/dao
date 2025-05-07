import 'package:applications_dao/app/util/message.dart';
import 'package:applications_dao/app/view/register_screens/sigin_screens.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', height: 100),
            SizedBox(height: 16),
            Text('Create Account',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
                'Fill Your Information Below Or\nRegister with your social account',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey)),
            SizedBox(height: 24),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'your name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'your email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: '******',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Showmessage(context, "Login successfuly",
                    icon: Icons.flash_auto_rounded,
                    backgroundColor: Colors.blue);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text('Sing Up'),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Already have an account? Signup",
                style: TextStyle(color: Colors.green),
              ),
            )
          ],
        ),
      ),
    );
  }
}
