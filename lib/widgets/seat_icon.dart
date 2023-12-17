import 'package:flutter/material.dart';

class SeatIcon extends StatelessWidget {
  const SeatIcon({super.key, required this.text, required this.color});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
          children: [
            Icon(Icons.chair,size: 28,color: color,),
            SizedBox(width: 8,),
            Text(text,style: TextStyle(fontWeight: FontWeight.w500),)
          ],
        );
  }
}