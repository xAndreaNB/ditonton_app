import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/movies/dummy_objects_movies.dart';

void main() {
  test('should be a subclass of Movie entity', () async {
    final result = testMovieModel.toEntity();
    expect(result, testMovie);
  });
}
