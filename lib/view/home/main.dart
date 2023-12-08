import 'package:Educonnect/view/home/classes.dart';
import 'package:Educonnect/view/home/components/shared/menu_item.dart';
import 'package:Educonnect/view/home/notes.dart';
import 'package:Educonnect/view/home/presence.dart';
import 'package:flutter/material.dart';
import 'package:Educonnect/view/menu/drawer/drawerList.dart';
import 'package:Educonnect/view/menu/newmenu.dart';

import '../../design/my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => MyApp(),
        '/classe': (context) => ClasseScreen(),
        '/presence': (context) => PresenceScreen(),
        '/note': (context) => NoteScreen(),
        '/profil': (context) => MyHeaderDrawer()
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String message = '';
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
                              bgColor: Colors
                                  .white), // components permettant de placer les cards des menus ( Ctrl + hover + click sur element )
                          MenuItem(
                            title: "Classes",
                            icon: Icons.supervised_user_circle_outlined,
                            tap: () {
                              Navigator.pushNamed(context, "/classe");
                            },
                            bgColor: Colors.white,
                          ),
                          MenuItem(
                            title: "Notes",
                            icon: Icons.edit_note,
                            tap: () {
                              Navigator.pushNamed(context, "/note");
                            },
                            bgColor: Colors.white,
                          ),
                          MenuItem(
                            title: "Statistique",
                            icon: Icons.show_chart,
                            tap: () {
                              Navigator.pushNamed(context, "/presence");
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
                                Text("40 min écoulées ",
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
                                "Vous êtes présentement en cours, veuillez notifié après la fin du cours.",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromRGBO(174, 126, 13, 1)),
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
                                            'assets/Groupe 17558.png',
                                          ),
                                          Text("Mathématiques",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 1))),
                                          SizedBox(height: 20),
                                          Text("40 min écoulées",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color: Color.fromRGBO(
                                                      67, 180, 253, 1))),

/************************************************************************** */
                                          GestureDetector(
                                            onTap: () {
                                              SnackBar(
                                                content: Text(
                                                    'Vous avez mis fin au cours'),
                                              );
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(top: 20),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(10.0),
                                                    child: Icon(
                                                      Icons
                                                          .person_outline_outlined,
                                                      size: 35,
                                                      color: Color.fromRGBO(
                                                          236, 237, 255, 1),
                                                    ),
                                                  ),
                                                  Text(
                                                    "2nd C2",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Color.fromRGBO(
                                                            46, 49, 146, 1)),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.all(5.0),
                                                    decoration: BoxDecoration(
                                                      color: Color.fromRGBO(
                                                          217, 14, 27, 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    child: Text("Salle B2",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white)),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        message =
                                                            'Vous avez mis fin au cours';
                                                      });

                                                      // Affichez une snackbar si nécessaire
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                              'Note enregistrée'),
                                                        ),
                                                      );

                                                      // Naviguez vers la page /home
                                                      Navigator.pushNamed(
                                                          context, "/home");
                                                    },
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      height: 60,
                                                      padding:
                                                          EdgeInsets.all(5.0),
                                                      decoration: BoxDecoration(
                                                        color: Color.fromRGBO(
                                                            67, 180, 253, 1),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  10),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Text("Fin",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white)),
                                                          SizedBox(width: 8),
                                                          // Affichez le texte dans l'interface utilisateur
                                                          Text(message,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white)),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              width: width,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
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
                              child: Container(
                                height: 50,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.watch_outlined,
                                        color: Colors.white),
                                    Text(
                                      " Marquer la fin du cours",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                                margin: EdgeInsets.only(top: 10),
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(217, 14, 27, 1),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            )
                          ],
                        ),
                        margin: EdgeInsets.only(top: 20),
                        width: width,
                        height: 170,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0)),
                      ), // Cobtebeur de 40 min etc
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: RichText(
                            text: TextSpan(
                                style: TextStyle(
                                    color: Color.fromRGBO(174, 126, 13, 1),
                                    fontSize: 15),
                                text: "Emploi du temps du jours\n",
                                children: [
                              TextSpan(
                                  text:
                                      "Suivez en temps réel vos activitées du jours",
                                  style: TextStyle(
                                      color: Color.fromRGBO(136, 136, 136, 1),
                                      fontSize: 12))
                            ])),
                      ),
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
                                  Icon(Icons.watch_later_outlined,
                                      color: Colors.white),
                                  Text(
                                    " 09H45",
                                    style: TextStyle(color: Colors.white),
                                  )
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
                                  Icon(Icons.watch_later_outlined,
                                      color: Colors.white),
                                  Text(
                                    " 17H15",
                                    style: TextStyle(color: Colors.white),
                                  )
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
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ClasseScreen())); // Remplacez "/nouvelle_page" par le nom de la route de votre nouvelle page
                      },
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ClasseScreen()));
                              },
                              bgColor: Color.fromRGBO(67, 180, 253, 1),
                            ),
                            Container(
                              width: width * .7,
                              height: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.check_circle_outline_outlined,
                                      color: Colors.white),
                                  Text(
                                    "  Effectuer l'appel de présence",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              margin: EdgeInsets.only(left: 10),
                              padding: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(67, 180, 253, 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
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
