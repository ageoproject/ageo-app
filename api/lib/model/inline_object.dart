//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//


// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class InlineObject {
  /// Returns a new [InlineObject] instance.
  InlineObject({
    this.prefLang,
  });

  String? prefLang;

  @override
  bool operator ==(Object other) => identical(this, other) || other is InlineObject &&
     other.prefLang == prefLang;

  @override
  int get hashCode =>
  // ignore: unnecessary_parenthesis
    (prefLang == null ? 0 : prefLang.hashCode);

  @override
  String toString() => 'InlineObject[prefLang=$prefLang]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (prefLang != null) {
      json[r'prefLang'] = prefLang;
    }
    return json;
  }

  /// Returns a new [InlineObject] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static InlineObject? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();
      return InlineObject(
        prefLang: mapValueOfType<String>(json, r'prefLang'),
      );
    }
    return null;
  }

  static List<InlineObject?>? listFromJson(dynamic json, {bool? emptyIsNull, bool? growable,}) =>
    json is List && json.isNotEmpty
      ? json.map(InlineObject.fromJson).toList(growable: true == growable)
      : true == emptyIsNull ? null : <InlineObject>[];

  static Map<String, InlineObject?> mapFromJson(dynamic json) {
    final map = <String, InlineObject?>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) => map[key] = InlineObject.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of InlineObject-objects as value to a dart map
  static Map<String, List<InlineObject?>?> mapListFromJson(dynamic json, {bool? emptyIsNull, bool? growable,}) {
    final Map<String, List<InlineObject?>?> map = <String, List<InlineObject>?>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) {
          map[key] = InlineObject.listFromJson(
            value,
            emptyIsNull: emptyIsNull,
            growable: growable,
          );
        });
    }
    return map;
  }
}

