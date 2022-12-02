import 'dart:math';

import 'package:flutter/material.dart';

//stateful
class jokenPo extends StatefulWidget {
  const jokenPo({Key? key}) : super(key: key);

  @override
  State<jokenPo> createState() => _jokenPoState();
}

class _jokenPoState extends State<jokenPo> {

  var _imagemApp = AssetImage('images/padrao.png');
  var _mensagem = 'Escolha uma opção abaixo';
  opecaoSelecionada(String escolhaUser){
    var opcoes = [
      'images/pedra.png','images/papel.png','images/tesoura.png'
    ];
    
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];
    print('Escolha do APP!' + escolhaApp);
    print('Escolha do User!'+escolhaUser);
        setState(() {
          this._imagemApp = AssetImage(escolhaApp);
        });
        if(
        (escolhaUser == 'images/pedra.png' && escolhaApp == 'images/tesoura.png')||
            (escolhaUser == 'images/tesoura.png' && escolhaApp == 'images/papel.png')||
            (escolhaUser == 'images/papel.png' && escolhaApp == 'images/pedra.png')
        )
          setState(() {
            this._mensagem = 'Voce Ganhou';
          });

          else if(
          (escolhaApp == 'images/pedra.png' && escolhaUser == 'images/tesoura.png')||
              (escolhaApp == 'images/tesoura.png' && escolhaUser == 'images/papel.png')||
              (escolhaApp == 'images/papel.png' && escolhaUser == 'images/pedra.png')
          )

          setState(() {
            this._mensagem = 'Voce Perdeu';
          });

          else{
            setState(() {
              this._mensagem='Empate';
            });
        }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text('JokenPo!',textAlign: TextAlign.center,),
     ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 26, bottom: 16)),
          Text('Escolha do APP',textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
          Image(image: this._imagemApp,),
          Text(this._mensagem,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // Image.asset('images/pedra.png', height: 90,),
              // Image.asset('images/papel.png',height: 90,),
              // Image.asset('images/tesoura.png',height: 90,),
              GestureDetector(
                onTap: ()=> opecaoSelecionada('images/tesoura.png'),
                child: Image.asset('images/tesoura.png',height: 90,),
              ),
              GestureDetector(
                onTap: ()=> opecaoSelecionada('images/pedra.png'),
                child: Image.asset('images/pedra.png',height: 90,),
              ),
              GestureDetector(
                onTap: ()=> opecaoSelecionada('images/papel.png'),
                child: Image.asset('images/papel.png',height: 90,),
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Text('Licenciado cia.LTDA',textAlign: TextAlign.center,)
      ),
    );
  }
}

