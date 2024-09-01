import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ProcessoPage(),
  ));
}

class ProcessoPage extends StatefulWidget {
  @override
  _ProcessoPageState createState() => _ProcessoPageState();
}

class _ProcessoPageState extends State<ProcessoPage> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _novoProcessoController = TextEditingController();
  String? _status; // Status do processo
  String? _mensagem; // Mensagem para exibir erro ou confirmação
  Map<String, String> _dadosProcessos = {
    '12345': 'Aprovado - Documentos completos.',
    '67890': 'Em análise - Documentos pendentes.',
    '54321': 'Rejeitado - Documentação incorreta.',
  };

  void _consultarProcesso() {
    final numeroProcesso = _controller.text;
    setState(() {
      if (_dadosProcessos.containsKey(numeroProcesso)) {
        _status = _dadosProcessos[numeroProcesso];
        _mensagem = null; // Limpa a mensagem de erro, se houver
      } else {
        _status = null;
        _mensagem = 'Processo não encontrado!';
      }
    });
  }

  void _cadastrarProcesso() {
    final numeroProcesso = _novoProcessoController.text;
    setState(() {
      if (numeroProcesso.isNotEmpty && !_dadosProcessos.containsKey(numeroProcesso)) {
        _dadosProcessos[numeroProcesso] = 'Aberto - Aguardando análise.';
        _mensagem = 'Processo cadastrado com sucesso!';
      } else {
        _mensagem = 'Número de processo inválido ou já existente.';
      }
      _novoProcessoController.clear(); // Limpa o campo de novo processo
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta de Processo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Número do Processo',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _consultarProcesso,
              child: const Text('Consultar'),
            ),
            const SizedBox(height: 16.0),
            if (_status != null)
              Text(
                'Status: $_status',
                style: const TextStyle(fontSize: 18.0),
              ),
            if (_mensagem != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _mensagem!,
                    style: const TextStyle(fontSize: 18.0, color: Colors.red),
                  ),
                  if (_mensagem == 'Processo não encontrado!')
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: _novoProcessoController,
                            decoration: const InputDecoration(
                              labelText: 'Cadastrar Novo Processo',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 16.0),
                          ElevatedButton(
                            onPressed: _cadastrarProcesso,
                            child: const Text('Cadastrar'),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
