//import 'package:app/components/shared/menu_item.dart';
import 'package:Educonnect/view/home/classes.dart';
import 'package:Educonnect/view/home/components/shared/menu_item.dart';
import 'package:Educonnect/view/classe/notesEleves.dart';
import 'package:Educonnect/view/classe/notestleA.dart';
import 'package:Educonnect/view/classe/notestleA3.dart';
import 'package:Educonnect/view/classe/notes5e.dart';
import 'package:Educonnect/view/classe/devoirA.dart';
import 'package:Educonnect/view/classe/devoirA3.dart';
import 'package:Educonnect/view/classe/devoir5e.dart';
import 'package:Educonnect/view/classe/devoir2nd.dart';
import 'package:Educonnect/view/home/notes.dart';
import 'package:Educonnect/view/modifications/choisirclasse.dart';
import 'package:Educonnect/view/menu/drawer/drawerList.dart';
import 'package:Educonnect/view/menu/newmenu.dart';

import 'package:flutter/material.dart';

import '../../design/my_theme.dart';
import 'presence.dart';

class NoteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color.fromRGBO(236, 237, 255, 1),
        body: SafeArea(
          // pour que l'affichage commence en dessous du status bar du telephone
          child: Container(
            // conteneur global de l'application
            height: height,
            padding: EdgeInsets.all(10.0),
            width: width,
            child: Stack(
                // placer les differents widgets de l'appli dans le children
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MenuItem(
                            title: "Menu",
                            icon: Icons.menu,
                            tap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Menu()));
                            },
                            bgColor: Colors.white,
                          ),
                          MenuItem(
                            title: "Classes",
                            icon: Icons.supervised_user_circle_outlined,
                            tap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ClasseScreen()));
                            },
                            bgColor: Colors.white,
                          ),
                          MenuItem(
                            title: "Notes",
                            icon: Icons.edit_note,
                            tap: () {},
                            bgColor: AppTheme.principalColor,
                          ),
                          MenuItem(
                            title: "Statistique",
                            icon: Icons.show_chart,
                            tap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PresenceScreen()));
                            },
                            bgColor: Colors.white,
                          ),
                          GestureDetector(
                            onTap: () {
                              _showProfilePopup(context);
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage("assets/avatar.jpg"),
                                    ),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                                Text(
                                  "Profil",
                                  style: TextStyle(
                                    color: Color.fromRGBO(136, 136, 136, 1),
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image(
                                    image: AssetImage("assets/user-check.png"))
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                "Renseigner les notes en toute securité ",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromRGBO(174, 126, 13, 1)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                "Liste des notes obtenues lors des évaluations par classe.",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromRGBO(136, 136, 136, 1)),
                              ),
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(top: 20),
                        width: width,
                        height: 170,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0)),
                      ),

                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      'assets/popupvert.png',
                                    ),
                                    Text("Types d'evaluation",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Color.fromRGBO(0, 0, 0, 1))),
                                    SizedBox(height: 25),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    NotePageList(eleves: [])));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(top: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Interrogation",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 135, 155, 165)),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              height: 50,
                                              padding: EdgeInsets.all(5.0),
                                              decoration: BoxDecoration(
                                                color: AppTheme.principalColor,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10)),
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    " Saisir les notes",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        width: width - 120,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: AppTheme.thirdColor,
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                    ),

/************************************************************************** */
                                    SizedBox(height: 5),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Devoir2nd(eleves: [])));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(top: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Devoir",
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 135, 155, 165),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              height: 50,
                                              padding: EdgeInsets.all(5.0),
                                              decoration: BoxDecoration(
                                                color: AppTheme.principalColor,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10)),
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(" Saisir les notes",
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        width: width - 120,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: AppTheme.thirdColor,
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
/**************************************************************************/
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.supervised_user_circle_outlined,
                                  size: 35,
                                  color: Color.fromRGBO(236, 237, 255, 1),
                                ),
                              ),
                              Text(
                                "2nd C2",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(46, 49, 146, 1)),
                              ),
                              Container(
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(217, 14, 27, 1),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Text("Salle B2",
                                    style: TextStyle(color: Colors.white)),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 60,
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(67, 180, 253, 1),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                ),
                                child: Row(
                                  children: [
                                    Text("Noter",
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          width: width,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      // Cobtebeur de 40 min etc

                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      'assets/popupvert.png',
                                    ),
                                    Text("Types d'evaluation",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Color.fromRGBO(0, 0, 0, 1))),
                                    SizedBox(height: 25),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    NotePageListtleA(
                                                        eleves: [])));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(top: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Interrogation",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 135, 155, 165)),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              height: 50,
                                              padding: EdgeInsets.all(5.0),
                                              decoration: BoxDecoration(
                                                color: AppTheme.principalColor,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10)),
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    " Saisir les notes",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        width: width - 120,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: AppTheme.thirdColor,
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                    ),

/************************************************************************** */
                                    SizedBox(height: 5),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DevoirtleA(eleves: [])));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(top: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Devoir",
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 135, 155, 165),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              height: 50,
                                              padding: EdgeInsets.all(5.0),
                                              decoration: BoxDecoration(
                                                color: AppTheme.principalColor,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10)),
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(" Saisir les notes",
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        width: width - 120,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: AppTheme.thirdColor,
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
/**************************************************************************/
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.supervised_user_circle_outlined,
                                  size: 35,
                                  color: Color.fromRGBO(236, 237, 255, 1),
                                ),
                              ),
                              Text(
                                "Tle A",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(46, 49, 146, 1)),
                              ),
                              Container(
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(217, 14, 27, 1),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Text("Salle C2",
                                    style: TextStyle(color: Colors.white)),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 60,
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(67, 180, 253, 1),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                ),
                                child: Row(
                                  children: [
                                    Text("Noter",
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          width: width,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      'assets/popupvert.png',
                                    ),
                                    Text("Types d'evaluation",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Color.fromRGBO(0, 0, 0, 1))),
                                    SizedBox(height: 25),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    NotePageList5e(
                                                        eleves: [])));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(top: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Interrogation",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 135, 155, 165)),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              height: 50,
                                              padding: EdgeInsets.all(5.0),
                                              decoration: BoxDecoration(
                                                color: AppTheme.principalColor,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10)),
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    " Saisir les notes",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        width: width - 120,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: AppTheme.thirdColor,
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                    ),

/************************************************************************** */
                                    SizedBox(height: 5),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Devoir5e(eleves: [])));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(top: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Devoir",
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 135, 155, 165),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              height: 50,
                                              padding: EdgeInsets.all(5.0),
                                              decoration: BoxDecoration(
                                                color: AppTheme.principalColor,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10)),
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(" Saisir les notes",
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        width: width - 120,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: AppTheme.thirdColor,
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
/**************************************************************************/
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.supervised_user_circle_outlined,
                                  size: 35,
                                  color: Color.fromRGBO(236, 237, 255, 1),
                                ),
                              ),
                              Text(
                                "5 è 5",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(46, 49, 146, 1)),
                              ),
                              Container(
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(217, 14, 27, 1),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Text("Salle B3",
                                    style: TextStyle(color: Colors.white)),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 60,
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(67, 180, 253, 1),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                ),
                                child: Row(
                                  children: [
                                    Text("Noter",
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          width: width,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      'assets/popupvert.png',
                                    ),
                                    Text("Types d'evaluation",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Color.fromRGBO(0, 0, 0, 1))),
                                    SizedBox(height: 25),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    NotePageListtleA3(
                                                        eleves: [])));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(top: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Interrogation",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 135, 155, 165)),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              height: 50,
                                              padding: EdgeInsets.all(5.0),
                                              decoration: BoxDecoration(
                                                color: AppTheme.principalColor,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10)),
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    " Saisir les notes",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        width: width - 120,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: AppTheme.thirdColor,
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                    ),

/************************************************************************** */
                                    SizedBox(height: 5),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DevoirtleA3(eleves: [])));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(top: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Devoir",
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 135, 155, 165),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              height: 50,
                                              padding: EdgeInsets.all(5.0),
                                              decoration: BoxDecoration(
                                                color: AppTheme.principalColor,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10)),
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(" Saisir les notes",
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        width: width - 120,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: AppTheme.thirdColor,
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
/**************************************************************************/
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.supervised_user_circle_outlined,
                                  size: 35,
                                  color: Color.fromRGBO(236, 237, 255, 1),
                                ),
                              ),
                              Text(
                                "Tle A3",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(46, 49, 146, 1)),
                              ),
                              Container(
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(217, 14, 27, 1),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Text("Salle A3",
                                    style: TextStyle(color: Colors.white)),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 60,
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(67, 180, 253, 1),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                ),
                                child: Row(
                                  children: [
                                    Text("Noter",
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          width: width,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                      bottom: 0,
                      child: Container(
                        margin: EdgeInsets.only(top: 15.0),
                        width: width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MenuItem(
                              title: "",
                              icon: Icons.home_filled,
                              tap: () {
                                Navigator.pushNamed(context, "/home");
                              },
                              bgColor: Colors.white,
                            ),
                            Container(
                              width: width * .7,
                              height: 50,
                              margin: EdgeInsets.only(left: 10),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ClasseScreenmod()),
                                  );
                                  // Action à effectuer lors du clic sur le bouton
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromRGBO(67, 180, 253, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.check_circle_outline_outlined,
                                        color: Colors.white),
                                    Text(
                                      "  Modifier des notes",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))
                ]),
          ),
        ));
  }

  void _showProfilePopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: MyHeaderDrawer(),
        );
      },
    );
  }
}

class Eleve {}
