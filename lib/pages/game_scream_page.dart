import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:noise_meter/noise_meter.dart';

import 'package:sensor_tournament/model/game.dart';
import 'package:sensor_tournament/pages/game_winner_page.dart';
import 'package:sensor_tournament/util/namedStatefulWidget.dart';


String _gameName = "Glass shatterer";
String _gameDesc = "Scream the loudest";

class GameScreamPage extends NamedStatefulWidget{
  @override
  _GameScreamPage createState() => _GameScreamPage();

  @override
  String get gameDesc => _gameDesc;

  @override
  String get gameName => _gameName;
}

class _GameScreamPage extends State<GameScreamPage>{
  late Game game;
  double _currentDecibel = 0, _maxDecibelPlayer = 0;
  int _currentPlayerIndex = 0, _currentMaxDecibelPlayerIndex = 0;
  late StreamSubscription<NoiseReading> _noiseSubscription;

  @override
  void initState() {
    super.initState();
    startReadingDecibel();
  }

  void startReadingDecibel(){
    _noiseSubscription = NoiseMeter().noiseStream.listen((NoiseReading noiseReading) {
      setState(() {
        _currentDecibel = double.parse(noiseReading.meanDecibel.toStringAsFixed(1));
        if (_currentDecibel > _maxDecibelPlayer){
          _maxDecibelPlayer = _currentDecibel;
          _currentMaxDecibelPlayerIndex = _currentPlayerIndex;
        }
      });
    });
  }

  void stopReadingDecibel(){
    _noiseSubscription.cancel();
    _currentDecibel = 0;
    _maxDecibelPlayer = 0;
  }

  @override
  Widget build(BuildContext context) {
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
            Expanded(child: gameWidget(context)),
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

    if (game.players[game.currentPlayerIndex].picture != profilePicture){
      profilePicture = game.players[game.currentPlayerIndex].picture;
    }

    return Column(
      children: [
        Text("$_gameName", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        Text("$_gameDesc", style: TextStyle(fontSize: 20)),
        Divider(),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(profilePicture.icon, size: 30),
            Flexible(
              child: Container(
                child: Text(game.players[game.currentPlayerIndex].name, style: TextStyle(fontSize: 25)),
              ),
            ),
          ],
        )
      ],
    );
  }


  Widget gameWidget(BuildContext context){
    game = Provider.of<Game>(context);


    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text("Highest dB:"),
            Text("$_maxDecibelPlayer", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 20,
            ),
            Text("Current dB:"),
            Text("$_currentDecibel", style: TextStyle(fontSize: 25)),
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
          icon: Icon(Icons.keyboard_double_arrow_right, size: 50),
          onPressed: () {
            bool nextPlayer = game.nextPlayer();

            _currentPlayerIndex = game.currentPlayerIndex;

            if(!nextPlayer){
              game.endGame(_gameName, _maxDecibelPlayer.toString(), _currentMaxDecibelPlayerIndex, "dB");
              stopReadingDecibel();

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return GameWinnerPage();
              }));
            }
          },
        )
      ],
    );
  }





}