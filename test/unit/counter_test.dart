import 'package:flutter_test/flutter_test.dart';
import 'package:counter_app/domain/counter.dart';

void main() {
  group('Counter test', () {
    test('value should start at 0', () {
      expect(Counter().value, 0);
    });

    test('value should be incremented', () {
      final counter = Counter();

      counter.increment();

      expect(counter.value, 1);

    });

    test('value should be decremented', () {
      final counter = Counter();

      counter.decrement();

      expect(counter.value, -1);
    });

    test('getting props', () {
      final counter = Counter();

      expect(counter.props, [0]);
    });
  });
}