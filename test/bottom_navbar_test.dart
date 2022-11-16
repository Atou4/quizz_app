import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quizz_app/views/client/bottomnav_bar.dart';

void main() {
  testWidgets('botnavbar page is created', (WidgetTester tester) async {
    final testWidget = MaterialApp(
      home: Botnavbar(),
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();
  });
/*
  testWidgets('home page contains hello world text',
      (WidgetTester tester) async {
    final testWidget = MaterialApp(
      home: HomePage(),
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    expect(find.text('Hello World!'), findsOneWidget);
  });

  testWidgets('home page contains button', (WidgetTester tester) async {
    final testWidget = MaterialApp(
      home: HomePage(),
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    final buttonMaterial = find.descendant(
      of: find.byType(ElevatedButton),
      matching: find.byType(Material),
    );

    final materialButton = tester.widget<Material>(buttonMaterial);

    expect(materialButton.color, Colors.blue);
    expect(find.text('Weather today'), findsOneWidget);
    expect(find.byKey(Key('icon_weather')), findsOneWidget);
  });

  testWidgets('notify when button is pressed', (WidgetTester tester) async {
    var pressed = false;
    final testWidget = MaterialApp(
      home: HomePage(
        onPressed: () => pressed = true,
      ),
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(pressed, isTrue);
  });*/
}