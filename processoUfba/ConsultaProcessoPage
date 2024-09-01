class ConsultaProcessoPage extends StatefulWidget {
  @override
  _ConsultaProcessoPageState createState() => _ConsultaProcessoPageState();
}

class _ConsultaProcessoPageState extends State<ConsultaProcessoPage> {
  final TextEditingController _numeroProcessoController = TextEditingController();
  final Controller _controller = Controller();
  String? _status;
  String? _mensagem;

  @override
  void initState() {
    super.initState();
    _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _consultarProcesso() async {
    final numeroProcesso = _numeroProcessoController.text;
    final resultado = await _controller.consultarProcesso(numeroProcesso);

    setState(() {
      if (resultado == 'Processo não encontrado!') {
        _status = null;
        _mensagem = resultado;
      } else {
        _status = resultado;
        _mensagem = null;
      }
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
          children: [
            TextField(
              controller: _numeroProcessoController,
              decoration: const InputDecoration(
                labelText: 'Número do Processo',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _consultarProcesso,
              child: const Text('Consultar Processo'),
            ),
            if (_status != null)
              Text(
                'Status: $_status',
                style: const TextStyle(fontSize: 18.0),
              ),
            if (_mensagem != null)
              Text(
                _mensagem!,
                style: const TextStyle(fontSize: 18.0, color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
