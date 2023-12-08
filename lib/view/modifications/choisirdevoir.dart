//import 'package:app/components/shared/menu_item.dart';
import 'package:Educonnect/design/my_theme.dart';
import 'package:Educonnect/view/classe/listeclasse.dart';
import 'package:Educonnect/view/classe/classestleA3.dart';
import 'package:Educonnect/view/classe/classestleA.dart';
import 'package:Educonnect/view/classe/classes2nd.dart';
import 'package:Educonnect/view/classe/classes5e.dart';
import 'package:Educonnect/view/modifications/modifier.dart';
// ignore: unused_import
import 'package:Educonnect/view/classe/notesEleves.dart';

import 'package:flutter/material.dart';

import '/view/home/components/shared/menu_item.dart';
import 'package:Educonnect/view/home/notes.dart';
import 'package:Educonnect/view/home/presence.dart';

class Classemod extends StatelessWidget {
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
                Text("05/12/2023",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(46, 49, 146, 1))),
                Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(217, 14, 27, 1),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Text(
                      "Devoir 1",
                      style: TextStyle(color: Colors.white),
                    )),
                GestureDetector(
                    onTap: () {
                      //Navigator.pushNamed(context, '/classe/listeclasse.dart');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotePage(eleves: [])));
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
                            " Choisir",
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
        ],
      ),
    );
  }
}
