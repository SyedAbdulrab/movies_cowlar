import 'package:flutter/material.dart';

class CinemaBox extends StatefulWidget {
  bool isClicked;
   CinemaBox({
    Key? key,
    required this.isClicked,
  }) : super(key: key);

  @override
  State<CinemaBox> createState() => _CinemaBoxState();
}

class _CinemaBoxState extends State<CinemaBox> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text(
                  "12:30 ",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                Text(
                  " Cinetech + Hall",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isTapped =
                      !isTapped; 
                });
              },
              child: Container(
                width: 250,
                height: 170,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: widget.isClicked
                        ? Colors.lightBlue
                        : Colors
                            .grey, 
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:20.0,horizontal: 40),
                  child: Image.asset(
                    'assets/images/cinemaseats.png', 
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Row(
              children: [
                Text("From ",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.grey)),
                Text(
                  "\$50",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(" or ",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.grey)),
                Text(
                  " 2500 bonus",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
