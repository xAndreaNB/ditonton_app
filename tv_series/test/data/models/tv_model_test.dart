import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/tv_series/dummy_objects_tvs.dart';

void main() {
  test('should be a subclass of TV entity', () async {
    final result = testTVModel.toEntity();
    expect(result, testTV);
  });
}
