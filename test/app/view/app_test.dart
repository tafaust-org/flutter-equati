import 'package:flutter_test/flutter_test.dart';

import 'package:equati/app/app.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(App());
    });
  });
}
