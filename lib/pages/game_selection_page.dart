import 'package:flutter/material.dart';

import 'package:sensor_tournament/pages/game_scream_page.dart';
import 'package:sensor_tournament/util/namedStatefulWidget.dart';

class GameSelectionPage extends StatelessWidget{

  List<NamedStatefulWidget> gamePages = [
    GameScreamPage(),
    GameScreamPage(),
    GameScreamPage(),
    GameScreamPage(),
    GameScreamPage(),
    GameScreamPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            headerWidget("Game selection"),
            Expanded(child: listWidget(context)),
          ],
        ),
      )
    );
  }


  Widget headerWidget(String title){
    return Column(
      children: [
        Text(title, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        Divider(),
      ],
    );
  }

  Widget listWidget(BuildContext context){
    return ListView.builder(
      itemCount: gamePages.length,
      itemBuilder: (context, index){
        return Card(
          color: Theme.of(context).canvasColor,
          elevation: 0,
          child: Column(
            children: [
              ButtonTheme(
                minWidth: MediaQuery.of(context).size.width * 0.7,
                buttonColor: Theme.of(context).primaryColorLight,
                child: RaisedButton(
                  padding: const EdgeInsets.all(30),
                  child: Text(gamePages[index].gameName, style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return gamePages[index];
                    }));
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ]
          )
        );
      },
    );
  }


/*
SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 60,
              ),
              ButtonTheme(
                minWidth: MediaQuery.of(context).size.width * 0.7,
                buttonColor: Theme.of(context).primaryColorLight,
                child: RaisedButton(
                  padding: const EdgeInsets.all(30),
                  child: Text("Glass shatterer", style: TextStyle(fontSize: 30)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return GameScreamPage();
                    }));
                  },
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              ButtonTheme(
                minWidth: MediaQuery.of(context).size.width * 0.7,
                buttonColor: Theme.of(context).primaryColorLight,
                child: RaisedButton(
                  onPressed: () {  },
                  padding: const EdgeInsets.all(30),
                  child: Text("Spiel 2", style: TextStyle(fontSize: 30),),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              ButtonTheme(
                minWidth: MediaQuery.of(context).size.width * 0.7,
                buttonColor: Theme.of(context).primaryColorLight,
                child: RaisedButton(
                  onPressed: () {  },
                  padding: const EdgeInsets.all(30),
                  child: Text("Spiel 3", style: TextStyle(fontSize: 30),),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
 */

}