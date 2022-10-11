//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//


// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class LoginRequest {
  /// Returns a new [LoginRequest] instance.
  LoginRequest({
    this.email,
    this.password,
  });

  String? email;

  String? password;

  @override
  bool operator ==(Object other) => identical(this, other) || other is LoginRequest &&
     other.email == email &&
     other.password == password;

  @override
  int get hashCode =>
  // ignore: unnecessary_parenthesis
    (email == null ? 0 : email.hashCode) +
    (password == null ? 0 : password.hashCode);

  @override
  String toString() => 'LoginRequest[email=$email, password=$password]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (email != null) {
      json[r'email'] = email;
    }
    if (password != null) {
      json[r'password'] = password;
    }
    return json;
  }

  /// Returns a new [LoginRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static LoginRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();
      return LoginRequest(
        email: mapValueOfType<String>(json, r'email'),
        password: mapValueOfType<String>(json, r'password'),
      );
    }
    return null;
  }

  static List<LoginRequest?>? listFromJson(dynamic json, {bool? emptyIsNull, bool? growable,}) =>
    json is List && json.isNotEmpty
      ? json.map(LoginRequest.fromJson).toList(growable: true == growable)
      : true == emptyIsNull ? null : <LoginRequest>[];

  static Map<String, LoginRequest?> mapFromJson(dynamic json) {
    final map = <String, LoginRequest?>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) => map[key] = LoginRequest.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of LoginRequest-objects as value to a dart map
  static Map<String, List<LoginRequest?>?> mapListFromJson(dynamic json, {bool? emptyIsNull, bool? growable,}) {
    final Map<String, List<LoginRequest?>?> map = <String, List<LoginRequest>?>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) {
          map[key] = LoginRequest.listFromJson(
            value,
            emptyIsNull: emptyIsNull,
            growable: growable,
          );
        });
    }
    return map;
  }
}

