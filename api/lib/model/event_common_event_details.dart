//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//


// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class EventCommonEventDetails {
  /// Returns a new [EventCommonEventDetails] instance.
  EventCommonEventDetails({
    this.question,
    this.answer,
  });

  String? question;

  String? answer;

  @override
  bool operator ==(Object other) => identical(this, other) || other is EventCommonEventDetails &&
     other.question == question &&
     other.answer == answer;

  @override
  int get hashCode =>
  // ignore: unnecessary_parenthesis
    (question == null ? 0 : question.hashCode) +
    (answer == null ? 0 : answer.hashCode);

  @override
  String toString() => 'EventCommonEventDetails[question=$question, answer=$answer]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (question != null) {
      json[r'question'] = question;
    }
    if (answer != null) {
      json[r'answer'] = answer;
    }
    return json;
  }

  /// Returns a new [EventCommonEventDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static EventCommonEventDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();
      return EventCommonEventDetails(
        question: mapValueOfType<String>(json, r'question'),
        answer: mapValueOfType<String>(json, r'answer'),
      );
    }
    return null;
  }

  static List<EventCommonEventDetails?>? listFromJson(dynamic json, {bool? emptyIsNull, bool? growable,}) =>
    json is List && json.isNotEmpty
      ? json.map(EventCommonEventDetails.fromJson).toList(growable: true == growable)
      : true == emptyIsNull ? null : <EventCommonEventDetails>[];

  static Map<String, EventCommonEventDetails?> mapFromJson(dynamic json) {
    final map = <String, EventCommonEventDetails?>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) => map[key] = EventCommonEventDetails.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of EventCommonEventDetails-objects as value to a dart map
  static Map<String, List<EventCommonEventDetails?>?> mapListFromJson(dynamic json, {bool? emptyIsNull, bool? growable,}) {
    final Map<String, List<EventCommonEventDetails?>?> map = <String, List<EventCommonEventDetails>?>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) {
          map[key] = EventCommonEventDetails.listFromJson(
            value,
            emptyIsNull: emptyIsNull,
            growable: growable,
          );
        });
    }
    return map;
  }
}

