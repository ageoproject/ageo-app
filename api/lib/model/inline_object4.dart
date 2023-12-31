//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//


// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class InlineObject4 {
  /// Returns a new [InlineObject4] instance.
  InlineObject4({
    this.token,
    this.newPassword,
  });

  String? token;

  String? newPassword;

  @override
  bool operator ==(Object other) => identical(this, other) || other is InlineObject4 &&
     other.token == token &&
     other.newPassword == newPassword;

  @override
  int get hashCode =>
  // ignore: unnecessary_parenthesis
    (token == null ? 0 : token.hashCode) +
    (newPassword == null ? 0 : newPassword.hashCode);

  @override
  String toString() => 'InlineObject4[token=$token, newPassword=$newPassword]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (token != null) {
      json[r'token'] = token;
    }
    if (newPassword != null) {
      json[r'newPassword'] = newPassword;
    }
    return json;
  }

  /// Returns a new [InlineObject4] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static InlineObject4? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();
      return InlineObject4(
        token: mapValueOfType<String>(json, r'token'),
        newPassword: mapValueOfType<String>(json, r'newPassword'),
      );
    }
    return null;
  }

  static List<InlineObject4?>? listFromJson(dynamic json, {bool? emptyIsNull, bool? growable,}) =>
    json is List && json.isNotEmpty
      ? json.map(InlineObject4.fromJson).toList(growable: true == growable)
      : true == emptyIsNull ? null : <InlineObject4>[];

  static Map<String, InlineObject4?> mapFromJson(dynamic json) {
    final map = <String, InlineObject4?>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) => map[key] = InlineObject4.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of InlineObject4-objects as value to a dart map
  static Map<String, List<InlineObject4?>?> mapListFromJson(dynamic json, {bool? emptyIsNull, bool? growable,}) {
    final Map<String, List<InlineObject4?>?> map = <String, List<InlineObject4>?>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) {
          map[key] = InlineObject4.listFromJson(
            value,
            emptyIsNull: emptyIsNull,
            growable: growable,
          );
        });
    }
    return map;
  }
}

