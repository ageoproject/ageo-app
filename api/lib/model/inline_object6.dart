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
    this.searchKeyword,
    this.userIdList = const [],
  });

  String? downloadType;

  String? searchKeyword;

  List<String>? userIdList;

  @override
  bool operator ==(Object other) => identical(this, other) || other is InlineObject6 &&
     other.downloadType == downloadType &&
     other.searchKeyword == searchKeyword &&
     other.userIdList == userIdList;

  @override
  int get hashCode =>
  // ignore: unnecessary_parenthesis
    (downloadType == null ? 0 : downloadType.hashCode) +
    (searchKeyword == null ? 0 : searchKeyword.hashCode) +
    (userIdList == null ? 0 : userIdList.hashCode);

  @override
  String toString() => 'InlineObject6[downloadType=$downloadType, searchKeyword=$searchKeyword, userIdList=$userIdList]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (downloadType != null) {
      json[r'downloadType'] = downloadType;
    }
    if (searchKeyword != null) {
      json[r'searchKeyword'] = searchKeyword;
    }
    if (userIdList != null) {
      json[r'userIdList'] = userIdList;
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
        searchKeyword: mapValueOfType<String>(json, r'searchKeyword'),
        userIdList: json[r'userIdList'] is List
          ? (json[r'userIdList'] as List).cast<String>()
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

