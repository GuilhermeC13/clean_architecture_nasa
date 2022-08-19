import 'package:clean_architecture_nasa/features/domain/entities/space_media_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'space_media_model.g.dart';

@JsonSerializable()
class SpaceMediaModel extends SpaceMediaEntity {
  final String explanation;
  final String media_type;
  final String title;
  final String url;

  const SpaceMediaModel(
      {required this.explanation,
      required this.media_type,
      required this.title,
      required this.url})
      : super(
          description: explanation,
          mediaType: media_type,
          title: title,
          mediaUrl: url,
        );

  factory SpaceMediaModel.fromJson(Map<String, dynamic> json) =>
      _$SpaceMediaModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpaceMediaModelToJson(this);
}
