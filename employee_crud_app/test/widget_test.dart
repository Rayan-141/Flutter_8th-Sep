import 'package:employee_crud_app/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MyApp loads the Employee list screen', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Employee List Screen'), findsOneWidget);
  });
}
