//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateEventRequest {
  /// Returns a new [UpdateEventRequest] instance.
  UpdateEventRequest({
    this.eventId,
    this.eventStatus,
  });

  String eventId;

  UpdateEventRequestEventStatusEnum eventStatus;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UpdateEventRequest &&
     other.eventId == eventId &&
     other.eventStatus == eventStatus;

  @override
  int get hashCode =>
  // ignore: unnecessary_parenthesis
    (eventId == null ? 0 : eventId.hashCode) +
    (eventStatus == null ? 0 : eventStatus.hashCode);

  @override
  String toString() => 'UpdateEventRequest[eventId=$eventId, eventStatus=$eventStatus]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (eventId != null) {
      json[r'eventId'] = eventId;
    }
    if (eventStatus != null) {
      json[r'eventStatus'] = eventStatus;
    }
    return json;
  }

  /// Returns a new [UpdateEventRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateEventRequest fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();
      return UpdateEventRequest(
        eventId: mapValueOfType<String>(json, r'eventId'),
        eventStatus: UpdateEventRequestEventStatusEnum.fromJson(json[r'eventStatus']),
      );
    }
    return null;
  }

  static List<UpdateEventRequest> listFromJson(dynamic json, {bool emptyIsNull, bool growable,}) =>
    json is List && json.isNotEmpty
      ? json.map(UpdateEventRequest.fromJson).toList(growable: true == growable)
      : true == emptyIsNull ? null : <UpdateEventRequest>[];

  static Map<String, UpdateEventRequest> mapFromJson(dynamic json) {
    final map = <String, UpdateEventRequest>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) => map[key] = UpdateEventRequest.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of UpdateEventRequest-objects as value to a dart map
  static Map<String, List<UpdateEventRequest>> mapListFromJson(dynamic json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<UpdateEventRequest>>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) {
          map[key] = UpdateEventRequest.listFromJson(
            value,
            emptyIsNull: emptyIsNull,
            growable: growable,
          );
        });
    }
    return map;
  }
}


class UpdateEventRequestEventStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const UpdateEventRequestEventStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value ?? '';

  String toJson() => value;

  static const PENDING = UpdateEventRequestEventStatusEnum._(r'PENDING');
  static const APPROVED = UpdateEventRequestEventStatusEnum._(r'APPROVED');
  static const REJECTED = UpdateEventRequestEventStatusEnum._(r'REJECTED');
  static const ARCHIVED = UpdateEventRequestEventStatusEnum._(r'ARCHIVED');

  /// List of all possible values in this [enum][UpdateEventRequestEventStatusEnum].
  static const values = <UpdateEventRequestEventStatusEnum>[
    PENDING,
    APPROVED,
    REJECTED,
    ARCHIVED,
  ];

  static UpdateEventRequestEventStatusEnum fromJson(dynamic value) =>
    UpdateEventRequestEventStatusEnumTypeTransformer().decode(value);

  static List<UpdateEventRequestEventStatusEnum> listFromJson(dynamic json, {bool emptyIsNull, bool growable,}) =>
    json is List && json.isNotEmpty
      ? json.map(UpdateEventRequestEventStatusEnum.fromJson).toList(growable: true == growable)
      : true == emptyIsNull ? null : <UpdateEventRequestEventStatusEnum>[];
}

/// Transformation class that can [encode] an instance of [UpdateEventRequestEventStatusEnum] to String,
/// and [decode] dynamic data back to [UpdateEventRequestEventStatusEnum].
class UpdateEventRequestEventStatusEnumTypeTransformer {
  factory UpdateEventRequestEventStatusEnumTypeTransformer() => _instance ??= const UpdateEventRequestEventStatusEnumTypeTransformer._();

  const UpdateEventRequestEventStatusEnumTypeTransformer._();

  String encode(UpdateEventRequestEventStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a UpdateEventRequestEventStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  UpdateEventRequestEventStatusEnum decode(dynamic data, {bool allowNull}) {
    if (data != null) {
      switch (data.toString()) {
        case r'PENDING': return UpdateEventRequestEventStatusEnum.PENDING;
        case r'APPROVED': return UpdateEventRequestEventStatusEnum.APPROVED;
        case r'REJECTED': return UpdateEventRequestEventStatusEnum.REJECTED;
        case r'ARCHIVED': return UpdateEventRequestEventStatusEnum.ARCHIVED;
        default:
          if (allowNull == false) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [UpdateEventRequestEventStatusEnumTypeTransformer] instance.
  static UpdateEventRequestEventStatusEnumTypeTransformer _instance;
}


