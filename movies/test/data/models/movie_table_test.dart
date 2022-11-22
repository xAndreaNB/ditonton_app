import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/movies/dummy_objects_movies.dart';

void main() {
  test('should be convert toJson Movie Table', () async {
    final result = testMovieTable.toJson();
    expect(result, testMovieMap);
  });
}
