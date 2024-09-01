class Processo {
  String _numeroProcesso;
  String _status;

  Processo({required String numeroProcesso, String status = 'Aberto'})
      : _numeroProcesso = numeroProcesso,
        _status = status;

  String get numeroProcesso => _numeroProcesso;

  set numeroProcesso(String numero) {
    _numeroProcesso = numero;
  }

  String get status => _status;

  set status(String novoStatus) {
    _status = novoStatus;
  }
}
