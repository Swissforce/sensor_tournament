import 'package:flutter/material.dart';

class _Player extends ChangeNotifier{
  String _name;
  int _points = 0;
  String _picturePath;

  //Constructor
  _Player(String name, {String? picturePath}) : _name = name, _picturePath = picturePath ?? "";


  //Getter
  String get name => _name;

  Icon get picture {
    return const Icon(Icons.person);
    /*
    if (_picturePath!.isEmpty){
      return const Icon(Icons.person);
    }
    return Icon(ImageIc)

     */
  }

  int get points => _points;

  //Setter
  void setName(String name){
    _name = name;
    notifyListeners();
  }

  void setPicture(String picturePath){
    _picturePath = picturePath;
    notifyListeners();
  }

  void setPoints(int points){
    _points = points;
    notifyListeners();
  }


}

class PlayerList extends ChangeNotifier{
  late List<_Player> _players;

  //Constructor
  PlayerList(){
    _players = <_Player>[
      _Player("Martin"),
      _Player("Jose"),
      _Player("Martin Christopher Düppenbecker der Grosse Jr der zweite vom Kaiserreich Grosspreussen der 3. Welthämisphäre"),
      _Player("Emma")

    ];
  }

  //Getter
  List<_Player> get players => _players;


  void addPlayer(String name, {String? picturePath}){
    _players.add(_Player(name, picturePath: picturePath));
    notifyListeners();
  }

  void deletePlayer(int index){
    _players.removeAt(index);
    notifyListeners();
  }

}