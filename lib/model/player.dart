import 'package:flutter/material.dart';

class Player extends ChangeNotifier{
  String _name;
  int _pointsOverall = 0;
  String _picturePath;

  //Constructor
  Player(String name, {String? picturePath}) : _name = name, _picturePath = picturePath ?? "";


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

  int get points => _pointsOverall;

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
    _pointsOverall = points;
    notifyListeners();
  }

  void addPoints(int points){
    _pointsOverall += points;
    notifyListeners();
  }




}

class PlayerList extends ChangeNotifier{
  late List<Player> _players;

  //Constructor
  PlayerList(){
    _players = <Player>[
      Player("Martin"),
      Player("Jose"),
      Player("Martin Christopher Düppenbecker der Grosse Jr der zweite vom Kaiserreich Grosspreussen der nördlichen Welthämisphäre und Grossherr von Deutsch-Südafrika"),
      Player("Emma")

    ];
  }

  //Getter
  List<Player> get players => _players;


  void addPlayer(String name, {String? picturePath}){
    _players.add(Player(name, picturePath: picturePath));
    notifyListeners();
  }

  void deletePlayer(int index){
    _players.removeAt(index);
    notifyListeners();
  }

}