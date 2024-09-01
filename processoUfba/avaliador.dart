import 'processo.dart';

class Avaliador {
  String _codigo;
  Processo _processo;

  Avaliador({required String codigo, required Processo processo})
      : _codigo = codigo,
        _processo = processo;

  String get codigo => _codigo;

  set codigo(String novoCodigo) {
    _codigo = novoCodigo;
  }

  Processo get processo => _processo;

  set processo(Processo novoProcesso) {
    _processo = novoProcesso;
  }
}
