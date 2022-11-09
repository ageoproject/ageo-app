//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//


// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Event {
  /// Returns a new [Event] instance.
  Event({
    this.id,
    this.eventId,
    this.eventType,
    this.time,
    this.status = const EventStatusEnum._('PENDING'),
    this.image = const [],
    this.comment,
    this.location,
    this.city,
    this.state,
    this.country,
    this.sensorData,
    this.commonEventDetails = const [],
    this.customEventDetails = const [],
    this.verifyBy,
  });

  String? id;

  String? eventId;

  EventEventTypeEnum? eventType;

  String? time;

  EventStatusEnum? status;

  List<String>? image;

  String? comment;

  EventLocation? location;

  String? city;

  String? state;

  String? country;

  Object? sensorData;

  List<Object>? commonEventDetails;

  List<Object>? customEventDetails;

  User? verifyBy;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Event &&
     other.id == id &&
     other.eventId == eventId &&
     other.eventType == eventType &&
     other.time == time &&
     other.status == status &&
     other.image == image &&
     other.comment == comment &&
     other.location == location &&
     other.city == city &&
     other.state == state &&
     other.country == country &&
     other.sensorData == sensorData &&
     other.commonEventDetails == commonEventDetails &&
     other.customEventDetails == customEventDetails &&
     other.verifyBy == verifyBy;

  @override
  int get hashCode =>
  // ignore: unnecessary_parenthesis
    (id == null ? 0 : id.hashCode) +
    (eventId == null ? 0 : eventId.hashCode) +
    (eventType == null ? 0 : eventType.hashCode) +
    (time == null ? 0 : time.hashCode) +
    (status == null ? 0 : status.hashCode) +
    (image == null ? 0 : image.hashCode) +
    (comment == null ? 0 : comment.hashCode) +
    (location == null ? 0 : location.hashCode) +
    (city == null ? 0 : city.hashCode) +
    (state == null ? 0 : state.hashCode) +
    (country == null ? 0 : country.hashCode) +
    (sensorData == null ? 0 : sensorData.hashCode) +
    (commonEventDetails == null ? 0 : commonEventDetails.hashCode) +
    (customEventDetails == null ? 0 : customEventDetails.hashCode) +
    (verifyBy == null ? 0 : verifyBy.hashCode);

  @override
  String toString() => 'Event[id=$id, eventId=$eventId, eventType=$eventType, time=$time, status=$status, image=$image, comment=$comment, location=$location, city=$city, state=$state, country=$country, sensorData=$sensorData, commonEventDetails=$commonEventDetails, customEventDetails=$customEventDetails, verifyBy=$verifyBy]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'_id'] = id;
    }
    if (eventId != null) {
      json[r'eventId'] = eventId;
    }
    if (eventType != null) {
      json[r'eventType'] = eventType;
    }
    if (time != null) {
      json[r'time'] = time;
    }
    if (status != null) {
      json[r'status'] = status;
    }
    if (image != null) {
      json[r'image'] = image;
    }
    if (comment != null) {
      json[r'comment'] = comment;
    }
    if (location != null) {
      json[r'location'] = location;
    }
    if (city != null) {
      json[r'city'] = city;
    }
    if (state != null) {
      json[r'state'] = state;
    }
    if (country != null) {
      json[r'country'] = country;
    }
    if (sensorData != null) {
      json[r'sensorData'] = sensorData;
    }
    if (commonEventDetails != null) {
      json[r'commonEventDetails'] = commonEventDetails;
    }
    if (customEventDetails != null) {
      json[r'customEventDetails'] = customEventDetails;
    }
    if (verifyBy != null) {
      json[r'verifyBy'] = verifyBy;
    }
    return json;
  }

  /// Returns a new [Event] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Event? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();
      return Event(
        id: mapValueOfType<String>(json, r'_id'),
        eventId: mapValueOfType<String>(json, r'eventId'),
        eventType: EventEventTypeEnum.fromJson(json[r'eventType']),
        time: mapValueOfType<String>(json, r'time'),
        status: EventStatusEnum.fromJson(json[r'status']),
        image: json[r'image'] is List
          ? (json[r'image'] as List).cast<String>()
          : null,
        comment: mapValueOfType<String>(json, r'comment'),
        location: EventLocation.fromJson(json[r'location']),
        city: mapValueOfType<String>(json, r'city'),
        state: mapValueOfType<String>(json, r'state'),
        country: mapValueOfType<String>(json, r'country'),
        sensorData: mapValueOfType<Object>(json, r'sensorData'),
        commonEventDetails: json[r'commonEventDetails'] is List
            ? (json[r'commonEventDetails'] as List).cast<Object>()
            : null,
        customEventDetails: json[r'customEventDetails'] is List
            ? (json[r'customEventDetails'] as List).cast<Object>()
            : null,
        verifyBy: User.fromJson(json[r'verifyBy']),
      );
    }
    return null;
  }

  static List<Event?>? listFromJson(dynamic json, {bool? emptyIsNull, bool? growable,}) =>
    json is List && json.isNotEmpty
      ? json.map(Event.fromJson).toList(growable: true == growable)
      : true == emptyIsNull ? null : <Event>[];

  static Map<String, Event?> mapFromJson(dynamic json) {
    final map = <String, Event?>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) => map[key] = Event.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of Event-objects as value to a dart map
  static Map<String, List<Event?>?> mapListFromJson(dynamic json, {bool? emptyIsNull, bool? growable,}) {
    final Map<String, List<Event?>?> map = <String, List<Event>?>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) {
          map[key] = Event.listFromJson(
            value,
            emptyIsNull: emptyIsNull,
            growable: growable,
          );
        });
    }
    return map;
  }
}


class EventEventTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const EventEventTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const LANDSLIDE = EventEventTypeEnum._(r'LANDSLIDE');
  static const ROCKFALL = EventEventTypeEnum._(r'ROCKFALL');
  static const FLOODED = EventEventTypeEnum._(r'FLOODED');
  static const TSUNAMI = EventEventTypeEnum._(r'TSUNAMI');
  static const EARTHQUAKE = EventEventTypeEnum._(r'EARTHQUAKE');
  static const BUILDING_SETTLEMENT = EventEventTypeEnum._(r'BUILDING_SETTLEMENT');
  static const SINKHOLE = EventEventTypeEnum._(r'SINKHOLE');
  static const ERUPTION = EventEventTypeEnum._(r'ERUPTION');
  static const FOREST_FIRE = EventEventTypeEnum._(r'FOREST_FIRE');

  /// List of all possible values in this [enum][EventEventTypeEnum].
  static const values = <EventEventTypeEnum>[
    LANDSLIDE,
    ROCKFALL,
    FLOODED,
    TSUNAMI,
    EARTHQUAKE,
    BUILDING_SETTLEMENT,
    SINKHOLE,
    ERUPTION,
    FOREST_FIRE,
  ];

  static EventEventTypeEnum? fromJson(dynamic value) =>
    EventEventTypeEnumTypeTransformer().decode(value);

  static List<EventEventTypeEnum?>? listFromJson(dynamic json, {bool? emptyIsNull, bool? growable,}) =>
    json is List && json.isNotEmpty
      ? json.map(EventEventTypeEnum.fromJson).toList(growable: true == growable)
      : true == emptyIsNull ? null : <EventEventTypeEnum>[];
}

/// Transformation class that can [encode] an instance of [EventEventTypeEnum] to String,
/// and [decode] dynamic data back to [EventEventTypeEnum].
class EventEventTypeEnumTypeTransformer {
  factory EventEventTypeEnumTypeTransformer() => _instance ??= const EventEventTypeEnumTypeTransformer._();

  const EventEventTypeEnumTypeTransformer._();

  String encode(EventEventTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a EventEventTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  EventEventTypeEnum? decode(dynamic data, {bool? allowNull}) {
    if (data != null) {
      switch (data.toString()) {
        case r'LANDSLIDE': return EventEventTypeEnum.LANDSLIDE;
        case r'ROCKFALL': return EventEventTypeEnum.ROCKFALL;
        case r'FLOODED': return EventEventTypeEnum.FLOODED;
        case r'TSUNAMI': return EventEventTypeEnum.TSUNAMI;
        case r'EARTHQUAKE': return EventEventTypeEnum.EARTHQUAKE;
        case r'BUILDING_SETTLEMENT': return EventEventTypeEnum.BUILDING_SETTLEMENT;
        case r'SINKHOLE': return EventEventTypeEnum.SINKHOLE;
        case r'ERUPTION': return EventEventTypeEnum.ERUPTION;
        case r'FOREST_FIRE': return EventEventTypeEnum.FOREST_FIRE;
        default:
          if (allowNull == false) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [EventEventTypeEnumTypeTransformer] instance.
  static EventEventTypeEnumTypeTransformer? _instance;
}



class EventStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const EventStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const PENDING = EventStatusEnum._(r'PENDING');
  static const APPROVED = EventStatusEnum._(r'APPROVED');
  static const REJECTED = EventStatusEnum._(r'REJECTED');
  static const ARCHIVED = EventStatusEnum._(r'ARCHIVED');

  /// List of all possible values in this [enum][EventStatusEnum].
  static const values = <EventStatusEnum>[
    PENDING,
    APPROVED,
    REJECTED,
    ARCHIVED,
  ];

  static EventStatusEnum? fromJson(dynamic value) =>
    EventStatusEnumTypeTransformer().decode(value);

  static List<EventStatusEnum?>? listFromJson(dynamic json, {bool? emptyIsNull, bool? growable,}) =>
    json is List && json.isNotEmpty
      ? json.map(EventStatusEnum.fromJson).toList(growable: true == growable)
      : true == emptyIsNull ? null : <EventStatusEnum>[];
}

/// Transformation class that can [encode] an instance of [EventStatusEnum] to String,
/// and [decode] dynamic data back to [EventStatusEnum].
class EventStatusEnumTypeTransformer {
  factory EventStatusEnumTypeTransformer() => _instance ??= const EventStatusEnumTypeTransformer._();

  const EventStatusEnumTypeTransformer._();

  String encode(EventStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a EventStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  EventStatusEnum? decode(dynamic data, {bool? allowNull}) {
    if (data != null) {
      switch (data.toString()) {
        case r'PENDING': return EventStatusEnum.PENDING;
        case r'APPROVED': return EventStatusEnum.APPROVED;
        case r'REJECTED': return EventStatusEnum.REJECTED;
        case r'ARCHIVED': return EventStatusEnum.ARCHIVED;
        default:
          if (allowNull == false) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [EventStatusEnumTypeTransformer] instance.
  static EventStatusEnumTypeTransformer? _instance;
}


