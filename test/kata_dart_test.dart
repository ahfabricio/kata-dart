import 'package:server/kata_dart.dart';
import 'package:test/test.dart';

void main() {
  test('calculate', () {
    expect(calculate(), 42);
  });
  test('calculate failed', () {
    expect(calculate(), isNot(24));
  });
}
