import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/src/app.dart';
import 'package:shadcn_ui/src/components/toggle.dart';

import '../../extra/pump_async_widget.dart';

void main() {
  Widget createTestWidget(Widget child) {
    return ShadApp(home: Scaffold(body: child));
  }

  group('ShadToggle', () {
    testWidgets('matches golden with icon only', (tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadToggle(
            icon: Icon(Icons.star),
          ),
        ),
      );
      await expectLater(
        find.byType(ShadToggle),
        matchesGoldenFile('goldens/toggle_icon_only.png'),
      );
    });

    testWidgets('matches golden with icon and child', (tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadToggle(
            icon: Icon(Icons.star),
            child: Text('Toggle me'),
          ),
        ),
      );
      await expectLater(
        find.byType(ShadToggle),
        matchesGoldenFile('goldens/toggle_icon_and_child.png'),
      );
    });

    testWidgets('matches golden when pressed (uncontrolled)', (tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          ShadToggle(
            icon: const Icon(Icons.toggle_on),
            onPressedChange: (_) {},
          ),
        ),
      );
      await tester.tap(find.byType(ShadToggle));
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(ShadToggle),
        matchesGoldenFile('goldens/toggle_pressed.png'),
      );
    });

    testWidgets('matches golden in controlled pressed state', (tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadToggle(
            icon: Icon(Icons.toggle_on),
            pressed: true,
          ),
        ),
      );
      await expectLater(
        find.byType(ShadToggle),
        matchesGoldenFile('goldens/toggle_controlled_pressed.png'),
      );
    });

    testWidgets('matches golden when disabled', (tester) async {
      await tester.pumpAsyncWidget(
        createTestWidget(
          const ShadToggle(
            icon: Icon(Icons.block),
            enabled: false,
          ),
        ),
      );
      await expectLater(
        find.byType(ShadToggle),
        matchesGoldenFile('goldens/toggle_disabled.png'),
      );
    });
  });
}
