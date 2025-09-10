import 'dart:math';
import 'package:flutter/material.dart';
// import 'package:flutter_application_1/mao.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _move = "images/default.png";
  String _result = "Esperando Jogada!";

  Map combinations = {
    "pedrapapel": 0,
    "papeltesoura": 0,
    "tesourapedra": 0,
    "pedrapedra": 1,
    "papelpapel": 1,
    "tesouratesoura": 1,
    "papelpedra": 2,
    "tesourapapel": 2,
    "pedratesoura": 2,
  };

  final List<String> _results = [
    "Você PERDEU! :(",
    "Jogo EMPATOU! :|",
    "Você GANHOU! :)",
  ];

  void result(String jogada, String cpu){
    _result = _results[combinations["$jogada$cpu"]];
    print("Resultado: $_result");
  }
  
  final List<String> _moveList = [ 
    "images/pedra.png",
    "images/tesoura.png",
    "images/papel.png",
  ];

  String nextMove(){
    int index = Random().nextInt(_moveList.length);
    _move = _moveList[index];
    print('cpu: ' + _move);
    if(index == 0) return 'pedra';
    if(index == 1) return 'tesoura';
    return 'papel';
  }

void tapPedra() {
  setState(() {
    result('pedra', nextMove());
  });
}

void tapPapel() {
  setState(() {
    result('papel', nextMove());
  });
}

void tapTesoura() {
  setState(() {
    result('tesoura', nextMove());
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pedra, Papel ou Tesoura!"),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              ),
      body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(_move, height: 120, width: 120,),
                  Text(_result, style: TextStyle(
                    fontSize: 40, 
                    fontWeight: FontWeight.bold, 
                    color: _result == _results[0] ? Colors.red: (_result == _results[2] ? Colors.green: Colors.grey),
                    ),
                  ),
                  Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: tapPedra,
                        child: Image.asset("images/pedra.png", height: 80, width: 80,),
                      ),
                      GestureDetector(
                        onTap: tapPapel,
                        child: Image.asset("images/papel.png", height: 80, width: 80,),
                      ),
                      GestureDetector(
                        onTap: tapTesoura,
                        child: Image.asset("images/tesoura.png", height: 80, width: 80,),
                      ),
                    ],
                  )
                  )
                ],
              ),
            ),
    ); 
  }
}