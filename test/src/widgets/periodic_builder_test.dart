import 'package:bear_kit/bear_kit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PeriodicBuilder', () {
    const second = Duration(seconds: 1);

    Widget periodicBuilder(Duration duration, void Function() onBuild) {
      return PeriodicBuilder(
        duration: duration,
        builder: (_) {
          onBuild();
          return const SizedBox();
        },
      );
    }

    testWidgets('rebuilds after each duration', (tester) async {
      var builds = 0;
      await tester.pumpWidget(periodicBuilder(second, () => builds++));
      expect(builds, 1);

      await tester.pump(second);
      expect(builds, 2);

      await tester.pump(second * 2);
      expect(builds, 3);

      await tester.pump(second);
      expect(builds, 4);
    });

    testWidgets('does not rebuild before duration elapses', (tester) async {
      var builds = 0;
      await tester.pumpWidget(periodicBuilder(second, () => builds++));

      await tester.pump(const Duration(milliseconds: 999));
      expect(builds, 1);
    });

    testWidgets('restarts timer when duration changes', (tester) async {
      var builds = 0;
      await tester.pumpWidget(periodicBuilder(second, () => builds++));
      await tester.pumpWidget(periodicBuilder(second * 5, () => builds++));
      expect(builds, 2);

      await tester.pump(second * 4);
      expect(builds, 2);

      await tester.pump(second);
      expect(builds, 3);
    });

    testWidgets('cancels timer on dispose', (tester) async {
      await tester.pumpWidget(periodicBuilder(second, () {}));
      await tester.pumpWidget(const SizedBox());

      // flutter_test fails the test if a Timer is still pending here.
      await tester.pump(second);
    });
  });
}
