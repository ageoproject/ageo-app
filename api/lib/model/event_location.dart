//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//


// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class EventLocation {
  /// Returns a new [EventLocation] instance.
  EventLocation({
    this.type = const EventLocationTypeEnum._('Point'),
    this.coordinates = const [],
  });

  EventLocationTypeEnum? type;

  List<num>? coordinates;

  @override
  bool operator ==(Object other) => identical(this, other) || other is EventLocation &&
     other.type == type &&
     other.coordinates == coordinates;

  @override
  int get hashCode =>
  // ignore: unnecessary_parenthesis
    (type == null ? 0 : type.hashCode) +
    (coordinates == null ? 0 : coordinates.hashCode);

  @override
  String toString() => 'EventLocation[type=$type, coordinates=$coordinates]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (type != null) {
      json[r'type'] = type;
    }
    if (coordinates != null) {
      json[r'coordinates'] = coordinates;
    }
    return json;
  }

  /// Returns a new [EventLocation] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static EventLocation? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();
      return EventLocation(
        type: EventLocationTypeEnum.fromJson(json[r'type']),
        coordinates: json[r'coordinates'] is List
          ? (json[r'coordinates'] as List).cast<num>()
          : null,
      );
    }
    return null;
  }

  static List<EventLocation?>? listFromJson(dynamic json, {bool? emptyIsNull, bool? growable,}) =>
    json is List && json.isNotEmpty
      ? json.map(EventLocation.fromJson).toList(growable: true == growable)
      : true == emptyIsNull ? null : <EventLocation>[];

  static Map<String, EventLocation?> mapFromJson(dynamic json) {
    final map = <String, EventLocation?>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) => map[key] = EventLocation.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of EventLocation-objects as value to a dart map
  static Map<String, List<EventLocation?>?> mapListFromJson(dynamic json, {bool? emptyIsNull, bool? growable,}) {
    final Map<String, List<EventLocation?>?> map = <String, List<EventLocation>?>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) {
          map[key] = EventLocation.listFromJson(
            value,
            emptyIsNull: emptyIsNull,
            growable: growable,
          );
        });
    }
    return map;
  }
}


class EventLocationTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const EventLocationTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const point = EventLocationTypeEnum._(r'Point');

  /// List of all possible values in this [enum][EventLocationTypeEnum].
  static const values = <EventLocationTypeEnum>[
    point,
  ];

  static EventLocationTypeEnum? fromJson(dynamic value) =>
    EventLocationTypeEnumTypeTransformer().decode(value);

  static List<EventLocationTypeEnum?>? listFromJson(dynamic json, {bool? emptyIsNull, bool? growable,}) =>
    json is List && json.isNotEmpty
      ? json.map(EventLocationTypeEnum.fromJson).toList(growable: true == growable)
      : true == emptyIsNull ? null : <EventLocationTypeEnum>[];
}

/// Transformation class that can [encode] an instance of [EventLocationTypeEnum] to String,
/// and [decode] dynamic data back to [EventLocationTypeEnum].
class EventLocationTypeEnumTypeTransformer {
  factory EventLocationTypeEnumTypeTransformer() => _instance ??= const EventLocationTypeEnumTypeTransformer._();

  const EventLocationTypeEnumTypeTransformer._();

  String encode(EventLocationTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a EventLocationTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  EventLocationTypeEnum? decode(dynamic data, {bool? allowNull}) {
    if (data != null) {
      switch (data.toString()) {
        case r'Point': return EventLocationTypeEnum.point;
        default:
          if (allowNull == false) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [EventLocationTypeEnumTypeTransformer] instance.
  static EventLocationTypeEnumTypeTransformer? _instance;
}


