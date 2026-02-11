import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glow_and_shine/main.dart';

void main() {
  setUp(() {
    // Disable animations in tests to prevent pending timer issues
    Animate.restartOnHotReload = false;
  });

  testWidgets('App renders smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const GlowAndShineApp());
    await tester.pumpAndSettle(const Duration(seconds: 5));
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
