import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/tv_series/dummy_objects_tvs.dart';

void main() {
  test('should be convert toJson TV Table', () async {
    final result = testTVTable.toJson();
    expect(result, testTVMap);
  });
}
