import 'package:campominado/model/tabuleiro.dart';
import 'package:flutter_test/flutter_test.dart';

main(){
  test('GanharJoog', (){
    Tabuleiro tabuleiro = Tabuleiro (
      linhas: 2,
      colunas: 2,
      qtdeBombas: 0,
    );
    tabuleiro.campos[0].minar();
    tabuleiro.campos[3].minar();

    //jogando
    tabuleiro.campos[0].alternarMArcacao();
    tabuleiro.campos[1].abrir();
    tabuleiro.campos[2].abrir();
    tabuleiro.campos[3].alternarMArcacao();

    expect(tabuleiro.resolvido, isTrue);

  });
}