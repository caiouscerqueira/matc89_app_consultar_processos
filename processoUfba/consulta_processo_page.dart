import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/processo_provider.dart';

class ConsultaProcessoPage extends ConsumerWidget {
  final TextEditingController _numeroController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final processoState = ref.watch(processoControllerProvider);

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
                ref.read(processoControllerProvider.notifier)
                    .consultarProcesso(_numeroController.text);
              },
              child: const Text('Consultar'),
            ),
            const SizedBox(height: 16.0),
            processoState.when(
              data: (processo) => processo != null
                  ? Text('Status: ${processo.status}')
                  : const Text('Processo não encontrado'),
              loading: () => const CircularProgressIndicator(),
              error: (error, _) => Text(error.toString(), style: const TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }
}
