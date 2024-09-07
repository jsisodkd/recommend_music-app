import 'package:flutter/material.dart';

class Home_ProfileBox extends StatelessWidget {

  final String usersname;

  Home_ProfileBox({required this.usersname});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text('$usersname', style: TextStyle(color: Color(0xD8521BB0), fontSize: 20, fontWeight: FontWeight.w700),),
        ],
      ),
    );
  }
}