class CadastroProcessoPage extends StatefulWidget {
  @override
  _CadastroProcessoPageState createState() => _CadastroProcessoPageState();
}

class _CadastroProcessoPageState extends State<CadastroProcessoPage> {
  final TextEditingController _numeroProcessoController = TextEditingController();
  final Controller _controller = Controller();
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

  void _cadastrarProcesso() async {
    final numeroProcesso = _numeroProcessoController.text;
    final resultado = await _controller.cadastrarProcesso(numeroProcesso);

    setState(() {
      _mensagem = resultado;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Processo'),
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
              onPressed: _cadastrarProcesso,
              child: const Text('Cadastrar Processo'),
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
