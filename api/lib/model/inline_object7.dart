//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//


// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class InlineObject7 {
  /// Returns a new [InlineObject7] instance.
  InlineObject7({
    this.downloadType,
    this.userIdList = const [],
  });

  String? downloadType;

  List<String>? userIdList;

  @override
  bool operator ==(Object other) => identical(this, other) || other is InlineObject7 &&
     other.downloadType == downloadType &&
     other.userIdList == userIdList;

  @override
  int get hashCode =>
  // ignore: unnecessary_parenthesis
    (downloadType == null ? 0 : downloadType.hashCode) +
    (userIdList == null ? 0 : userIdList.hashCode);

  @override
  String toString() => 'InlineObject7[downloadType=$downloadType, userIdList=$userIdList]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (downloadType != null) {
      json[r'downloadType'] = downloadType;
    }
    if (userIdList != null) {
      json[r'userIdList'] = userIdList;
    }
    return json;
  }

  /// Returns a new [InlineObject7] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static InlineObject7? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();
      return InlineObject7(
        downloadType: mapValueOfType<String>(json, r'downloadType'),
        userIdList: json[r'userIdList'] is List
          ? (json[r'userIdList'] as List).cast<String>()
          : null,
      );
    }
    return null;
  }

  static List<InlineObject7?>? listFromJson(dynamic json, {bool? emptyIsNull, bool? growable,}) =>
    json is List && json.isNotEmpty
      ? json.map(InlineObject7.fromJson).toList(growable: true == growable)
      : true == emptyIsNull ? null : <InlineObject7>[];

  static Map<String, InlineObject7?> mapFromJson(dynamic json) {
    final map = <String, InlineObject7?>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) => map[key] = InlineObject7.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of InlineObject7-objects as value to a dart map
  static Map<String, List<InlineObject7?>?> mapListFromJson(dynamic json, {bool? emptyIsNull, bool? growable,}) {
    final Map<String, List<InlineObject7?>?> map = <String, List<InlineObject7>?>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) {
          map[key] = InlineObject7.listFromJson(
            value,
            emptyIsNull: emptyIsNull,
            growable: growable,
          );
        });
    }
    return map;
  }
}

