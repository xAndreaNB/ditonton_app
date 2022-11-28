library tv_series;

export 'data/models/tv_table.dart';
export 'data/models/tv_detail_model.dart';
export 'data/models/tv_model.dart';
export 'data/models/tv_response_model.dart';
export 'domain/entities/tv.dart';
export 'domain/entities/tv_detail.dart';

export 'data/datasources/tv_local_data_source.dart';
export 'data/datasources/tv_remote_data_source.dart';
export 'data/repositories/tv_repository_impl.dart';
export 'domain/repositories/tv_repository.dart';
export 'domain/usecases/get_on_the_air_tvs.dart';
export 'domain/usecases/get_popular_tvs.dart';
export 'domain/usecases/get_top_rated_tvs.dart';
export 'domain/usecases/get_tv_detail.dart';
export 'domain/usecases/get_tv_recommendations.dart';
export 'domain/usecases/get_watchlist_status_tv.dart';
export 'domain/usecases/get_watchlist_tvs.dart';
export 'domain/usecases/remove_watchlist_tv.dart';
export 'domain/usecases/save_watchlist_tv.dart';
export 'domain/usecases/search_tvs.dart';

export 'presentation/pages/home_tv_page.dart';
export 'presentation/pages/on_the_air_tvs_page.dart';
export 'presentation/pages/popular_tvs_page.dart';
export 'presentation/pages/search_tvs_page.dart';
export 'presentation/pages/top_rated_tvs_page.dart';
export 'presentation/pages/tv_detail_page.dart';
export 'presentation/pages/watchlist_tvs_page.dart';