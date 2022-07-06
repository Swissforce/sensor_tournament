import 'package:flutter/material.dart';
import 'package:sensor_tournament/pages/game_selection_page.dart';
import 'package:sensor_tournament/pages/players_page.dart';


class MainMenuPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mainmenu", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width * 0.7,
              buttonColor: Theme.of(context).primaryColorLight,
              child: RaisedButton(
                onPressed: () {  },
                padding: const EdgeInsets.all(30),
                child: Text("Spielen", style: TextStyle(fontSize: 30),),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width * 0.7,
                buttonColor: Theme.of(context).primaryColorLight,
              child: RaisedButton(
                padding: const EdgeInsets.all(30),
                child: Text("Spieleauswahl", style: TextStyle(fontSize: 30),),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return GameSelectionPage();
                  }));
                },
              )
            ),
            const SizedBox(
              height: 60,
            ),
            ButtonTheme(
                minWidth: MediaQuery.of(context).size.width * 0.7,
                buttonColor: Theme.of(context).primaryColorLight,
                child: RaisedButton(
                  padding: const EdgeInsets.all(30),
                  child: Text("Spieler", style: TextStyle(fontSize: 30),),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return PlayersPage();
                    }));
                  },
                )
            ),
          ],
        ),
      ),
    );
  }

}