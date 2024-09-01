import 'package:flutter_test/flutter_test.dart';
import 'package:bdd_widget_test/bdd_widget_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/main.dart';  // Certifique-se de que o caminho esteja correto

void main() {
  bddWidgetTest('Testando fluxo principal',
      (WidgetTester tester) async {
    await tester.pumpWidget(ProviderScope(child: MyApp()));

    // Navegar até a tela de cadastro
    await tester.tap(find.text('Cadastro de Processo'));
    await tester.pumpAndSettle();

    // Cadastrar um processo
    await tester.enterText(find.byType(TextField), '12345');
    await tester.tap(find.text('Cadastrar'));
    await tester.pumpAndSettle();

    // Voltar para a tela inicial
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();

    // Navegar até a tela de consulta
    await tester.tap(find.text('Consulta de Processos'));
    await tester.pumpAndSettle();

    // Consultar o processo
    await tester.enterText(find.byType(TextField), '12345');
    await tester.tap(find.text('Consultar'));
    await tester.pumpAndSettle();

    // Verificar o status do processo
    expect(find.text('Status: Aberto'), findsOneWidget);

    // Navegar até a tela de avaliação
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Avaliação de Processo'));
    await tester.pumpAndSettle();

    // Atualizar o status do processo
    await tester.enterText(find.byType(TextField), '12345');
    await tester.tap(find.text('Buscar Processo'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Deferido'));
    await tester.pumpAndSettle();

    // Verificar o novo status
    expect(find.text('Status: Deferido'), findsOneWidget);
  });
}
