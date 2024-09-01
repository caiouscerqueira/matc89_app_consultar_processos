class Service {
  final Repository _repository = Repository();

  Future<void> initialize() async {
    await _repository.openConnection();
  }

  Future<void> dispose() async {
    await _repository.closeConnection();
  }

  Future<String?> consultarProcesso(String numeroProcesso) async {
    final processo = await _repository.fetchProcess(numeroProcesso);
    return processo?.status;
  }

  Future<bool> cadastrarProcesso(String numeroProcesso) async {
    if (await _repository.containsProcess(numeroProcesso)) {
      return false;
    } else {
      await _repository.saveProcess(Processo(numeroProcesso: numeroProcesso));
      return true;
    }
  }

  Future<void> avaliarProcesso(String numeroProcesso, String novoStatus) async {
    await _repository.updateProcessStatus(numeroProcesso, novoStatus);
  }
}
