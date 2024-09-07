import 'package:flutter/material.dart';

class AiProfileText extends StatelessWidget {

  final String usersnamed;

  AiProfileText({required this.usersnamed});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text('$usersnamed', style: TextStyle(color: Colors.white70, fontSize: 28, fontWeight: FontWeight.w700),),
        ],
      ),
    );
  }
}