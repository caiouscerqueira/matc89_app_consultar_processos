import 'package:flutter/material.dart';
import 'cadastroProcessoPage.dart';
import 'consultaProcessoPage.dart';
import 'avaliacaoProcessoPage.dart';
import 'repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final repository = Repository();
  await repository.initialize();

  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final Repository repository;

  MyApp({required this.repository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistema de Processos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(repository: repository),
      routes: {
        '/cadastro': (context) => CadastroProcessoPage(repository: repository),
        '/consulta': (context) => ConsultaProcessoPage(repository: repository),
        '/avaliacao': (context) => AvaliacaoProcessoPage(repository: repository),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final Repository repository;

  HomePage({required this.repository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sistema de Processos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cadastro');
              },
              child: const Text('Cadastro de Processo'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/consulta');
              },
              child: const Text('Consulta de Processos'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/avaliacao');
              },
              child: const Text('Avaliação de Processo'),
            ),
          ],
        ),
      ),
    );
  }
}
