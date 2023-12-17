import 'package:flutter/material.dart';
import 'package:movies_cowlar/screens/seats_screen.dart';
import 'package:movies_cowlar/widgets/cinema_box.dart';
import 'package:movies_cowlar/widgets/date_pill.dart';

class TicketsScreen extends StatelessWidget {
  final String movieTitle;
  final String releaseDate;

  TicketsScreen({required this.movieTitle, required this.releaseDate});
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
                movieTitle,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              Text(
                "In Theatres $releaseDate",
                style: const TextStyle(fontSize: 16, color: Colors.lightBlue),
              ),
            ],
          ),
        ),
      ),
      body:  Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             const SizedBox(height: 60),
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 16),
              child: Text(
                'Date',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 16),
             Container(
              height: 30,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  DatePill(
                    date: "5 mar",
                    isActive: true,
                  ),
                  DatePill(
                    date: "6 mar",
                    isActive: false,
                  ),
                  DatePill(
                    date: "7 mar",
                    isActive: false,
                  ),
                  DatePill(
                    date: "8 mar",
                    isActive: false,
                  ),
                  DatePill(
                    date: "9 mar",
                    isActive: false,
                  ),
                  DatePill(
                    date: "10 mar",
                    isActive: false,
                  ),
                  DatePill(
                    date: "11 mar",
                    isActive: false,
                  ),
                  DatePill(
                    date: "12 mar",
                    isActive: false,
                  ),

                ],
              ),
            ),
            SizedBox(height: 60),
            Container(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children:  [
                  CinemaBox(isClicked:true),
                  CinemaBox(isClicked: false,),
                  CinemaBox(isClicked: false,),
                  CinemaBox(isClicked: false,),
                  CinemaBox(isClicked: false,),
                  CinemaBox(isClicked: false,),
                  CinemaBox(isClicked: false,),
                  CinemaBox(isClicked: false,),
                  
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity, 
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary:const Color.fromRGBO(97, 195, 242, 1), 
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(5), 
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SeatsScreen(title: movieTitle,),
                      ),
                    );
                  },
                  child: const Text(
                    'Select Seats',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
