import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/processo.dart';
import '../providers/processo_provider.dart';

class CadastroProcessoPage extends ConsumerWidget {
  final TextEditingController _numeroController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Processo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _numeroController,
              decoration: const InputDecoration(
                labelText: 'Número do Processo',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final processo = Processo(numeroProcesso: _numeroController.text);
                ref.read(processoControllerProvider.notifier).cadastrarProcesso(processo);
              },
              child: const Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
