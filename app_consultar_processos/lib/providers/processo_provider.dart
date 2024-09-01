import flutter_riverpod
import flutter
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/processo_controller.dart';
import '../repositories/processo_repository.dart';
import '../services/processo_service.dart';

final processoRepositoryProvider = Provider<ProcessoRepository>((ref) {
  final repository = ProcessoRepository();
  repository.initialize();
  return repository;
});

final processoServiceProvider = Provider<ProcessoService>((ref) {
  final repository = ref.read(processoRepositoryProvider);
  return ProcessoService(repository);
});

final processoControllerProvider =
    StateNotifierProvider<ProcessoController, AsyncValue<Processo?>>((ref) {
  final service = ref.read(processoServiceProvider);
  return ProcessoController(service);
});
