import 'package:flutter_test/flutter_test.dart';
import 'package:oneview_world/main.dart';

void main() {
  testWidgets('OneView app renders', (WidgetTester tester) async {
    await tester.pumpWidget(const OneViewApp());
    expect(find.text('OneView'), findsWidgets);
  });
}
