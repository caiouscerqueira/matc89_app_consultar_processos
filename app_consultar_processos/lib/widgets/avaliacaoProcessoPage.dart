import 'package:flutter/material.dart';
import 'controller.dart';
import 'processo.dart';

class AvaliacaoProcessoPage extends StatefulWidget {
  @override
  _AvaliacaoProcessoPageState createState() => _AvaliacaoProcessoPageState();
}

class _AvaliacaoProcessoPageState extends State<AvaliacaoProcessoPage> {
  final TextEditingController _numeroProcessoController = TextEditingController();
  final Controller _controller = Controller();
  String? _mensagem;

  @override
  void initState() {
    super.initState();
    _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _avaliarProcesso(String novoStatus) async {
    final numeroProcesso = _numeroProcessoController.text;
    final status = await _controller.consultarProcesso(numeroProcesso);

    if (status != null && status != 'Processo não encontrado!') {
      await _controller.avaliarProcesso(numeroProcesso, novoStatus);
      setState(() {
        _mensagem = 'Processo $numeroProcesso atualizado para "$novoStatus".';
      });
    } else {
      setState(() {
        _mensagem = 'Processo não encontrado!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avaliação de Processo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _numeroProcessoController,
              decoration: const InputDecoration(
                labelText: 'Número do Processo',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            Text('Selecione o novo status:', style: TextStyle(fontSize: 16.0)),
            const SizedBox(height: 16.0),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => _avaliarProcesso('Deferido'),
                  child: const Text('Deferido'),
                ),
                const SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () => _avaliarProcesso('Indeferido'),
                  child: const Text('Indeferido'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            if (_mensagem != null)
              Text(
                _mensagem!,
                style: const TextStyle(fontSize: 18.0, color: Colors.green),
              ),
          ],
        ),
      ),
    );
  }
}
