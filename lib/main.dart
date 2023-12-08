import 'package:flutter/material.dart';

void main() {
  runApp(QuestionarioApp());
}

class QuestionarioApp extends StatefulWidget {
  @override
  _QuestionnaireAppState createState() => _QuestionnaireAppState();
}

class _QuestionnaireAppState extends State<QuestionarioApp> {
  int respostaAtual = 0;
  bool resposta = false;
  bool mostrarVeredito = false;
  int imagemAtual = 0;
  bool eRelacionamentoAbusivo = false;

  List<String> partesDoTermometro = [
    'assets/00.png',
    'assets/01.png',
    'assets/02.png',
    'assets/03.png',
    'assets/04.png',
    'assets/05.png',
    'assets/06.png',
    'assets/07.png',
    'assets/08.png',
    'assets/09.png',
    'assets/10.png',
    'assets/11.png',
    'assets/12.png',
    'assets/13.png',
    'assets/14.png',
    'assets/15.png',
    'assets/16.png',
    'assets/17.png',
    'assets/18.png',
    'assets/19.png',
    'assets/20.png',
  ];

  // Function to handle user's response to a question
  void answerQuestion(bool respostaUsuario) {
    setState(() {
      resposta = respostaUsuario;
      respostaAtual++;

      if (respostaAtual == partesDoTermometro.length) {
        mostrarVeredito = true;
      }
    });
  }

  // Function to build the widget
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Termômetro da Violência'),
        ),
        body: Center(
          child: mostrarVeredito
              ? buildFinalVerdict()
              : buildQuestion(),
        ),
      ),
    );
  }

  // Widget for displaying the final verdict
  Widget buildFinalVerdict() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Veredito Final:'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: partesDoTermometro.map((imagePath) {
            return Image.asset(
              imagePath,
              height: 20,
              width: 10,
            );
          }).toList(),
        ),
        Text(resposta ? 'Relacionamento Abusivo' : 'Relacionamento Saudável'),
      ],
    );
  }

  // Widget for building a question
  Widget buildQuestion() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        resposta
            ? Image.asset(
                partesDoTermometro[respostaAtual],
                height: 600,
                width: 100,
              )
            : Image.asset(
                partesDoTermometro[
                    respostaAtual != 0 ? respostaAtual - 1 : 0],
                height: 600,
                width: 100,
              ),
        SizedBox(width: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Pergunta ${respostaAtual + 1}: Você concorda?'),
            ElevatedButton(
              onPressed: () => answerQuestion(true),
              child: Text('Sim'),
            ),
            ElevatedButton(
              onPressed: () => answerQuestion(false),
              child: Text('Não'),
            ),
          ],
        ),
      ],
    );
  }
}
