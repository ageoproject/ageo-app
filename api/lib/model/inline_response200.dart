//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//


// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class InlineResponse200 {
  /// Returns a new [InlineResponse200] instance.
  InlineResponse200({
    this.draw,
    this.data = const [],
    this.recordsFiltered,
    this.recordsTotal,
    this.error,
  });

  Object? draw;

  List<Event?>? data;

  num? recordsFiltered;

  num? recordsTotal;

  String? error;

  @override
  bool operator ==(Object other) => identical(this, other) || other is InlineResponse200 &&
     other.draw == draw &&
     other.data == data &&
     other.recordsFiltered == recordsFiltered &&
     other.recordsTotal == recordsTotal &&
     other.error == error;

  @override
  int get hashCode =>
  // ignore: unnecessary_parenthesis
    (draw == null ? 0 : draw.hashCode) +
    (data == null ? 0 : data.hashCode) +
    (recordsFiltered == null ? 0 : recordsFiltered.hashCode) +
    (recordsTotal == null ? 0 : recordsTotal.hashCode) +
    (error == null ? 0 : error.hashCode);

  @override
  String toString() => 'InlineResponse200[draw=$draw, data=$data, recordsFiltered=$recordsFiltered, recordsTotal=$recordsTotal, error=$error]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (draw != null) {
      json[r'draw'] = draw;
    }
    if (data != null) {
      json[r'data'] = data;
    }
    if (recordsFiltered != null) {
      json[r'recordsFiltered'] = recordsFiltered;
    }
    if (recordsTotal != null) {
      json[r'recordsTotal'] = recordsTotal;
    }
    if (error != null) {
      json[r'error'] = error;
    }
    return json;
  }

  /// Returns a new [InlineResponse200] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static InlineResponse200? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();
      return InlineResponse200(
        draw: mapValueOfType<Object>(json, r'draw'),
        data: Event.listFromJson(json[r'data']),
        recordsFiltered: json[r'recordsFiltered'] == null
          ? null
          : num.parse(json[r'recordsFiltered'].toString()),
        recordsTotal: json[r'recordsTotal'] == null
          ? null
          : num.parse(json[r'recordsTotal'].toString()),
        error: mapValueOfType<String>(json, r'error'),
      );
    }
    return null;
  }

  static List<InlineResponse200?>? listFromJson(dynamic json, {bool? emptyIsNull, bool? growable,}) =>
    json is List && json.isNotEmpty
      ? json.map(InlineResponse200.fromJson).toList(growable: true == growable)
      : true == emptyIsNull ? null : <InlineResponse200>[];

  static Map<String, InlineResponse200?> mapFromJson(dynamic json) {
    final map = <String, InlineResponse200?>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) => map[key] = InlineResponse200.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of InlineResponse200-objects as value to a dart map
  static Map<String, List<InlineResponse200?>?> mapListFromJson(dynamic json, {bool? emptyIsNull, bool? growable,}) {
    final Map<String, List<InlineResponse200?>?> map = <String, List<InlineResponse200>?>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) {
          map[key] = InlineResponse200.listFromJson(
            value,
            emptyIsNull: emptyIsNull,
            growable: growable,
          );
        });
    }
    return map;
  }
}

