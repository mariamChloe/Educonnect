import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListeClasseScreen extends StatefulWidget {
  @override
  _ListeClasseScreenState createState() => _ListeClasseScreenState();
}

class _ListeClasseScreenState extends State<ListeClasseScreen> {
  List<Map<String, dynamic>> eleves = [];

  @override
  void initState() {
    super.initState();
    fetchEleves('nom',"prenom"); // Corrected parameter name
  }

/*Future<void> fetchEleves(String nomClasse) async {
  try {
    final classeUri = 'http://localhost:3000/listeClasses';
    print('Fetching data from: $classeUri');
    final response = await http.get(Uri.parse(classeUri));

    if (response.statusCode == 200) {
      final Map<String, dynamic> fetchedData = json.decode(response.body);
        print('Response body: ${response.body}');


      // Assurez-vous que les clés 'nom' et 'prenom' existent dans votre modèle
      final String nom = fetchedData['nom'] ?? '';
      final String prenom = fetchedData['prenom'] ?? '';

      if (nom.isNotEmpty && prenom.isNotEmpty) {
        setState(() {
  eleves = [{'nom': nom, 'prenom': prenom}];
});
      } else {
        print('No student found in the response data.');
      }
    } else if (response.statusCode == 404) {
      print('Erreur: Ressource non trouvée. Status 404');
    } else {
      print('Erreur lors de la récupération des élèves. Statut ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  } catch (error) {
    print('Erreur lors de la récupération des élèves: $error');
  }
  String nom, String prenom
}*/
 Future<void> fetchEleves( String nom, String prenom) async {
  try {
    final classeUri = 'http://localhost:3000/listeClasse';
    print('Fetching data from: $classeUri');
    final response = await http.get(Uri.parse(classeUri));

    if (response.statusCode == 200) {
      final Map<String, dynamic> fetchedData = json.decode(response.body);
      print('Response body: ${response.body}');

      if (fetchedData.isNotEmpty) {
        final List<Map<String, dynamic>> elevesFromDB = fetchedData['eleves'].map<Map<String, dynamic>>((element) {
          return {
            'nom': element['nom'],
            'prenom': element['prenom'],
          };
        }).toList();

        setState(() {
          eleves = elevesFromDB;
        });
      } else {
        print('No student found in the response data.');
      }
    } else if (response.statusCode == 404) {
      print('Erreur: Ressource non trouvée. Status 404');
    } else {
      print('Erreur lors de la récupération des élèves. Statut ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  } catch (error) {
    print('Erreur lors de la récupération des élèves: $error');
  }
}



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 237, 255, 1),
      body: SafeArea(
        child: Container(
          height: height,
          padding: EdgeInsets.all(10.0),
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title and description similar to ClasseScreen
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(Icons.supervised_user_circle_outlined,
                          size: 35, color: Color.fromRGBO(236, 237, 255, 1)),
                    ),
                    Text("Tle D1",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(46, 49, 146, 1))),
                    Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(217, 14, 27, 1),
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Text(
                          "Salle A3",
                          style: TextStyle(color: Colors.white),
                        )),
                    Container(
                      alignment: Alignment.center,
                      height: 60,
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(67, 180, 253, 1),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "9H15",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                WidgetSpan(
                                  child: Icon(
                                    Icons.schedule_outlined,
                                    size: 17,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                width: width,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),

              // List of students with attendance buttons
              for (var eleve in eleves)
                buildStudentRow(
                  width,
                  eleve['nom'],
                  eleve['prenom'],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStudentRow(double width, String firstName, String lastName) {
    bool isPresent = false;

    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/mariamTraore.png'),
              radius: 20,
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$firstName',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              Text(
                lastName,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.close, color: Colors.red),
            onPressed: () {
              // Logique pour marquer l'absence
              print('L\'élève $firstName $lastName est absent.');

              // Afficher le SnackBar
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Assiduité marquée: Absent'),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.check, color: Colors.green),
            onPressed: () {
              // Logique pour marquer la présence
              print('L\'élève $firstName $lastName est présent.');

              // Afficher le SnackBar
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Assiduité marquée: Présent'),
                ),
              );
            },
          ),
        ],
      ),
      width: width,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}
