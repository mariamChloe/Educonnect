import 'package:flutter/material.dart';

import '../menu/drawer/drawer.dart';


class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  int _selectedTabIndex = 0;

  void _handleTabSelection(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Change the background color as needed
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Connectez-vous avec votre compte',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
           
            ElevatedButton(
              onPressed: () {
                // Add your login logic here based on the selected tab
                if (_selectedTabIndex == 0) {
                  // Login using email
                } else {
                  // Login using phone number
                }
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) =>  HomePage()),
  );
              },
              child: Text('go to home'),
            ),
          ],
        ),
      ),
    );
  }
}
