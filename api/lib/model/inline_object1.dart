//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//


// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class InlineObject1 {
  /// Returns a new [InlineObject1] instance.
  InlineObject1({
    this.status,
  });

  String? status;

  @override
  bool operator ==(Object other) => identical(this, other) || other is InlineObject1 &&
     other.status == status;

  @override
  int get hashCode =>
  // ignore: unnecessary_parenthesis
    (status == null ? 0 : status.hashCode);

  @override
  String toString() => 'InlineObject1[status=$status]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (status != null) {
      json[r'status'] = status;
    }
    return json;
  }

  /// Returns a new [InlineObject1] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static InlineObject1? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();
      return InlineObject1(
        status: mapValueOfType<String>(json, r'status'),
      );
    }
    return null;
  }

  static List<InlineObject1?>? listFromJson(dynamic json, {bool? emptyIsNull, bool? growable,}) =>
    json is List && json.isNotEmpty
      ? json.map(InlineObject1.fromJson).toList(growable: true == growable)
      : true == emptyIsNull ? null : <InlineObject1>[];

  static Map<String, InlineObject1?> mapFromJson(dynamic json) {
    final map = <String, InlineObject1?>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) => map[key] = InlineObject1.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of InlineObject1-objects as value to a dart map
  static Map<String, List<InlineObject1?>?> mapListFromJson(dynamic json, {bool? emptyIsNull, bool? growable,}) {
    final Map<String, List<InlineObject1?>?> map = <String, List<InlineObject1>?>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) {
          map[key] = InlineObject1.listFromJson(
            value,
            emptyIsNull: emptyIsNull,
            growable: growable,
          );
        });
    }
    return map;
  }
}

