import 'dart:math';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  final List<String> opcoes = ['Pedra', 'Papel', 'Tesoura'];
  String escolhaJogador = '';
  String escolhaComputador = '';
  String resultado = '';
  int pontosJogador = 0;
  int pontosComputador = 0;

  // Função que gera a jogada aleatória do computador
  String jogadaComputador() {
    Random random = Random();
    int index = random.nextInt(3); // Gera um número aleatório entre 0 e 2
    return opcoes[index]; // Retorna 'Pedra', 'Papel' ou 'Tesoura'
  }

  // Função que verifica o resultado da jogada
  void verificarResultado(String escolhaJogador) {
    setState(() {
      escolhaComputador = jogadaComputador(); // Computador faz uma jogada

      // Verifica quem venceu
      if (escolhaJogador == escolhaComputador) {
        resultado = 'Empate!';
      } else if ((escolhaJogador == 'Pedra' && escolhaComputador == 'Tesoura') ||
                 (escolhaJogador == 'Papel' && escolhaComputador == 'Pedra') ||
                 (escolhaJogador == 'Tesoura' && escolhaComputador == 'Papel')) {
        resultado = 'Você venceu!';
        pontosJogador++;
      } else {
        resultado = 'Computador venceu!';
        pontosComputador++;
      }
    });
  }

  // Função que retorna a imagem da jogada do computador
  String imagemComputador() {
    if (escolhaComputador == 'Pedra') {
      return 'https://raw.githubusercontent.com/jean2q/pedra-papel-testoura/master/imagens/pedra1.png';
    } else if (escolhaComputador == 'Papel') {
      return 'https://raw.githubusercontent.com/jean2q/pedra-papel-testoura/master/imagens/papel1.png';
    } else if (escolhaComputador == 'Tesoura') {
      return 'https://raw.githubusercontent.com/jean2q/pedra-papel-testoura/master/imagens/tesoura1.png';
    } else {
      return ''; // Se não houver jogada, retorna vazio
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Pedra, Papel ou Tesoura'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Sua jogada', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Botão Tesoura
                GestureDetector(
                  onTap: () {
                    verificarResultado('Tesoura');
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://raw.githubusercontent.com/jean2q/pedra-papel-testoura/master/imagens/tesoura1.png'),
                  ),
                ),
                // Botão Pedra
                GestureDetector(
                  onTap: () {
                    verificarResultado('Pedra');
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://raw.githubusercontent.com/jean2q/pedra-papel-testoura/master/imagens/pedra1.png'),
                  ),
                ),
                // Botão Papel
                GestureDetector(
                  onTap: () {
                    verificarResultado('Papel');
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://raw.githubusercontent.com/jean2q/pedra-papel-testoura/master/imagens/papel1.png'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Text('Jogada do Computador', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            // Alteração feita aqui: Mostra a jogada do computador
            CircleAvatar(
              radius: 50,
              backgroundImage: escolhaComputador.isEmpty
                  ? null // Se o computador não jogou ainda, mostra vazio
                  : NetworkImage(imagemComputador()), // Mostra a imagem da jogada
              backgroundColor:
                  escolhaComputador.isEmpty ? Colors.grey : Colors.transparent, // Cor de fundo se não houver jogada
            ),
            SizedBox(height: 40),
            Text('Resultado', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text(resultado, style: TextStyle(fontSize: 24)), 
            SizedBox(height: 40),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('Você', style: TextStyle(fontSize: 18)),
                      Text(pontosJogador.toString(), style: TextStyle(fontSize: 36)),
                    ],
                  ),
                  Column(
                    children: [
                      Text('PC', style: TextStyle(fontSize: 18)),
                      Text(pontosComputador.toString(), style: TextStyle(fontSize: 36)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
