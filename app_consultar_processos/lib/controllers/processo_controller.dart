import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/processo.dart';
import '../services/processo_service.dart';

class ProcessoController extends StateNotifier<AsyncValue<Processo?>> {
  final ProcessoService _service;

  ProcessoController(this._service) : super(const AsyncValue.loading());

  Future<void> cadastrarProcesso(Processo processo) async {
    await _service.cadastrarProcesso(processo);
    state = AsyncValue.data(processo);
  }

  Future<void> consultarProcesso(String numeroProcesso) async {
    state = const AsyncValue.loading();
    final processo = await _service.consultarProcesso(numeroProcesso);
    if (processo != null) {
      state = AsyncValue.data(processo);
    } else {
      state = AsyncValue.error("Processo não encontrado");
    }
  }

  Future<void> atualizarProcesso(Processo processo) async {
    await _service.atualizarProcesso(processo);
    state = AsyncValue.data(processo);
  }
}
