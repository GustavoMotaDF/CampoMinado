import 'package:campominado/componentes/campo_widget.dart';
import 'package:campominado/model/tabuleiro.dart';
import 'package:flutter/material.dart';
import '../model/tabuleiro.dart';
import '../model/campo.dart';

class TabuleiroWidget extends StatelessWidget {
  final Tabuleiro tabuleiro;
  final void Function(Campo)onAbrir;
  final void Function(Campo)onAlterarMarcacao;

  TabuleiroWidget({
    @required this.tabuleiro,
    @required this.onAbrir,
    @required this.onAlterarMarcacao,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        //horizontal
        crossAxisCount: tabuleiro.colunas,
        children: tabuleiro.campos.map((c){
          return CamposWidget(
             campo: c,
             onAbrir: onAbrir,
             onAlterarMarcacao: onAlterarMarcacao, 
          );
        }).toList(),
      ),
    );
  }
}