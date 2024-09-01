import '../models/processo.dart';
import '../repositories/processo_repository.dart';

class ProcessoService {
  final ProcessoRepository _repository;

  ProcessoService(this._repository);

  Future<void> cadastrarProcesso(Processo processo) async {
    return await _repository.insertProcesso(processo);
  }

  Future<Processo?> consultarProcesso(String numeroProcesso) async {
    return await _repository.getProcesso(numeroProcesso);
  }

  Future<void> atualizarProcesso(Processo processo) async {
    return await _repository.updateProcesso(processo);
  }
}
