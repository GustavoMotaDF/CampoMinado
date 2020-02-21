
import 'package:campominado/componentes/tabuleiro_widget.dart';
import 'package:campominado/model/expolsao_exception.dart';
import 'package:campominado/model/tabuleiro.dart';
import 'package:flutter/material.dart';
import '../componentes/resultado_widget.dart';
import '../model/campo.dart';

class CampoMinadoApp extends StatefulWidget {
  @override
  _CampoMinadoAppState createState() => _CampoMinadoAppState();
}

class _CampoMinadoAppState extends State<CampoMinadoApp> {
  bool _venceu;
  Tabuleiro _tabuleiro ;

  void _reiniciar() {
     
    setState(() {
      _venceu=null;
      _tabuleiro.reiniciar();
    });
  }

  void _abrir(Campo campo) {
    if(_venceu != null){
        return;
      }
    setState(() {
      
      try{
         campo.abrir(); 
         if(_tabuleiro.resolvido){
            _venceu=true;
         }
      }on ExplosaoException{
          _venceu = false;
          _tabuleiro.revelarBombas();
      }
    });
  }

  void _alternarMarcacao(Campo campo) {
    if(_venceu != null){
        return;
      }
    setState(() {   
         
         campo.alternarMArcacao(); 
         if(_tabuleiro.resolvido){
            _venceu=true;
         }       
    });
  }
  Tabuleiro _getTabuleiro(double largura, double altura){
    if(_tabuleiro == null){
      int qtdColunas = 10;
      double tamanhoCampo = largura / qtdColunas;
      int qtdeLinhas = (altura/tamanhoCampo).floor();

      _tabuleiro = Tabuleiro(
        linhas:qtdeLinhas,
        colunas: qtdColunas,
        qtdeBombas: 15,
      );
    }
    return _tabuleiro;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(
          venceu: _venceu,
          onReiniciar: _reiniciar,
        ),
        body: Container(
            color: Colors.grey,
            child: LayoutBuilder(
              builder: (ctx, constraints){
                return TabuleiroWidget(
                  tabuleiro: _getTabuleiro(
                    constraints.maxWidth,
                    constraints.maxHeight,
                  ),
                  onAbrir: _abrir,
                  onAlterarMarcacao: _alternarMarcacao,
                );
              },
            ),
         ),
      ),
    );
  }
}
