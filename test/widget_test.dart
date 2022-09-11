import 'package:ditonton_flutter/injection.dart';
import 'package:ditonton_flutter/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupDependencyInjection() async {
  await init();
}

void main() {
  setUpAll(() {
    setupDependencyInjection();
  });

  testWidgets('MyApp has title \'Movies\' when first opened', (tester) async {
    await tester.pumpWidget(MyApp());
    final titleFinder = find.text('Movies');
    expect(titleFinder, findsOneWidget);
  });
}
