import 'package:postgres/postgres.dart';

class Repository {
  final PostgreSQLConnection _connection;

  Repository()
      : _connection = PostgreSQLConnection(
          'localhost', // Host
          5432, // Porta padrão do PostgreSQL
          'meu_banco_de_dados', // Nome do banco de dados
          username: 'postgres', // Usuário do PostgreSQL
          password: 'postgres', // Senha do PostgreSQL
        );

  Future<void> openConnection() async {
    await _connection.open();
  }

  Future<void> closeConnection() async {
    await _connection.close();
  }

  Future<Processo?> fetchProcess(String numeroProcesso) async {
    List<List<dynamic>> results = await _connection.query(
      'SELECT numero_processo, status FROM processos WHERE numero_processo = @numero',
      substitutionValues: {
        'numero': numeroProcesso,
      },
    );

    if (results.isNotEmpty) {
      return Processo(numeroProcesso: results.first[0] as String, status: results.first[1] as String);
    } else {
      return null;
    }
  }

  Future<void> saveProcess(Processo processo) async {
    await _connection.query(
      'INSERT INTO processos (numero_processo, status) VALUES (@numero, @status)',
      substitutionValues: {
        'numero': processo.numeroProcesso,
        'status': processo.status,
      },
    );
  }

  Future<void> updateProcessStatus(String numeroProcesso, String status) async {
    await _connection.query(
      'UPDATE processos SET status = @status WHERE numero_processo = @numero',
      substitutionValues: {
        'numero': numeroProcesso,
        'status': status,
      },
    );
  }

  Future<bool> containsProcess(String numeroProcesso) async {
    List<List<dynamic>> results = await _connection.query(
      'SELECT 1 FROM processos WHERE numero_processo = @numero LIMIT 1',
      substitutionValues: {
        'numero': numeroProcesso,
      },
    );

    return results.isNotEmpty;
  }
}
