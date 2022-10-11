//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class EventReportResponse {
  /// Returns a new [EventReportResponse] instance.
  EventReportResponse({
    this.eventId,
    this.eventType,
  });

  String eventId;

  String eventType;

  @override
  bool operator ==(Object other) => identical(this, other) || other is EventReportResponse &&
     other.eventId == eventId &&
     other.eventType == eventType;

  @override
  int get hashCode =>
  // ignore: unnecessary_parenthesis
    (eventId == null ? 0 : eventId.hashCode) +
    (eventType == null ? 0 : eventType.hashCode);

  @override
  String toString() => 'EventReportResponse[eventId=$eventId, eventType=$eventType]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (eventId != null) {
      json[r'eventId'] = eventId;
    }
    if (eventType != null) {
      json[r'eventType'] = eventType;
    }
    return json;
  }

  /// Returns a new [EventReportResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static EventReportResponse fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();
      return EventReportResponse(
        eventId: mapValueOfType<String>(json, r'eventId'),
        eventType: mapValueOfType<String>(json, r'eventType'),
      );
    }
    return null;
  }

  static List<EventReportResponse> listFromJson(dynamic json, {bool emptyIsNull, bool growable,}) =>
    json is List && json.isNotEmpty
      ? json.map(EventReportResponse.fromJson).toList(growable: true == growable)
      : true == emptyIsNull ? null : <EventReportResponse>[];

  static Map<String, EventReportResponse> mapFromJson(dynamic json) {
    final map = <String, EventReportResponse>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) => map[key] = EventReportResponse.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of EventReportResponse-objects as value to a dart map
  static Map<String, List<EventReportResponse>> mapListFromJson(dynamic json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<EventReportResponse>>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) {
          map[key] = EventReportResponse.listFromJson(
            value,
            emptyIsNull: emptyIsNull,
            growable: growable,
          );
        });
    }
    return map;
  }
}

