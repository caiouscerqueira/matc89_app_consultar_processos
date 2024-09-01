import 'processo.dart';

class Usuario {
  String _cpf;
  Processo _processo;

  Usuario({required String cpf, required Processo processo})
      : _cpf = cpf,
        _processo = processo;

  String get cpf => _cpf;

  set cpf(String novoCpf) {
    _cpf = novoCpf;
  }

  Processo get processo => _processo;

  set processo(Processo novoProcesso) {
    _processo = novoProcesso;
  }
}
