// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchModel _$SearchModelFromJson(Map<String, dynamic> json) => SearchModel(
      total: json['total'] as int?,
      totalHits: json['totalHits'] as int?,
      hits: (json['hits'] as List<dynamic>?)
          ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchModelToJson(SearchModel instance) =>
    <String, dynamic>{
      'total': instance.total,
      'totalHits': instance.totalHits,
      'hits': instance.hits,
    };

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => ImageModel(
      id: json['id'] as int?,
      largeImageURL: json['largeImageURL'] as String?,
      previewURL: json['previewURL'] as String?,
      webFormatURL: json['webformatURL'] as String?,
      imageSize: json['imageSize'] as int?,
      user: json['user'] as String?,
    );

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'largeImageURL': instance.largeImageURL,
      'previewURL': instance.previewURL,
      'webformatURL': instance.webFormatURL,
      'imageSize': instance.imageSize,
      'user': instance.user,
    };
