import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../home/main.dart';



class LoginPage extends StatelessWidget {
  final matriculeController = TextEditingController();
  final passwordController = TextEditingController();
  Map<String, dynamic>? _enseignant;

  Map<String, dynamic>? get enseignant => _enseignant;

  set enseignant(Map<String, dynamic>? value) {
    _enseignant = value;
  }

  Future<bool> _authenticate(
      String inputMatricule, String inputPassword, BuildContext context) async {
    final matricule = matriculeController.text;
    final password = passwordController.text;

    final body = {'matricule': matricule, 'password': password};

    final uri = Uri.parse('http://localhost:3000/authenticate');

    try {
      final response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        _enseignant = jsonDecode(response.body) as Map<String, dynamic>;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Enseignant ${enseignant?['nom']} connecté.'),
            duration: Duration(seconds: 2),
          ),
        );

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MyApp()), // Replace with your main widget
        );

        return true;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Matricule or password incorrect.'),
            duration: Duration(seconds: 2),
          ),
        );
        return false;
      }
    } catch (error) {
      print('Error during authentication: $error');
      // Handle the error as needed
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(),
              _inputField(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Column(
      children: [
        Image.asset('assets/logo1.png', width: 150, height: 150),
      ],
    );
  }

  Widget _inputField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: matriculeController,
          decoration: InputDecoration(
            hintText: "Matricule Enseignant",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Color.fromARGB(255, 186, 185, 185).withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.email_outlined),
          ),
        ),
        SizedBox(height: 8),
        TextField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Mot de passe",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Color.fromARGB(255, 186, 185, 185).withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.lock_outline),
          ),
        ),
        SizedBox(height: 15),
        ElevatedButton(
          onPressed: () async {
            final matricule = matriculeController.text;
            final password = passwordController.text;

            if (matricule.isEmpty || password.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Matricule and password are required.'),
                  duration: Duration(seconds: 2),
                ),
              );
              return;
            }

            final authenticationResult =
                await _authenticate(matricule, password, context);

            if (authenticationResult) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Enseignant ${enseignant?['nom']} connecté.'),
                  duration: Duration(seconds: 2),
                ),
              );

              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => MyApp()), // Replace with your main widget
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Matricule or password incorrect.'),
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
          child: Text(
            "Connexion",
            style: TextStyle(fontSize: 20),
          ),
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(vertical: 20),
          ),
        ),
      ],
    );
  }
}
