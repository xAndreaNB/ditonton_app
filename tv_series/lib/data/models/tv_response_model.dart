import 'package:equatable/equatable.dart';
import 'package:tv_series/data/models/tv_model.dart';

class TVResponseModel extends Equatable {
  final List<TVModel> tvList;

  const TVResponseModel({required this.tvList});

  factory TVResponseModel.fromJson(Map<String, dynamic> json) =>
      TVResponseModel(
        tvList: List<TVModel>.from((json["results"] as List)
            .map((x) => TVModel.fromJson(x))
            .where((element) => element.posterPath != null)),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(tvList.map((x) => x.toJson())),
      };

  @override
  List<Object> get props => [tvList];
}
