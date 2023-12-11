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

  List<String> pergunta = [
    'Seu companheiro(a) já mudou de comportamento após pedir algo e não ser atendido ?',
    'Pede para você se afastar de amigos ou familiares com argumentos de que não são boa influência pra você ?',
    'Crítica ou tenta controlar suas fotos nas redes sociais, vigia seus seguidores ou quem você segue, e pede para bloquear ou excluir pessoas que o(a) desagradem?',
    'Mente facilmente ?',
    'Desqualifica ex companheiras(os)?',
    'Quando confrontado(a) ou flagrado(a) mentindo, culpa você ou terceiros ?',
    'É ciumento(a), vigia colegas de trabalho, critica suas roupas ou foto de perfil?',
    'Exige livre acesso ao seu celular e às suas conversas privadas?',
    'Seu companheiro(a) já teve ataques de fúria? Quebrou seu celular? Rasgou alguma roupa ou destruiu um presente?',
    'Já utilizou palavras ofensivas durante uma discussão?',
    'Seu companheiro(a) já ameaçou expor a intimidade de vocês ?',
    'Já te empurrou ou segurou com força ?',
    'Já puxou seu cabelo, te derrubou, te chutou ou te estapeou ?',
    'Já te impediu de sair do carro ou de algum local durante uma discussão?',
    'Já arremessou objetos contra você?',
    'Já te ameaçou com uma faca, facão, pedaço de madeira ou similar?',
    'Seu companheiro(a) já te ameaçou com arma de fogo ou mencionou comprar uma ?',
    'Seu companheiro(a) já tentou machucar a si mesmo ou já falou em suicídio?',
    'Tenta controlar como você gasta o seu dinheiro ?',
    'Já forçou uma relação sexual ou te chantageou dizendo que é sua obrigação?',
    'Seu companheiro(a) já falou ou insinuou que vai te matar?',
    // Adicione as perguntas restantes aqui
  ];

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
          child: mostrarVeredito ? buildFinalVerdict() : buildQuestion(),
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        resposta
            ? Image.asset(
                partesDoTermometro[respostaAtual],
                height: 300,
                width: 100,
              )
            : Image.asset(
                partesDoTermometro[respostaAtual != 0 ? respostaAtual - 1 : 0],
                height: 300,
                width: 100,
              ),
        SizedBox(height: 30),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(pergunta[respostaAtual]),
          SizedBox(height: 30),
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => answerQuestion(true),
              child: Text('Sim'),
            ),
            SizedBox(width: 30),
            ElevatedButton(
              onPressed: () => answerQuestion(false),
              child: Text('Não'),
            )
          ],
        ),
      ],
    );
  }
}
