import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    print("Escolha do App: " + escolhaApp);
    print("Escolha do Usuario: " + escolhaUsuario);

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("images/tesoura.png");
        });
        break;
    }
    //validação
    //usuario ganhador
    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      this._mensagem = "Eba...Você Ganhou !!!";
    }
    //usuario perdedor
    else if ((escolhaUsuario == "pedra" && escolhaApp == "papel") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "pedra") ||
        (escolhaUsuario == "papel" && escolhaApp == "tesoura")) {
      this._mensagem = ":( Você Perdeu !!!";
    }
    //empate
    else {
      this._mensagem = ":| Deu Empate ...";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                "Escolha do App:",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
                textAlign: TextAlign.center,
              )),
          Image(
            image: this._imagemApp,
          ),
          Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                this._mensagem,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
                textAlign: TextAlign.center,
              )),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            GestureDetector(
              onTap: () => _opcaoSelecionada("pedra"),
              child: Image.asset(
                "images/pedra.png",
                height: 100,
              ),
            ),
            GestureDetector(
              onTap: () => _opcaoSelecionada("papel"),
              child: Image.asset(
                "images/papel.png",
                height: 100,
              ),
            ),
            GestureDetector(
              onTap: () => _opcaoSelecionada("tesoura"),
              child: Image.asset(
                "images/tesoura.png",
                height: 100,
              ),
            ),
          ])
        ],
      ),
    );
  }
}
