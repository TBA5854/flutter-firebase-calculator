import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

int sec = 0, milsec = 0;


class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Stopwatch"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size(300, 300)),
              // maximumSize: MaterialStateProperty.all(Size(90, 80)),
              // iconSize: MaterialStateProperty.all(900),
              shape: MaterialStateProperty.all(CircleBorder(side: BorderSide(width: 10),eccentricity: 0)) 
            ),
              onPressed: () {}, child: Column(children: [
            Text("$sec"),
            Text("$milsec"),
            ],)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton.outlined(
                    onPressed: () {}, icon: Icon(Icons.restart_alt_rounded)),
                IconButton.outlined(
                    onPressed: () {}, icon: Icon(Icons.restart_alt_rounded)),
                IconButton.outlined(
                    onPressed: () {}, icon: Icon(Icons.timer_outlined))
              ],
            )
          ],
        ));
  }
}
