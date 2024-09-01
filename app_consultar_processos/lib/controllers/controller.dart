class Controller {
  final Service _service = Service();

  Future<void> initialize() async {
    await _service.initialize();
  }

  Future<void> dispose() async {
    await _service.dispose();
  }

  Future<String?> consultarProcesso(String numeroProcesso) async {
    if (numeroProcesso.isEmpty) {
      return 'O número do processo não pode ser vazio.';
    }

    final status = await _service.consultarProcesso(numeroProcesso);

    if (status == null) {
      return 'Processo não encontrado!';
    }

    return status;
  }

  Future<String> cadastrarProcesso(String numeroProcesso) async {
    if (numeroProcesso.isEmpty) {
      return 'O número do processo não pode ser vazio.';
    }

    final sucesso = await _service.cadastrarProcesso(numeroProcesso);

    if (sucesso) {
      return 'Processo cadastrado com sucesso!';
    } else {
      return 'Número de processo inválido ou já existente.';
    }
  }

  Future<void> avaliarProcesso(String numeroProcesso, String novoStatus) async {
    await _service.avaliarProcesso(numeroProcesso, novoStatus);
  }
}
