import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sensor_tournament/model/game.dart';
import 'package:sensor_tournament/pages/game_selection_page.dart';
import 'package:sensor_tournament/pages/main_menu_page.dart';



class GameWinnerPage extends StatefulWidget{
  @override
  _GameWinnerPage createState() => _GameWinnerPage();
}

class _GameWinnerPage extends State<GameWinnerPage>{
  late Game game;

  late String _gameName;
  late String _highestValue;
  late String _valueSuffix;



  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    game = Provider.of<Game>(context);
    _gameName = game.currentGameName;
    _highestValue = game.endHighestValue;
    _valueSuffix = game.valueSuffix;


    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            headerWidget(context),
            const SizedBox(
              height: 100,
            ),
            Expanded(child: mainWidget(context)),
            buttonsWidget(context),
            const SizedBox(
              height: 60,
            ),
            //Expanded(child: playerList(context)),
            //playerForm(context),
          ],
        ),
      ),
    );
  }

  Widget headerWidget(BuildContext context){
    game = Provider.of<Game>(context);
    Icon profilePicture = Icon(Icons.person);

    if (game.players[game.highestScorePlayerIndex].picture != profilePicture){
      profilePicture = game.players[game.highestScorePlayerIndex].picture;
    }

    return Column(
      children: [
        Text("Gewinner", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        Text("$_gameName", style: TextStyle(fontSize: 20)),
        Divider(),
        const SizedBox(
          height: 120,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(profilePicture.icon, size: 50),
            Flexible(
              child: Container(
                child: Text(game.players[game.highestScorePlayerIndex].name, style: TextStyle(fontSize: 50)),
              ),
            ),
          ],
        )
      ],
    );
  }


  Widget mainWidget(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text("Highest score:"),
            Text("$_highestValue" + " " + "$_valueSuffix", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ],
    );
  }


  Widget buttonsWidget(BuildContext context){
    game = Provider.of<Game>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.home, size: 50),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MainMenuPage();
            }));
          },
        )
      ],
    );
  }





}