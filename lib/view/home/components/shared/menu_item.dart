import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget{
  String title;
  IconData icon ;
  Function tap;
  Color bgColor ;
  MenuItem({required this.title , required this.icon ,  required this.tap , required this.bgColor});
  @override
  Widget build(BuildContext context){
    return  InkWell(
      onTap: (){
        tap();
      },
      child: Column(
        children: [
          Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  color:bgColor   ,
                  borderRadius: BorderRadius.circular(100)
              ),
              child:Icon(icon , size: 28,color: Color.fromRGBO(46 , 49 , 146, 1),)
          ),
          Text(title, style: TextStyle(color: Color.fromRGBO(136, 136, 136, 1) , fontSize: 13))
        ],
      ),
    );
  }
}