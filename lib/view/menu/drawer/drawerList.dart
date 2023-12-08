import 'package:flutter/material.dart';
import 'package:Educonnect/design/my_theme.dart';
import 'package:Educonnect/view/home/components/shared/menu_item.dart';

class MyHeaderDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      width: double.infinity,
      height: 220,
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color.fromRGBO(67, 180, 253, 1),
                    width: 3.0,
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/avatar.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ulrich Jordan",
                    style: TextStyle(
                      color: const Color.fromRGBO(174, 126, 13, 1),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Professeur de Mathématiques",
                    style: TextStyle(
                      color: const Color.fromRGBO(136, 136, 136, 1),
                      fontSize: 14,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Masculin",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(136, 136, 136, 1)),
                        ),
                        WidgetSpan(
                          child: Icon(
                            Icons.male_outlined,
                            size: 17,
                            color: Color.fromRGBO(136, 136, 136, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildInfoItem("120", "Cours donnés"),
              buildInfoItem("3", "Années d'expérience"),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildInfoItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: const Color.fromRGBO(67, 180, 253, 1),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            color: const Color.fromRGBO(136, 136, 136, 1),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
