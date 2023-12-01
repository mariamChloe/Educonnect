import 'presence.dart';
import 'package:flutter/material.dart';
import '../../design/my_theme.dart';
import '../menu/drawer/drawer.dart';
import '../menu/presence/DashboardPage.dart';
import 'classes.dart';
import 'notes.dart';

/*
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => MyHomePage(),
        '/classe': (context) => ClasseScreen(),
        '/presence': (context) => PresenceScreen(),
        '/note': (context) => NoteScreen(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
*/
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  var currentPage = DrawerSections.classe;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

     var container;
    if (currentPage == DrawerSections.dashboard) {
      container = GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },);
    } else if (currentPage == DrawerSections.classe ) {
      container = ClasseScreen();
    } else if (currentPage == DrawerSections.notes ) {
      container =  NoteScreen();
    } else if (currentPage == DrawerSections.Statistique ) {
      container = StatistiqueScreen();
    } else if (currentPage == DrawerSections.notifications ) {
      container =  PresencePage();
    } else if (currentPage == DrawerSections.settings ) {
      container =  PresencePage();
    } else if (currentPage == DrawerSections.privacy_policy ) {
      container =  PresencePage();
    } else if (currentPage == DrawerSections.send_feedback ) {
      container =  PresencePage();
    }
    
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 237, 255, 1),
      body:container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyHeaderDrawer(),
              MyDrawerList(), 
            ],
          ),
        ),
      ),
      /* SafeArea(
        child: Container(
          height: height,
          padding: EdgeInsets.all(10.0),
          width: width,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Icon(Icons.menu, color: Colors.black),
                        ),
                      ),
                      MenuItem(
                        title: "Classes",
                        icon: Icons.supervised_user_circle_outlined,
                        tap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ClasseScreen()),
                          );
                        },
                        bgColor: Colors.white,
                      ),
                      MenuItem(
                        title: "Notes",
                        icon: Icons.edit_note,
                        tap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NoteScreen()),
                          );
                        },
                        bgColor: Colors.white,
                      ),
                      MenuItem(
                        title: "Statistique",
                        icon: Icons.show_chart,
                        tap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => StatistiqueScreen()),
                          );
                        },
                        bgColor: Colors.white,
                      ),
                      Column(
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
                          Text("Profil", style: TextStyle(color: Color.fromRGBO(136, 136, 136, 1), fontSize: 13)),
                        ],
                      ),
                    ],
                  ),
                  // ... Rest of your existing code ...
                ],
              ),
            ],
          ),
        ),*/
      );
     
    
  }
  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          
          menuItem(1, "Acceuil", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Classe", Icons.people_alt_outlined,
              currentPage == DrawerSections.classe ? true : false),
          menuItem(3, "Note", Icons.event,
              currentPage == DrawerSections.notes ? true : false),
          menuItem(4, "Statistique", Icons.notes,
              currentPage == DrawerSections.Statistique ? true : false),
          Divider(),
          menuItem(5, "Parametre", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(6, "Notifications", Icons.notifications_outlined,
              currentPage == DrawerSections.notifications ? true : false),
          Divider(),
          menuItem(7, "Notre politiques", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.privacy_policy ? true : false),
          menuItem(8, "Votre avis", Icons.feedback_outlined,
              currentPage == DrawerSections.send_feedback ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            
            if (id == 1) {
              currentPage = DrawerSections.classe;
            } else if (id == 2) {
              currentPage = DrawerSections.notes;
            } else if (id == 3) {
              currentPage = DrawerSections.Statistique;
            } else if (id == 4) {
              currentPage = DrawerSections.settings;
            } else if (id == 5) {
              currentPage = DrawerSections.notifications;
            } else if (id == 6) {
              currentPage = DrawerSections.privacy_policy;
            } else if (id == 7) {
              currentPage = DrawerSections.send_feedback;
            } else if (id == 8) {
              currentPage = DrawerSections.send_feedback;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




enum DrawerSections {
  dashboard,
  classe,
  Statistique,
  notes,
  settings,
  notifications,
  privacy_policy,
  send_feedback,
}
