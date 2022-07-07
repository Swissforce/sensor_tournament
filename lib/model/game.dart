import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sensor_tournament/model/player.dart';

class Game extends ChangeNotifier {
  late List<Player> _players;
  late Map<Player, int> _playerScore = Map();

  int _currentPlayerIndex = 0;
  int _highestScorePlayerIndex = 0;

  String _currentGameName = "";
  String _endHighestValue = "";
  String _valueSuffix = "";



  //Constructor
  Game({BuildContext? context : null, List<Player>? players : null}){
    if (context != null){
      this._players = Provider.of<PlayerList>(context).players;
    }
    else if (players != null){
      this._players = players;
    }
    for (var i = 0; i < _players.length; i++){
      _playerScore[_players[i]] = 0;
    }
  }

  //Getter
  List<Player> get players => List.unmodifiable(_players);

  Map<Player, int> get playerScore => Map.unmodifiable(_playerScore);

  int get currentPlayerIndex => _currentPlayerIndex;

  int get highestScorePlayerIndex => _highestScorePlayerIndex;

  String get currentGameName => _currentGameName;

  String get endHighestValue => _endHighestValue;

  String get valueSuffix => _valueSuffix;



  //Setter
  void setScore(int playerIndex, int score){
    _playerScore[_players[playerIndex]] = score;
    notifyListeners();
  }

  void newHighestScoreIndex(){
    _highestScorePlayerIndex = _currentPlayerIndex;
  }


  bool nextPlayer(){
    if (_players.length - _currentPlayerIndex > 1){
      _currentPlayerIndex++;
      notifyListeners();
      return true;
    }
    _currentPlayerIndex = 0;
    notifyListeners();
    return false;
  }



  void endGame(String gameName, String highestValue, [String? valueSuffix]){
    _currentGameName = gameName;
    _endHighestValue = highestValue;
    if (valueSuffix != null) _valueSuffix = valueSuffix;
    _distributePoints();
  }

  void _distributePoints(){
    if (_players.length - _currentPlayerIndex > 1){
      return;
    }

    //https://stackoverflow.com/questions/30620546/how-to-sort-map-value
    var sortedPlayerScore = _playerScore.keys.toList(growable:false)
      ..sort((k1, k2) => _playerScore[k2]!.compareTo(_playerScore[k1]!));
    LinkedHashMap sortedMap = LinkedHashMap
        .fromIterable(sortedPlayerScore, key: (k) => k, value: (k) => _playerScore[k]);

    //1.Platz = 3pts, 2. = 2pts, 3 = 1pt, 4+ = 0pts
    for(int i = 0; i < 3; i++){
      sortedPlayerScore[i].addPoints(3 - i);
    }

  }


}
