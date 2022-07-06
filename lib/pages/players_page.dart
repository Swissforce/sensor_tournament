import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sensor_tournament/model/player.dart';


class PlayersPage extends StatefulWidget{
  @override
  _PlayersPageState createState() => _PlayersPageState();
}

class _PlayersPageState extends State<PlayersPage> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Spieler", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: playerList(context)),
            playerForm(context),
          ],
        ),
      ),
    );
  }



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
                  onPressed: () {},
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
                onPressed: () {  },
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
                onPressed: () {  },
              ),
            ),
          ],
        ),
    );
  }

}