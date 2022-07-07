import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:noise_meter/noise_meter.dart';

import 'package:sensor_tournament/model/player.dart';
import 'package:sensor_tournament/model/game.dart';



class GameScreamPage extends StatefulWidget{
  @override
  _GameScreamPage createState() => _GameScreamPage();
}

class _GameScreamPage extends State<GameScreamPage>{
  double _currentDecibel = 0, _maxDecibelPlayer = 0;
  late StreamSubscription<NoiseReading> _noiseSubscription;

  @override
  void initState() {
    super.initState();

    _noiseSubscription = NoiseMeter().noiseStream.listen((NoiseReading noiseReading) {
      setState(() {
        _currentDecibel = double.parse(noiseReading.meanDecibel.toStringAsFixed(1));
        if (_currentDecibel > _maxDecibelPlayer){
          _maxDecibelPlayer = _currentDecibel;
        }
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            header(context),
            screamGame(context),
            //Expanded(child: playerList(context)),
            //playerForm(context),
          ],
        ),
      ),
    );
  }

  Widget header(BuildContext context){
    var game = Provider.of<Game>(context);
    Icon profilePicture = Icon(Icons.person);

    if (game.players[game.currentPlayerIndex].picture != profilePicture){
      profilePicture = game.players[game.currentPlayerIndex].picture;
    }


    return Row(
      //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text("Glass shatterer", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              Text("Scream the loudest", style: TextStyle(fontSize: 20))
            ],
          ),
          Icon(profilePicture.icon, size: 30),
          Text(game.players[game.currentPlayerIndex].name, style: TextStyle(fontSize: 25),)
        ],
      );
  }


  Widget screamGame(BuildContext context){
    return Row(
      children: [
        Column(
          children: [
            Text("Höchst-dB: $_maxDecibelPlayer"),
            Text("Aktuelle-dB: $_currentDecibel"),
          ],
        ),
      ],
    );
  }
















/*

  Widget playerList(BuildContext context){
    var players = Provider.of<PlayerList>(context);

    return ListView.builder(
      itemCount: players.players.length,
      itemBuilder: (context, index) {
        return Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 60,
              ),

              Container(
                margin: EdgeInsets.all(30),
                child: IconButton(
                  icon: Icon(Icons.person, size: 40),
                  onPressed: () {},
                ),
              ),

              Flexible(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(players.players[index].name, style: TextStyle(fontSize: 30)),
                ),
              ),

              Container(
                margin: EdgeInsets.all(30),
                child: IconButton(
                  icon: Icon(Icons.close, size: 40),
                  onPressed: () {
                    if (players.players.length > 1){
                      players.deletePlayer(index);
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );


  }

  Widget playerForm(BuildContext context){
    var players = Provider.of<PlayerList>(context);

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(30),
            child: IconButton(
              icon: Icon(Icons.camera_alt, size: 30),
              onPressed: () {
                // Bild aufnehmen
              },
            ),
          ),

          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: TextField(
                controller: textController,
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.all(30),
            child: IconButton(
              icon: Icon(Icons.send, size: 30),
              onPressed: () {
                if (textController.text.isNotEmpty){
                  players.addPlayer(textController.text);
                  textController.clear();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
  */


}