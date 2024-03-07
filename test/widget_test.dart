import 'package:flutter_test/flutter_test.dart';

import 'package:quick_pay/main.dart';

void main() {
  testWidgets('Test <Main />', (WidgetTester tester) async {
    await tester.pumpWidget(const QuickPayApp());
  });
}
