import 'package:flutter/material.dart';

class GameSelectionPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Game selection", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
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
                  onPressed: () {  },
                  padding: const EdgeInsets.all(30),
                  child: Text("Spiel 1", style: TextStyle(fontSize: 30),),
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
    );
  }

}