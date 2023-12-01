import 'package:educonnect/design/my_theme.dart';
import 'package:educonnect/view/home/notes.dart';
import 'package:flutter/material.dart';/*
import 'package:flutter_drawer_example/privacy_policy.dart';
import 'package:flutter_drawer_example/send_feedback.dart';
import 'package:flutter_drawer_example/settings.dart';*/


import '../../home/classes.dart';
import '../../home/presence.dart';
import '../presence/DashboardPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.classe;

  @override
  Widget build(BuildContext context) {
    var container;
   /* if (currentPage == DrawerSections.dashboard) {
      container = MyHomePage();
    } else */if (currentPage == DrawerSections.classe ) {
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
      
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
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



class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.principalColor,
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/prof.jpg'),
              ),
            ),
          ),
          Text(
            "nonm du connecte",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            "mail du connecte",
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 14,
            ),
          ),
        ],
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
