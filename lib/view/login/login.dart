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
  } // Déclaration du champ


  Future<bool> _authenticate(
      String inputMatricule, String inputPassword, dynamic context) async {
    // Get the values from the text fields
    final matricule = matriculeController.text;
    final password = passwordController.text;
// Ajout du getter pour l'enseignant


    // Create an object to send to the backend
    final body = {'matricule': matricule, 'password': password};

    // Make the POST request to the backend
    final uri = Uri.parse('http://localhost:3000/authenticate'); // Adjust the endpoint
    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      print('Authentication successful: ${response.body}');
            _enseignant = jsonDecode(response.body) as Map<String, dynamic>;


      // Authentication successful, navigate to the main page
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
      return true; // Return true if authentication is successful
    } else {
      // Authentication failed, show an error message
      print('Authentication failed: ${response.statusCode},${response.body}');
      // You can display an error message to the user here
      return false; // Return false if authentication fails
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(context),
              _inputField(context),
              _forgotPassword(context),
            ],
          ),
        ),
      ),
    );
  }

  _header(context) {
    return Column(
      children: [
        Image.asset('assets/logo1.png', width: 150, height: 150),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Bonjour ",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 47, 45, 45),
                ),
              ),
              WidgetSpan(
                child: Icon(
                  Icons.waving_hand_rounded,
                  size: 17,
                  color: Color.fromARGB(255, 253, 194, 56),
                ),
              ),
            ],
          ),
        ),
        Text("Connectez-vous"),
        Text("à votre espace de suivi"),
      ],
    );
  }

  _inputField(context) {
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
            // Get the values from the text fields
            final matricule = matriculeController.text;
            final password = passwordController.text;

            // Validate matricule and password
            if (matricule.isEmpty || password.isEmpty) {
              // Show an error message to the user
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Matricule and password are required.'),
                  duration: Duration(seconds: 2),
                ),
              );
              return;
            }

            // Authenticate
            final authenticationResult =
                await _authenticate(matricule, password, context);

            if (authenticationResult) {
              // Show a success message to the user
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Enseignant ${enseignant?['nom']} connecté.'),
                  duration: Duration(seconds: 2),
                ),
              );

              // Navigate to the home page
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            } else {
              // Show an error message if authentication fails
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

  _forgotPassword(context) {
    return TextButton(onPressed: () {}, child: Text("Mot de passe oublié?"));
  }
}
