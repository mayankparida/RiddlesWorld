import 'package:flutter/material.dart';
import 'package:riddleworld/universal/result.dart';
import 'package:riddleworld/universal/riddleAppbar.dart';

class Words4HomeScreen extends StatefulWidget {
  @override
  _Words4HomeScreenState createState() => _Words4HomeScreenState();
}

class _Words4HomeScreenState extends State<Words4HomeScreen> {
  String word;
  bool _isScore = false;
  int totalScore = 0;

  void resetHandler() {
    setState(() {
      totalScore = 0;
      _isScore = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RiddleBar(
      title: 'HEYYYY',
      body: _isScore
          ? Result(totalScore, 1, resetHandler, '/wordPage', answer: totalScore == 1 ? "😁😎😶😑🥱😉😪😌😴😭🤣": "",)
          : Center(
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1.6),
                            color: Colors.transparent),
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'I HAVE MANY FACES, EXPRESSIONS AND EMOTIONS AND AM ONLY ONE TAP AWAY. WHO AM I?',
                              style: TextStyle(fontSize: 15),
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.6),
                          color: Colors.transparent),
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                                labelText: 'Answer',
                                hintText: 'Enter answer in words!!'),
                            keyboardType: TextInputType.name,
                            onChanged: (value) => word = value,
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, right: 10, left: 10),
                            child: InkWell(
                              onTap: () {
                                if (word == "EMOJIS" || word == "emojis" || word == "EMOJI" || word == "emoji") {
                                  setState(() {
                                    totalScore = 1;
                                    _isScore = true;
                                  });
                                } else {
                                  setState(() {
                                    totalScore = 0;
                                    _isScore = true;
                                  });
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border.all(width: 1.6),
                                    color: Colors.transparent),
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: Text(
                                  'SUBMIT',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                              onPressed: () {
                                showDialog(
                                  barrierDismissible: true,
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    content: Text("It is nothing 😁😝"),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text('Got it!'),
                                        onPressed: () {Navigator.of(context).pop();},
                                      )
                                    ],
                                  )
                                );
                              },
                              child: Text("Hint")
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}