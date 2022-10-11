//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class LoginResponce {
  /// Returns a new [LoginResponce] instance.
  LoginResponce({
    this.token,
    this.user,
  });

  String token;

  User user;

  @override
  bool operator ==(Object other) => identical(this, other) || other is LoginResponce &&
     other.token == token &&
     other.user == user;

  @override
  int get hashCode =>
  // ignore: unnecessary_parenthesis
    (token == null ? 0 : token.hashCode) +
    (user == null ? 0 : user.hashCode);

  @override
  String toString() => 'LoginResponce[token=$token, user=$user]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (token != null) {
      json[r'token'] = token;
    }
    if (user != null) {
      json[r'user'] = user;
    }
    return json;
  }

  /// Returns a new [LoginResponce] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static LoginResponce fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();
      return LoginResponce(
        token: mapValueOfType<String>(json, r'token'),
        user: User.fromJson(json[r'user']),
      );
    }
    return null;
  }

  static List<LoginResponce> listFromJson(dynamic json, {bool emptyIsNull, bool growable,}) =>
    json is List && json.isNotEmpty
      ? json.map(LoginResponce.fromJson).toList(growable: true == growable)
      : true == emptyIsNull ? null : <LoginResponce>[];

  static Map<String, LoginResponce> mapFromJson(dynamic json) {
    final map = <String, LoginResponce>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) => map[key] = LoginResponce.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of LoginResponce-objects as value to a dart map
  static Map<String, List<LoginResponce>> mapListFromJson(dynamic json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<LoginResponce>>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) {
          map[key] = LoginResponce.listFromJson(
            value,
            emptyIsNull: emptyIsNull,
            growable: growable,
          );
        });
    }
    return map;
  }
}

