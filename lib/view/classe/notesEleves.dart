import 'dart:convert';
import 'package:educonnect/view/home/notes.dart';
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

class NotePageList extends StatefulWidget {
  final List<Eleve> eleves;

  NotePageList({required this.eleves});

  @override
  _NotePageListState createState() => _NotePageListState();
}

class _NotePageListState extends State<NotePageList> {
  late List<Eleve> eleves;
  late List<String> notes;

  @override
  void initState() {
    super.initState();
    eleves = widget.eleves;
    notes = List.generate(widget.eleves.length, (index) => '');
    fetchEleves('Terminale A');
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

      appBar: AppBar(
        title: Text('Note Page - Terminale A'),

        actions: [
            SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              for (int i = 0; i < eleves.length; i++) {
                print('Note for ${eleves[i].prenom} ${eleves[i].nom}: ${notes[i]}');
              }
            },
            child: Text('Save All Notes'),

            
          ),
        ],

        
      ),
      body: ListView.builder(
  itemCount: eleves.length,
  itemBuilder: (context, index) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/mariamTraore.png'), // Replace with your avatar image
      ),
      title: Text('${eleves[index].prenom} ${eleves[index].nom}'),
      subtitle: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(labelText: 'Note'),
              onChanged: (note) {
                setState(() {
                  notes[index] = note;
                  eleves[index].note = note;
                });
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              print('Note for ${eleves[index].prenom} ${eleves[index].nom}: ${notes[index]}');
            },
            child: Text('Save Note'),
          ),
        ],
      ),
    );
  },
),
    );
  }
}
