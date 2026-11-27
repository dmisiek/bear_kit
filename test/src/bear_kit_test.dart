// Not required for test files
// ignore_for_file: prefer_const_constructors

import 'package:bear_kit/bear_kit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BearKit', () {
    test('can be instantiated', () {
      expect(BearKit(), isNotNull);
    });
  });
}
