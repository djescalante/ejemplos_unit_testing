import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:testing_controllers/ui/controllers/name_controller.dart';
import 'package:testing_controllers/ui/hello.dart';

void main() {
  setUp(() {});
  testWidgets('Simple hello test', (WidgetTester tester) async {
    Get.put(NameController());
    await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
      body: Hello(),
    )));

    await tester.pump();

    expect(find.text('Testing demo'), findsOneWidget);

    expect(find.text('Hello N/A'), findsOneWidget);

    await tester.enterText(find.byKey(const Key('TextFieldName')), 'Juan');

    await tester.tap(find.byKey(const Key('ButtonSetName')));

    await tester.pump();

    expect(find.text('Hello Juan'), findsOneWidget);

    expect(find.text('Hello N/A'), findsNothing);

    expect(find.text('Testing demo'), findsOneWidget);
  });
}
