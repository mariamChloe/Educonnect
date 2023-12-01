import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("ACCUEIL "),
      ),
    );
  }
}

class classePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("classe "),
      ),
    );
  }
}

class presencePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("presence "),
      ),
    );
  }
}

class notesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("notes "),
      ),
    );
  }
}

class settingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("settings "),
      ),
    );
  }
}

class notificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("notifications "),
      ),
    );
  }
}

class privacy_policyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("ACCUEIL "),
      ),
    );
  }
}

class PresencePage extends StatefulWidget {
  @override
  _PresencePageState createState() => _PresencePageState();
}

class _PresencePageState extends State<PresencePage> {
  List<Student> students = [
    Student('Élève 1', false),
    Student('Élève 2', false),
    Student('Élève 3', false),
    // Ajoutez autant d'élèves que vous le souhaitez
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(students[index].name),
            trailing: Checkbox(
              value: students[index].isPresent,
              onChanged: (value) {
                setState(() {
                  students[index].isPresent = value!;
                });
              },
            ),
          );
        },
      ),
    );
  }
}

class Student {
  final String name;
  bool isPresent;

  Student(this.name, this.isPresent);
}
