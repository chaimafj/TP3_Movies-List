import 'package:flutter_test/flutter_test.dart';

import 'package:tp3/main.dart';

void main() {
  testWidgets('shows a list of popular series', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Popular TV Shows'), findsOneWidget);
    expect(find.text('Breaking Bad'), findsOneWidget);
    expect(find.text('Stranger Things'), findsOneWidget);
  });

  testWidgets('opens the details screen when a series is tapped', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Breaking Bad'));
    await tester.pumpAndSettle();

    expect(
      find.text('A chemistry teacher turned meth kingpin.'),
      findsOneWidget,
    );
  });
}
