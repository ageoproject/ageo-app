//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//


// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class InlineObject6 {
  /// Returns a new [InlineObject6] instance.
  InlineObject6({
    this.downloadType,
    this.eventType,
    this.eventStatus,
    this.fromDate,
    this.toDate,
    this.eventIdList = const [],
    this.polygon = const [],
  });

  String? downloadType;

  String? eventType;

  String? eventStatus;

  num? fromDate;

  num? toDate;

  List<String>? eventIdList;

  List<List<num>?>? polygon;

  @override
  bool operator ==(Object other) => identical(this, other) || other is InlineObject6 &&
     other.downloadType == downloadType &&
     other.eventType == eventType &&
     other.eventStatus == eventStatus &&
     other.fromDate == fromDate &&
     other.toDate == toDate &&
     other.eventIdList == eventIdList &&
     other.polygon == polygon;

  @override
  int get hashCode =>
  // ignore: unnecessary_parenthesis
    (downloadType == null ? 0 : downloadType.hashCode) +
    (eventType == null ? 0 : eventType.hashCode) +
    (eventStatus == null ? 0 : eventStatus.hashCode) +
    (fromDate == null ? 0 : fromDate.hashCode) +
    (toDate == null ? 0 : toDate.hashCode) +
    (eventIdList == null ? 0 : eventIdList.hashCode) +
    (polygon == null ? 0 : polygon.hashCode);

  @override
  String toString() => 'InlineObject6[downloadType=$downloadType, eventType=$eventType, eventStatus=$eventStatus, fromDate=$fromDate, toDate=$toDate, eventIdList=$eventIdList, polygon=$polygon]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (downloadType != null) {
      json[r'downloadType'] = downloadType;
    }
    if (eventType != null) {
      json[r'eventType'] = eventType;
    }
    if (eventStatus != null) {
      json[r'eventStatus'] = eventStatus;
    }
    if (fromDate != null) {
      json[r'fromDate'] = fromDate;
    }
    if (toDate != null) {
      json[r'toDate'] = toDate;
    }
    if (eventIdList != null) {
      json[r'eventIdList'] = eventIdList;
    }
    if (polygon != null) {
      json[r'polygon'] = polygon;
    }
    return json;
  }

  /// Returns a new [InlineObject6] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static InlineObject6? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();
      return InlineObject6(
        downloadType: mapValueOfType<String>(json, r'downloadType'),
        eventType: mapValueOfType<String>(json, r'eventType'),
        eventStatus: mapValueOfType<String>(json, r'eventStatus'),
        fromDate: json[r'fromDate'] == null
          ? null
          : num.parse(json[r'fromDate'].toString()),
        toDate: json[r'toDate'] == null
          ? null
          : num.parse(json[r'toDate'].toString()),
        eventIdList: json[r'eventIdList'] is List
          ? (json[r'eventIdList'] as List).cast<String>()
          : null,
        polygon: json[r'polygon'] is List
          ? (json[r'polygon'] as List).map(
              (e) => e == null ? null : (e as List).cast<num>()
            ).toList(growable: false)
          : null,
      );
    }
    return null;
  }

  static List<InlineObject6?>? listFromJson(dynamic json, {bool? emptyIsNull, bool? growable,}) =>
    json is List && json.isNotEmpty
      ? json.map(InlineObject6.fromJson).toList(growable: true == growable)
      : true == emptyIsNull ? null : <InlineObject6>[];

  static Map<String, InlineObject6?> mapFromJson(dynamic json) {
    final map = <String, InlineObject6?>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) => map[key] = InlineObject6.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of InlineObject6-objects as value to a dart map
  static Map<String, List<InlineObject6?>?> mapListFromJson(dynamic json, {bool? emptyIsNull, bool? growable,}) {
    final Map<String, List<InlineObject6?>?> map = <String, List<InlineObject6>?>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) {
          map[key] = InlineObject6.listFromJson(
            value,
            emptyIsNull: emptyIsNull,
            growable: growable,
          );
        });
    }
    return map;
  }
}

