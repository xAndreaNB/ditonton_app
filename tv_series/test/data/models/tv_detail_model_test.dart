import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/tv_series/dummy_objects_tvs.dart';

void main() {
  test('should be convert toJson TV Detail Model', () async {
    final result = testTVDetailResponse.toJson();
    expect(result, testTVDetailResponseJson);
  });
}
