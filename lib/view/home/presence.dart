import 'package:Educonnect/view/home/components/shared/menu_item.dart';
import 'package:Educonnect/view/home/stats.dart';
import 'package:Educonnect/view/menu/newmenu.dart';
import 'package:Educonnect/view/menu/drawer/drawerList.dart';
import 'package:flutter/material.dart';

class PresenceScreen extends StatefulWidget {
  const PresenceScreen({super.key});

  @override
  _PrensenceScreenState createState() => _PrensenceScreenState();
}

class _PrensenceScreenState extends State<PresenceScreen> {
  String _selectedOption = '';
  List<String> options = ['2nd C2', 'Tle D1', '5 è 5', 'Tle A3'];
  bool _showOptions = false;
  TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

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
                          ), // components permettant de placer les cards des menus ( Ctrl + hover + click sur element )
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
                            title: "Statistiques",
                            icon: Icons.show_chart,
                            tap: () {
                              Navigator.pushNamed(context, "/presence");
                            },
                            bgColor: Color.fromRGBO(67, 180, 253, 1),
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
                        margin: EdgeInsets.only(top: 5.0),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                              width: width,
                              child: DropdownButtonFormField(
                                onChanged: (String? vl) {
                                  _textEditingController.text = vl.toString();
                                },
                                hint: Text("Selectionné une classe"),
                                items: options.map((String e) {
                                  return DropdownMenuItem(
                                      value: e, child: Text(e));
                                }).toList(),
                              ),
                            ),
                            StatsWidget(
                                libelle: "Nombre total de classe", stat: "4"),
                            StatsWidget(
                                libelle: "Nombre total d'élève", stat: "90"),
                            StatsWidget(
                                libelle: "Taux d'assiduité global",
                                stat: "70%"),
                            StatsWidget(
                                libelle: "Taux de performance academique",
                                stat: "75%"),
                            StatsWidget(
                                libelle: "Moyenne générale de la classe",
                                stat: "12"),
                          ],
                        ),
                      )
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
