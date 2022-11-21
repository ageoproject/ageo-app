//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//


// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class UserApi {
  UserApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Change login user password
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] oldPassword (required):
  ///
  /// * [String] newPassword (required):
  Future<Response> changePasswordWithHttpInfo(String oldPassword, String newPassword,) async {
    // Verify required params are set.
    if (oldPassword == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: oldPassword');
    }
    if (newPassword == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: newPassword');
    }

    // ignore: prefer_const_declarations
    final path = r'/user/change_password';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_convertParametersForCollectionFormat('', 'oldPassword', oldPassword));
      queryParams.addAll(_convertParametersForCollectionFormat('', 'newPassword', newPassword));

    const authNames = <String>['Token'];
    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes[0],
      authNames,
    );
  }

  /// Change login user password
  ///
  /// Parameters:
  ///
  /// * [String] oldPassword (required):
  ///
  /// * [String] newPassword (required):
  Future<void> changePassword(String oldPassword, String newPassword,) async {
    final response = await changePasswordWithHttpInfo(oldPassword, newPassword,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Change user's preferred language
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [InlineObject] changePreferredLanguage (required):
  Future<Response> changePreferredLanguageWithHttpInfo(InlineObject changePreferredLanguage,) async {
    // Verify required params are set.
    if (changePreferredLanguage == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: changePreferredLanguage');
    }

    // ignore: prefer_const_declarations
    final path = r'/user/change_preferred_language';

    // ignore: prefer_final_locals
    Object postBody = changePreferredLanguage;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const authNames = <String>['Token'];
    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes[0],
      authNames,
    );
  }

  /// Change user's preferred language
  ///
  /// Parameters:
  ///
  /// * [InlineObject] changePreferredLanguage (required):
  Future<void> changePreferredLanguage(InlineObject changePreferredLanguage,) async {
    final response = await changePreferredLanguageWithHttpInfo(changePreferredLanguage,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Refresh API key for user
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> refreshApiKeyWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/user/refresh_apikey';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const authNames = <String>['Token'];
    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes[0],
      authNames,
    );
  }

  /// Refresh API key for user
  Future<LoginResponse?> refreshApiKey() async {
    final response = await refreshApiKeyWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'LoginResponse',) as LoginResponse?;
    
    }
    return Future<LoginResponse>.value();
  }
}
