import 'package:json_annotation/json_annotation.dart';

part 'search_model.g.dart';

@JsonSerializable()
class SearchModel {
  final int? total;
  final int? totalHits;
  final List<ImageModel>? hits;

  const SearchModel({
    this.total,
    this.totalHits,
    this.hits,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      _$SearchModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchModelToJson(this);
}

@JsonSerializable()
class ImageModel {
  final int? id;
  final String? largeImageURL;
  final String? previewURL;
  @JsonKey(name: 'webformatURL')
  final String? webFormatURL;
  final int? imageSize;
  final String? user;

  const ImageModel({
    this.id,
    this.largeImageURL,
    this.previewURL,
    this.webFormatURL,
    this.imageSize,
    this.user,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}
