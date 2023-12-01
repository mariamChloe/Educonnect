//import 'package:app/components/shared/menu_item.dart';
import 'package:flutter/material.dart';

import '../../design/my_theme.dart';
import 'classes.dart';
import 'components/shared/menu_item.dart';
import 'notes.dart';


class StatistiqueScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 237, 255, 1),
      body: SafeArea( // pour que l'affichage commence en dessous du status bar du telephone
        child: Container( // conteneur global de l'application
          height: height,
          padding: EdgeInsets.all(10.0),
          width: width,
          child: Stack( // placer les differents widgets de l'appli dans le children
              children:[
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
                              },
                              bgColor: Colors.white,
                            ),
                            MenuItem(
                              title: "Classes",
                              icon: Icons.supervised_user_circle_outlined,
                              tap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ClasseScreen()));
                              },
                              bgColor: Colors.white,
                            ),
                            MenuItem(
                              title: "Notes",
                              icon: Icons.edit_note,
                              tap: () {
                                },
                              bgColor: const Color.fromARGB(255, 255, 255, 255),
                            ),
                            MenuItem(
                              title: "Statistique",
                              icon: Icons.show_chart,
                              tap: () {
                               },
                             bgColor: AppTheme.principalColor,
                            ),Column(
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage("assets/avatar.jpg")
                                  ),
                                  borderRadius: BorderRadius.circular(100)
                              ),
                            ),
                            Text("Profil", style: TextStyle(color: Color.fromRGBO(136, 136, 136, 1) , fontSize: 13)),
                          ],
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
                              Image(image: AssetImage("assets/user-check.png"))
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 10) , child: Text("Verifier en toute securité l'état d'avancement de vos élèves " , style: TextStyle( fontSize: 15 , color:Color.fromRGBO(174, 126, 13, 1)),),),
                          Padding(padding: EdgeInsets.only(top: 10) , child: Text("Liste des classes que vous suivez par niveau." , style: TextStyle( fontSize: 15 , color:Color.fromRGBO(136, 136, 136, 1)),),),
                        ],
                      ),
                      margin: EdgeInsets.only(top: 20),
                      width: width,
                      height: 170,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                    ), // Conteneur de 40 min etc

                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(padding: EdgeInsets.all(10.0) , child: Icon(Icons.supervised_user_circle_outlined , size: 35, color: Color.fromRGBO(236, 237, 255, 1)),),
                          Text("2nd C2" , style: TextStyle( fontWeight: FontWeight.bold ,color:Color.fromRGBO(46 , 49 , 146, 1))),
                          Container(
                            padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                color:Color.fromRGBO(217, 14, 27, 1),
                                borderRadius: BorderRadius.circular(20.0)
                            ),
                            child: Text("Salle B2" , style: TextStyle(color:Colors.white),),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 60,
                            padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                color:Color.fromRGBO(67, 180, 253, 1),
                                borderRadius: BorderRadius.only(topRight: Radius.circular(10) , bottomRight: Radius.circular(10))
                            ),
                            child: Row(
                              children: [
                                Text(" Voir les notes" , style: TextStyle(color:Colors.white),)
                              ],
                            ),
                          )
                        ],
                      ),
                      width: width,
                      height: 60,
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ) ,
                    Container( //container emploi du temps 2
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(padding: EdgeInsets.all(10.0) , child: Icon(Icons.supervised_user_circle_outlined , size: 35, color: Color.fromRGBO(236, 237, 255, 1)),),
                          Text("Tle D1" , style: TextStyle( fontWeight: FontWeight.bold ,color:Color.fromRGBO(46 , 49 , 146, 1))),
                          Container(
                              padding: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                  color:Color.fromRGBO(217, 14, 27, 1),
                                  borderRadius: BorderRadius.circular(20.0)
                              ),
                              child: Text("Salle A3" , style: TextStyle(color:Colors.white),)
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 60,
                            padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                color:Color.fromRGBO(67, 180, 253, 1),
                                borderRadius: BorderRadius.only(topRight: Radius.circular(10) , bottomRight: Radius.circular(10))
                            ),
                            child: Row(
                              children: [
                                Text(" Voir les notes" , style: TextStyle(color:Colors.white),)
                              ],
                            ),
                          )
                        ],
                      ),
                      width: width,
                      height: 60,
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    Container( //container emploi du temps 2
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(padding: EdgeInsets.all(10.0) , child: Icon(Icons.supervised_user_circle_outlined , size: 35, color: Color.fromRGBO(236, 237, 255, 1)),),
                          Text("5 è 5" , style: TextStyle( fontWeight: FontWeight.bold ,color:Color.fromRGBO(46 , 49 , 146, 1))),
                          Container(
                              padding: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                  color:Color.fromRGBO(217, 14, 27, 1),
                                  borderRadius: BorderRadius.circular(20.0)
                              ),
                              child: Text("Salle A3" , style: TextStyle(color:Colors.white),)
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 60,
                            padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                color:Color.fromRGBO(67, 180, 253, 1),
                                borderRadius: BorderRadius.only(topRight: Radius.circular(10) , bottomRight: Radius.circular(10))
                            ),
                            child: Row(
                              children: [
                                Text(" Voir les notes" , style: TextStyle(color:Colors.white),)
                              ],
                            ),
                          )
                        ],
                      ),
                      width: width,
                      height: 60,
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    Container( //container emploi du temps 2
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(padding: EdgeInsets.all(10.0) , child: Icon(Icons.supervised_user_circle_outlined , size: 35, color: Color.fromRGBO(236, 237, 255, 1)),),
                          Text("Tle A3" , style: TextStyle( fontWeight: FontWeight.bold ,color:Color.fromRGBO(46 , 49 , 146, 1))),
                          Container(
                              padding: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                  color:Color.fromRGBO(217, 14, 27, 1),
                                  borderRadius: BorderRadius.circular(20.0)
                              ),
                              child: Text("Salle A3" , style: TextStyle(color:Colors.white),)
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 60,
                            padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                color:Color.fromRGBO(67, 180, 253, 1),
                                borderRadius: BorderRadius.only(topRight: Radius.circular(10) , bottomRight: Radius.circular(10))
                            ),
                            child: Row(
                              children: [
                                Text(" Voir les notes" , style: TextStyle(color:Colors.white),)
                              ],
                            ),
                          )
                        ],
                      ),
                      width: width,
                      height: 60,
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ],
                ),      ]
          ) ,
        ),
    )
    );
  }
}
