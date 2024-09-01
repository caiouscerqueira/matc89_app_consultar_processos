import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'widgets/cadastro_processo_page.dart';
import 'widgets/consulta_processo_page.dart';
import 'widgets/avaliacao_processo_page.dart';
import 'repositories/processo_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistema de Processos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/cadastro': (context) => CadastroProcessoPage(),
        '/consulta': (context) => ConsultaProcessoPage(),
        '/avaliacao': (context) => AvaliacaoProcessoPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
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
