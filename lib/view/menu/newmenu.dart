import 'package:Educonnect/design/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:Educonnect/view/home/components/shared/menu_item.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 237, 255, 1),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(16.0),
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildMenuItem(context, Icons.home, "Accueil", "/home"),
              buildMenuItem(context, Icons.supervised_user_circle_outlined,
                  "Classe", "/classe"),
              buildMenuItem(
                  context, Icons.edit_note_outlined, "Notes", "/note"),
              buildMenuItem(context, Icons.show_chart_outlined, "Statistique",
                  "/presence"),
              buildMenuItem(context, Icons.settings, "Paramètres", "/profil"),
              // ... Ajoutez d'autres éléments de menu au besoin
              Spacer(),
              buildFooter(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(
      BuildContext context, IconData icon, String title, String route) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(icon, size: 25, color: Color.fromRGBO(217, 14, 27, 1)),
          title: Text(
            title,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(136, 136, 136, 1)),
          ),
          trailing:
              Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black87),
        ),
      ),
    );
  }

  Widget buildFooter(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Color.fromRGBO(67, 180, 253, 1),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, "/home");
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline_outlined, color: Colors.white),
            SizedBox(width: 8),
            Text(
              "Effectuer l'appel de présence",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
