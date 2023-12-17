import 'package:flutter/material.dart';

class DatePill extends StatelessWidget {
  final String date;
  final bool isActive;
  const DatePill({super.key, required this.date, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 12,)
        ,
        Container(
          decoration: BoxDecoration(
            color:isActive ? const Color.fromRGBO(97, 195, 242, 1):Color.fromARGB( 25,166, 166, 166,),

            borderRadius: BorderRadius.circular(12),
          ),
          padding:const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child:  Text(
            date,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color:isActive? Colors.white : Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
