class ProcessoPage extends StatefulWidget {
  @override
  _ProcessoPageState createState() => _ProcessoPageState();
}

class _ProcessoPageState extends State<ProcessoPage> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _novoProcessoController = TextEditingController();
  final Controller _controllerProcesso = Controller();
  String? _status; // Status do processo
  String? _mensagem; // Mensagem para exibir erro ou confirmação

  void _consultarProcesso() {
    final numeroProcesso = _controller.text;
    final resultado = _controllerProcesso.consultarProcesso(numeroProcesso);

    setState(() {
      if (resultado == 'Processo não encontrado!' || resultado == null) {
        _status = null;
        _mensagem = resultado;
      } else {
        _status = resultado;
        _mensagem = null; // Limpa a mensagem de erro, se houver
      }
    });
  }

  void _cadastrarProcesso() {
    final numeroProcesso = _novoProcessoController.text;
    final resultado = _controllerProcesso.cadastrarProcesso(numeroProcesso);

    setState(() {
      _mensagem = resultado;
      _novoProcessoController.clear(); // Limpa o campo de novo processo
    });
  }

  @override
  Widget build(BuildContext context) {
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
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Número do Processo',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _consultarProcesso,
              child: const Text('Consultar'),
            ),
            const SizedBox(height: 16.0),
            if (_status != null)
              Text(
                'Status: $_status',
                style: const TextStyle(fontSize: 18.0),
              ),
            if (_mensagem != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _mensagem!,
                    style: const TextStyle(fontSize: 18.0, color: Colors.red),
                  ),
                  if (_mensagem == 'Processo não encontrado!')
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: _novoProcessoController,
                            decoration: const InputDecoration(
                              labelText: 'Cadastrar Novo Processo',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 16.0),
                          ElevatedButton(
                            onPressed: _cadastrarProcesso,
                            child: const Text('Cadastrar'),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
