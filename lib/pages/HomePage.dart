import 'package:flutter/material.dart';
import '../data/GameDataListWidgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.black,
          padding: const EdgeInsets.only(top: 74.0),
          child: StaggeredGridView.count(
            crossAxisCount: 4,
            staggeredTiles: getStaggeredTiles(),
            children: getTiles(context),
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
            padding: const EdgeInsets.all(20.0),
          )),
    );
  }
}
