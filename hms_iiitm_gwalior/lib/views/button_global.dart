import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class Button extends StatelessWidget {

   const Button({Key? key, required this.text}) : super(key: key);
   final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        developer.log('login');
      },
      child: Container(
        alignment: Alignment.center,
        height: 55,
        decoration: BoxDecoration(
            color: Colors.indigo[700],
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 10,
              )
            ]
        ),
        child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,

            )
        ),
      ),
    );
  }
}
