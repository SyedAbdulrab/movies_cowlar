import 'package:flutter/material.dart';
import 'package:movies_cowlar/widgets/seat_icon.dart';

class SeatsScreen extends StatelessWidget {
  const SeatsScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              const Text(
                "March 5, 2021 | 12:30 hall 1",
                style:  TextStyle(fontSize: 16, color: Colors.lightBlue),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(50),
              child: InteractiveViewer(
                child: Image.asset(
                  'assets/images/cinemaseats.png', 
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Row(
                  children: [
                     SeatIcon(
                        text: "Selected",
                        color:  Color.fromRGBO(205, 157, 15, 1)),
                    SizedBox(
                      width: 34,
                    ),
                     SeatIcon(
                        text: "Not Available",
                        color: Color.fromRGBO(166, 166, 166, 1)),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                const Row(
                  children: [
                     SeatIcon(
                        text: "VIP (\$150)",
                        color: const Color.fromRGBO(86, 76, 163, 1)),
                    SizedBox(
                      width: 24,
                    ),
                     SeatIcon(
                        text: "Regular (\$50)",
                        color: const Color.fromRGBO(97, 195, 242, 1)),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Container(
                      width: 110,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: const Chip(
                          backgroundColor:
                              Color.fromRGBO(166, 166, 166, 0.1),
                          label: Row(children: [
                            Text(
                              "4/ ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            Text(
                              "3 row ",
                              style: TextStyle(fontSize: 14),
                            ),
                            Icon(
                              Icons.clear,
                              size: 18,
                            )
                          ]),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    color: Color.fromRGBO(166, 166, 166, 0.1),
                    height: 50,
                    width: 110,
                    child: const Column(
                      children: [
                        Text("Total Price"),
                        Text(
                          "\$ 50",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(14),
                      primary: Color.fromRGBO(97, 195, 242, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      print("Payment successful, enjoy the movie");
                    },
                    child: const Text(
                      'Proceed to pay',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
