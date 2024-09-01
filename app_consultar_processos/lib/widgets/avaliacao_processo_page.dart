import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/processo.dart';
import '../providers/processo_provider.dart';

class AvaliacaoProcessoPage extends ConsumerWidget {
  final TextEditingController _numeroController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              child: const Text('Buscar Processo'),
            ),
            const SizedBox(height: 16.0),
            Consumer(
              builder: (context, watch, child) {
                final processoState = ref.watch(processoControllerProvider);
                return processoState.when(
                  data: (processo) {
                    if (processo == null) {
                      return const Text('Processo não encontrado');
                    }
                    return Column(
                      children: [
                        const Text('Selecione o novo status:'),
                        DropdownButton<String>(
                          value: processo.status,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              processo.status = newValue;
                              ref.read(processoControllerProvider.notifier)
                                  .atualizarProcesso(processo);
                            }
                          },
                          items: const [
                            DropdownMenuItem(
                              value: 'Aberto',
                              child: Text('Aberto'),
                            ),
                            DropdownMenuItem(
                              value: 'Deferido',
                              child: Text('Deferido'),
                            ),
                            DropdownMenuItem(
                              value: 'Indeferido',
                              child: Text('Indeferido'),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                  loading: () => const CircularProgressIndicator(),
                  error: (error, _) => Text(error.toString(), style: const TextStyle(color: Colors.red)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
