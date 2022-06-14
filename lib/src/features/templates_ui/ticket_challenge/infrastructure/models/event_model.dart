import 'package:test_template/src/features/templates_ui/ticket_challenge/domain/entities/event_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_model.g.dart';

@JsonSerializable(explicitToJson: true)
class EventModel extends EventEntity {
  const EventModel({
    required EventID id,
    required String link,
    required String title,
    required String date,
    required String location,
  }) : super(id: id, link: link, title: title, date: date, location: location);

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventModelToJson(this);
}
