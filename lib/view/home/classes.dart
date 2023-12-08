//import 'package:app/components/shared/menu_item.dart';
import 'package:Educonnect/design/my_theme.dart';
import 'package:Educonnect/view/classe/listeclasse.dart';
import 'package:Educonnect/view/classe/classestleA3.dart';
import 'package:Educonnect/view/classe/classestleA.dart';
import 'package:Educonnect/view/classe/classes2nd.dart';
import 'package:Educonnect/view/classe/classes5e.dart';
//import 'package:Educonnect/view/classe/classes5e.dart';
import 'package:Educonnect/view/menu/drawer/drawerList.dart';
import 'package:Educonnect/view/menu/newmenu.dart';

import 'package:Educonnect/view/menu/presence/DashboardPage.dart';
// ignore: unused_import
import 'package:Educonnect/view/classe/notesEleves.dart';

import 'package:flutter/material.dart';

import 'components/shared/menu_item.dart';
import 'notes.dart';
import 'presence.dart';
//import 'view/classe/listeclasse.dart';

class ClasseScreen extends StatelessWidget {
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
                              //Scaffold.of(context).openDrawer();
                            },
                            bgColor: Colors.white,
                          ),
                          MenuItem(
                            title: "Classes",
                            icon: Icons.supervised_user_circle_outlined,
                            tap: () {},
                            bgColor: AppTheme.principalColor,
                          ),
                          MenuItem(
                            title: "Notes",
                            icon: Icons.edit_note,
                            tap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NoteScreen()));
                            },
                            bgColor: Colors.white,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Listes des classes ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28,
                                        color:
                                            Color.fromRGBO(67, 180, 253, 1))),
                                Image(
                                    image: AssetImage("assets/user-check.png"))
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                "Vous pouvez vérifiez la liste de toutes les classes que vous prenez ici.",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromRGBO(174, 126, 13, 1)),
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
                      ), // Cobtebeur de 40 min etc

                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Icon(Icons.supervised_user_circle_outlined,
                                  size: 35,
                                  color: Color.fromRGBO(236, 237, 255, 1)),
                            ),
                            Text("2nd C2",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(46, 49, 146, 1))),
                            Container(
                              padding: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(217, 14, 27, 1),
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Text(
                                "Salle B2",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  //Navigator.pushNamed(context, '/classe/listeclasse.dart');
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ListeClasseScreen2nd()));
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
                                        " Faire l'appel",
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
                      Container(
                        //container emploi du temps 2
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Icon(Icons.supervised_user_circle_outlined,
                                  size: 35,
                                  color: Color.fromRGBO(236, 237, 255, 1)),
                            ),
                            Text("Tle A",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(46, 49, 146, 1))),
                            Container(
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(217, 14, 27, 1),
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Text(
                                  "Salle C2",
                                  style: TextStyle(color: Colors.white),
                                )),
                            GestureDetector(
                                onTap: () {
                                  //Navigator.pushNamed(context, '/classe/listeclasse.dart');
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ListeClasseScreentleA()));
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
                                        " Faire l'appel",
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
                      Container(
                        //container emploi du temps 2
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Icon(Icons.supervised_user_circle_outlined,
                                  size: 35,
                                  color: Color.fromRGBO(236, 237, 255, 1)),
                            ),
                            Text("5 è 5",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(46, 49, 146, 1))),
                            Container(
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(217, 14, 27, 1),
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Text(
                                  "Salle B3",
                                  style: TextStyle(color: Colors.white),
                                )),
                            GestureDetector(
                                onTap: () {
                                  //Navigator.pushNamed(context, '/classe/listeclasse.dart');
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ListeClasseScreen5e()));
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
                                        " Faire l'appel",
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
                      Container(
                        //container emploi du temps 2
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Icon(Icons.supervised_user_circle_outlined,
                                  size: 35,
                                  color: Color.fromRGBO(236, 237, 255, 1)),
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
                                          builder: (context) =>
                                              ListeClasseScreentleA3()));
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
                                        " Faire l'appel",
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
