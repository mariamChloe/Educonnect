import 'dart:convert';
import 'package:Educonnect/view/home/notes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Eleve {
  String nom;
  String prenom;
  String note;

  Eleve({
    required this.nom,
    required this.prenom,
    required this.note,
  });
}

class NotePageListtleA3 extends StatefulWidget {
  final List<Eleve> eleves;

  NotePageListtleA3({required this.eleves});

  @override
  _NotePageListState createState() => _NotePageListState();
}

class _NotePageListState extends State<NotePageListtleA3> {
  late List<Eleve> eleves;
  late List<String> notes;

  @override
  void initState() {
    super.initState();
    // Remplissez manuellement la liste d'élèves
    remplirListeElevesManuellement();
    // Initialisez la liste des notes avec des chaînes vides
    notes = List.generate(eleves.length, (index) => '');
  }

  // Méthode pour remplir la liste d'élèves manuellement
  void remplirListeElevesManuellement() {
    setState(() {
      eleves = [
        Eleve(nom: 'Dlamini', prenom: 'Nomthandazo', note: ''),
        Eleve(nom: 'Mensah', prenom: 'Kwasi', note: ''),
        Eleve(nom: 'Sesay', prenom: 'Mariama', note: ''),
        Eleve(nom: 'Ouedraogo', prenom: 'Issa', note: ''),
        Eleve(nom: 'Nkosi', prenom: 'Thabo', note: ''),
        Eleve(nom: 'Kabongo', prenom: 'Lumumba', note: ''),
        Eleve(nom: 'Diop', prenom: 'Aissatou', note: ''),
        Eleve(nom: 'Ouedraogo', prenom: 'Aissatou', note: ''),
        Eleve(nom: 'Diop', prenom: 'Mamadou', note: ''),
        Eleve(nom: 'Keita', prenom: 'Aminata', note: ''),
        Eleve(nom: 'Nkosi', prenom: 'Chinedu', note: ''),
        Eleve(nom: 'Mensah', prenom: 'Akua', note: ''),
        Eleve(nom: 'Kamara', prenom: 'Sekou', note: ''),
        Eleve(nom: 'Chibuike', prenom: 'Ngozi', note: ''),
        //Eleve(nom: 'Guy', prenom: 'Cédric', note: ''),
        // Ajoutez d'autres élèves au besoin
      ];
    });
  }

  Future<void> fetchEleves(String nomClasse) async {
    try {
      final classeUri = 'http://localhost:3000/listeClasses';
      print('Fetching data from: $classeUri');
      final response = await http.get(Uri.parse(classeUri));

      if (response.statusCode == 200) {
        final List<dynamic> fetchedData = json.decode(response.body);
        print('Response body: ${response.body}');

        if (fetchedData.isNotEmpty) {
          final List<Eleve> elevesFromDB = fetchedData.map((element) {
            return Eleve(
              nom: element['nom'],
              prenom: element['prenom'],
              note: '',
            );
          }).toList();

          setState(() {
            eleves = elevesFromDB;
          });
        } else {
          setState(() {
            eleves = List.generate(10, (index) {
              return Eleve(
                nom: 'Traore$index',
                prenom: 'Mariam$index',
                note: '',
              );
            });
          });
        }
      } else if (response.statusCode == 404) {
        print('Erreur: Ressource non trouvée. Status 404');
      } else {
        print(
            'Erreur lors de la récupération des élèves. Statut ${response.statusCode}');
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
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.note_add_outlined,
                      size: 35, color: Color.fromRGBO(236, 237, 255, 1)),
                ),
                Text("Tle A3",
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
                GestureDetector(
                    onTap: () {
                      //Navigator.pushNamed(context, '/classe/listeclasse.dart');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NoteScreen()));
                    },
                    child: Container(
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
                          Text(
                            " Enregistrer",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ))
              ],
            ),
            width: width,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: eleves.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/Capture_d_écran_du_2023-12-03_16-43-02-removebg-preview.png'),
                  ),
                  title: Text('${eleves[index].prenom} ${eleves[index].nom}'),
                  subtitle: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType
                              .number, // Permet seulement les chiffres
                          decoration: InputDecoration(
                            hintText: "/10", // Texte indicatif
                            hintStyle: TextStyle(
                              //fontSize: 16 * ffem,
                              color: Colors.grey,
                            ),
                          ),
                          style: TextStyle(
                            //fontSize: 16 * ffem,
                            color: Color(0xff4a9c0c),
                          ),
                          onChanged: (note) {
                            setState(() {
                              notes[index] = note;
                              eleves[index].note = note;
                            });
                            // Utilisez la valeur entrée (value) comme bon vous semble
                            // Peut-être mettez à jour l'état de votre application
                            // ou effectuez d'autres actions en réponse à l'entrée utilisateur.
                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.check, color: Colors.green),
                        onPressed: () {
                          print(
                              'Note de ${eleves[index].prenom} ${eleves[index].nom}: ${notes[index]}');

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Note enregistrée'),
                            ),
                          );
                        },
                      ),
                      /*Expanded(
                        child: TextField(
                          keyboardType: TextInputType
                              .number, // Permet seulement les chiffres
                          decoration: InputDecoration(
                            hintText: "/10", // Texte indicatif
                            hintStyle: TextStyle(
                              //fontSize: 16 * ffem,
                              color: Colors.grey,
                            ),
                          ),
                          style: TextStyle(
                            //fontSize: 16 * ffem,
                            color: Color(0xff4a9c0c),
                          ),
                          onChanged: (note) {
                            setState(() {
                              notes[index] = note;
                              eleves[index].note = note;
                            });
                            // Utilisez la valeur entrée (value) comme bon vous semble
                            // Peut-être mettez à jour l'état de votre application
                            // ou effectuez d'autres actions en réponse à l'entrée utilisateur.
                          },
                        ),
                      ),*/
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
