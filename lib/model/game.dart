import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sensor_tournament/model/player.dart';

class Game extends ChangeNotifier {
  late List<Player> _players;
  late Map<Player, int> _playerScore = Map();
  int _currentPlayerIndex = 0;
  int _highestScorePlayerIndex = 0;


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



  //Setter
  void setScore(int playerIndex, int score){
    _playerScore[_players[playerIndex]] = score;
    notifyListeners();
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


}
