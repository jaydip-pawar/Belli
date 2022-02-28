import 'package:belli/screens/home/widgets/hotels/hotels_list.dart';
import 'package:belli/screens/home/widgets/my_appbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            MyAppBar()
          ];
        },
        body: ListView(
          padding: EdgeInsets.only(top: 0.0),
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: HotelsList(),
            ),
          ],
        ),
      ),
    );
  }
}
