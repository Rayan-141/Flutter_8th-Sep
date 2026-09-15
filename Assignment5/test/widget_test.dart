import 'package:flutter_test/flutter_test.dart';
import 'package:assignment5/main.dart';

void main() {
  testWidgets('MCQ portal app loads with expected title and sections', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('MCQ Exam Portal'), findsOneWidget);
    expect(find.text('Assignment Overview'), findsOneWidget);
    expect(find.text('Learning Objectives'), findsOneWidget);
    expect(find.text('System Architecture'), findsOneWidget);
  });
}
