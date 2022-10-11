//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//


// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class User {
  /// Returns a new [User] instance.
  User({
    this.id,
    this.name,
    this.email,
    this.passwordHash,
    this.role,
    this.prefLang,
    this.status,
    this.apiKey,
    this.createdBy,
    this.token,
  });

  String? id;

  String? name;

  String? email;

  String? passwordHash;

  UserRoleEnum? role;

  UserPrefLangEnum? prefLang;

  UserStatusEnum? status;

  String? apiKey;

  User? createdBy;

  String? token;

  @override
  bool operator ==(Object other) => identical(this, other) || other is User &&
     other.id == id &&
     other.name == name &&
     other.email == email &&
     other.passwordHash == passwordHash &&
     other.role == role &&
     other.prefLang == prefLang &&
     other.status == status &&
     other.apiKey == apiKey &&
     other.createdBy == createdBy &&
     other.token == token;

  @override
  int get hashCode =>
  // ignore: unnecessary_parenthesis
    (id == null ? 0 : id.hashCode) +
    (name == null ? 0 : name.hashCode) +
    (email == null ? 0 : email.hashCode) +
    (passwordHash == null ? 0 : passwordHash.hashCode) +
    (role == null ? 0 : role.hashCode) +
    (prefLang == null ? 0 : prefLang.hashCode) +
    (status == null ? 0 : status.hashCode) +
    (apiKey == null ? 0 : apiKey.hashCode) +
    (createdBy == null ? 0 : createdBy.hashCode) +
    (token == null ? 0 : token.hashCode);

  @override
  String toString() => 'User[id=$id, name=$name, email=$email, passwordHash=$passwordHash, role=$role, prefLang=$prefLang, status=$status, apiKey=$apiKey, createdBy=$createdBy, token=$token]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'_id'] = id;
    }
    if (name != null) {
      json[r'name'] = name;
    }
    if (email != null) {
      json[r'email'] = email;
    }
    if (passwordHash != null) {
      json[r'passwordHash'] = passwordHash;
    }
    if (role != null) {
      json[r'role'] = role;
    }
    if (prefLang != null) {
      json[r'prefLang'] = prefLang;
    }
    if (status != null) {
      json[r'status'] = status;
    }
    if (apiKey != null) {
      json[r'apiKey'] = apiKey;
    }
    if (createdBy != null) {
      json[r'createdBy'] = createdBy;
    }
    if (token != null) {
      json[r'token'] = token;
    }
    return json;
  }

  /// Returns a new [User] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static User? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();
      return User(
        id: mapValueOfType<String>(json, r'_id'),
        name: mapValueOfType<String>(json, r'name'),
        email: mapValueOfType<String>(json, r'email'),
        passwordHash: mapValueOfType<String>(json, r'passwordHash'),
        role: UserRoleEnum.fromJson(json[r'role']),
        prefLang: UserPrefLangEnum.fromJson(json[r'prefLang']),
        status: UserStatusEnum.fromJson(json[r'status']),
        apiKey: mapValueOfType<String>(json, r'apiKey'),
        createdBy: User.fromJson(json[r'createdBy']),
        token: mapValueOfType<String>(json, r'token'),
      );
    }
    return null;
  }

  static List<User?>? listFromJson(dynamic json, {bool? emptyIsNull, bool? growable,}) =>
    json is List && json.isNotEmpty
      ? json.map(User.fromJson).toList(growable: true == growable)
      : true == emptyIsNull ? null : <User>[];

  static Map<String, User?> mapFromJson(dynamic json) {
    final map = <String, User?>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) => map[key] = User.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of User-objects as value to a dart map
  static Map<String, List<User?>?> mapListFromJson(dynamic json, {bool? emptyIsNull, bool? growable,}) {
    final Map<String, List<User?>?> map = <String, List<User>?>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) {
          map[key] = User.listFromJson(
            value,
            emptyIsNull: emptyIsNull,
            growable: growable,
          );
        });
    }
    return map;
  }
}


class UserRoleEnum {
  /// Instantiate a new enum with the provided [value].
  const UserRoleEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const USER = UserRoleEnum._(r'USER');
  static const MANAGER = UserRoleEnum._(r'MANAGER');
  static const SUPERADMIN = UserRoleEnum._(r'SUPERADMIN');

  /// List of all possible values in this [enum][UserRoleEnum].
  static const values = <UserRoleEnum>[
    USER,
    MANAGER,
    SUPERADMIN,
  ];

  static UserRoleEnum? fromJson(dynamic value) =>
    UserRoleEnumTypeTransformer().decode(value);

  static List<UserRoleEnum?>? listFromJson(dynamic json, {bool? emptyIsNull, bool? growable,}) =>
    json is List && json.isNotEmpty
      ? json.map(UserRoleEnum.fromJson).toList(growable: true == growable)
      : true == emptyIsNull ? null : <UserRoleEnum>[];
}

/// Transformation class that can [encode] an instance of [UserRoleEnum] to String,
/// and [decode] dynamic data back to [UserRoleEnum].
class UserRoleEnumTypeTransformer {
  factory UserRoleEnumTypeTransformer() => _instance ??= const UserRoleEnumTypeTransformer._();

  const UserRoleEnumTypeTransformer._();

  String encode(UserRoleEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a UserRoleEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  UserRoleEnum? decode(dynamic data, {bool? allowNull}) {
    if (data != null) {
      switch (data.toString()) {
        case r'USER': return UserRoleEnum.USER;
        case r'MANAGER': return UserRoleEnum.MANAGER;
        case r'SUPERADMIN': return UserRoleEnum.SUPERADMIN;
        default:
          if (allowNull == false) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [UserRoleEnumTypeTransformer] instance.
  static UserRoleEnumTypeTransformer? _instance;
}



class UserPrefLangEnum {
  /// Instantiate a new enum with the provided [value].
  const UserPrefLangEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const ENGLISH = UserPrefLangEnum._(r'ENGLISH');
  static const SPANISH = UserPrefLangEnum._(r'SPANISH');
  static const FRENCH = UserPrefLangEnum._(r'FRENCH');
  static const PORTUGUESE = UserPrefLangEnum._(r'PORTUGUESE');

  /// List of all possible values in this [enum][UserPrefLangEnum].
  static const values = <UserPrefLangEnum>[
    ENGLISH,
    SPANISH,
    FRENCH,
    PORTUGUESE,
  ];

  static UserPrefLangEnum? fromJson(dynamic value) =>
    UserPrefLangEnumTypeTransformer().decode(value);

  static List<UserPrefLangEnum?>? listFromJson(dynamic json, {bool? emptyIsNull, bool? growable,}) =>
    json is List && json.isNotEmpty
      ? json.map(UserPrefLangEnum.fromJson).toList(growable: true == growable)
      : true == emptyIsNull ? null : <UserPrefLangEnum>[];
}

/// Transformation class that can [encode] an instance of [UserPrefLangEnum] to String,
/// and [decode] dynamic data back to [UserPrefLangEnum].
class UserPrefLangEnumTypeTransformer {
  factory UserPrefLangEnumTypeTransformer() => _instance ??= const UserPrefLangEnumTypeTransformer._();

  const UserPrefLangEnumTypeTransformer._();

  String encode(UserPrefLangEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a UserPrefLangEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  UserPrefLangEnum? decode(dynamic data, {bool? allowNull}) {
    if (data != null) {
      switch (data.toString()) {
        case r'ENGLISH': return UserPrefLangEnum.ENGLISH;
        case r'SPANISH': return UserPrefLangEnum.SPANISH;
        case r'FRENCH': return UserPrefLangEnum.FRENCH;
        case r'PORTUGUESE': return UserPrefLangEnum.PORTUGUESE;
        default:
          if (allowNull == false) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [UserPrefLangEnumTypeTransformer] instance.
  static UserPrefLangEnumTypeTransformer? _instance;
}



class UserStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const UserStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const ACTIVE = UserStatusEnum._(r'ACTIVE');
  static const INACTIVE = UserStatusEnum._(r'INACTIVE');

  /// List of all possible values in this [enum][UserStatusEnum].
  static const values = <UserStatusEnum>[
    ACTIVE,
    INACTIVE,
  ];

  static UserStatusEnum? fromJson(dynamic value) =>
    UserStatusEnumTypeTransformer().decode(value);

  static List<UserStatusEnum?>? listFromJson(dynamic json, {bool? emptyIsNull, bool? growable,}) =>
    json is List && json.isNotEmpty
      ? json.map(UserStatusEnum.fromJson).toList(growable: true == growable)
      : true == emptyIsNull ? null : <UserStatusEnum>[];
}

/// Transformation class that can [encode] an instance of [UserStatusEnum] to String,
/// and [decode] dynamic data back to [UserStatusEnum].
class UserStatusEnumTypeTransformer {
  factory UserStatusEnumTypeTransformer() => _instance ??= const UserStatusEnumTypeTransformer._();

  const UserStatusEnumTypeTransformer._();

  String encode(UserStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a UserStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  UserStatusEnum? decode(dynamic data, {bool? allowNull}) {
    if (data != null) {
      switch (data.toString()) {
        case r'ACTIVE': return UserStatusEnum.ACTIVE;
        case r'INACTIVE': return UserStatusEnum.INACTIVE;
        default:
          if (allowNull == false) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [UserStatusEnumTypeTransformer] instance.
  static UserStatusEnumTypeTransformer? _instance;
}


