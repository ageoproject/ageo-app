//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ChangePassword {
  /// Returns a new [ChangePassword] instance.
  ChangePassword({
    this.oldPassword,
    this.newPassword,
    this.conformPassword,
  });

  String oldPassword;

  String newPassword;

  String conformPassword;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ChangePassword &&
     other.oldPassword == oldPassword &&
     other.newPassword == newPassword &&
     other.conformPassword == conformPassword;

  @override
  int get hashCode =>
  // ignore: unnecessary_parenthesis
    (oldPassword == null ? 0 : oldPassword.hashCode) +
    (newPassword == null ? 0 : newPassword.hashCode) +
    (conformPassword == null ? 0 : conformPassword.hashCode);

  @override
  String toString() => 'ChangePassword[oldPassword=$oldPassword, newPassword=$newPassword, conformPassword=$conformPassword]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (oldPassword != null) {
      json[r'oldPassword'] = oldPassword;
    }
    if (newPassword != null) {
      json[r'newPassword'] = newPassword;
    }
    if (conformPassword != null) {
      json[r'conformPassword'] = conformPassword;
    }
    return json;
  }

  /// Returns a new [ChangePassword] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ChangePassword fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();
      return ChangePassword(
        oldPassword: mapValueOfType<String>(json, r'oldPassword'),
        newPassword: mapValueOfType<String>(json, r'newPassword'),
        conformPassword: mapValueOfType<String>(json, r'conformPassword'),
      );
    }
    return null;
  }

  static List<ChangePassword> listFromJson(dynamic json, {bool emptyIsNull, bool growable,}) =>
    json is List && json.isNotEmpty
      ? json.map(ChangePassword.fromJson).toList(growable: true == growable)
      : true == emptyIsNull ? null : <ChangePassword>[];

  static Map<String, ChangePassword> mapFromJson(dynamic json) {
    final map = <String, ChangePassword>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) => map[key] = ChangePassword.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of ChangePassword-objects as value to a dart map
  static Map<String, List<ChangePassword>> mapListFromJson(dynamic json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<ChangePassword>>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) {
          map[key] = ChangePassword.listFromJson(
            value,
            emptyIsNull: emptyIsNull,
            growable: growable,
          );
        });
    }
    return map;
  }
}

