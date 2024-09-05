import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
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
              children: const [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage('https://raw.githubusercontent.com/jean2q/pedra-papel-testoura/master/imagens/tesoura1.png')
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage('https://raw.githubusercontent.com/jean2q/pedra-papel-testoura/master/imagens/pedra1.png')
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage('https://raw.githubusercontent.com/jean2q/pedra-papel-testoura/master/imagens/papel1.png')
                ),
              ],
            ),
            SizedBox(height: 40),
            Text('Jogada do Computador', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey, // Placeholder for image
            ),
            SizedBox(height: 40),
            Text('Resultado', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Você Ganhou Estatico', style: TextStyle(fontSize: 24)),
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
                      Text('5', style: TextStyle(fontSize: 36)),
                    ],
                  ),
                  Column(
                    children: [
                      Text('PC', style: TextStyle(fontSize: 18)),
                      Text('2', style: TextStyle(fontSize: 36)),
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
