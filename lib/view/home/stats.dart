import 'package:flutter/material.dart';

class StatsWidget extends StatelessWidget {
  String libelle;
  String stat;
  StatsWidget({required this.libelle, required this.stat});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
              text: TextSpan(
                  text: "${stat}\n",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Color.fromRGBO(67, 180, 253, 1)),
                  children: [
                TextSpan(
                    text: libelle,
                    style: TextStyle(
                        fontSize: 18, color: Color.fromRGBO(174, 126, 13, 1)))
              ])),
          Image(
            image: AssetImage("assets/user-check.png"),
            width: 20,
            height: 80,
          )
        ],
      ),
      margin: EdgeInsets.only(top: 20),
      width: width,
      height: 85,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
    );
  }
}
