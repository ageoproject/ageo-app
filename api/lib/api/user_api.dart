//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class UserApi {
  UserApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Change login user password
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [ChangePassword] changePassword (required):
  Future<Response> changePasswordWithHttpInfo(ChangePassword changePassword,) async {
    // Verify required params are set.
    if (changePassword == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: changePassword');
    }

    // ignore: prefer_const_declarations
    final path = r'/user/change_password';

    // ignore: prefer_final_locals
    Object postBody = changePassword;

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

  /// Change login user password
  ///
  /// Parameters:
  ///
  /// * [ChangePassword] changePassword (required):
  Future<void> changePassword(ChangePassword changePassword,) async {
    final response = await changePasswordWithHttpInfo(changePassword,);
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

  /// Change user's Status eg. ACTIVE or INACTIVE
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [InlineObject1] changeUserStatus (required):
  Future<Response> changeUserStatusWithHttpInfo(InlineObject1 changeUserStatus,) async {
    // Verify required params are set.
    if (changeUserStatus == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: changeUserStatus');
    }

    // ignore: prefer_const_declarations
    final path = r'/user/change_user_status';

    // ignore: prefer_final_locals
    Object postBody = changeUserStatus;

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

  /// Change user's Status eg. ACTIVE or INACTIVE
  ///
  /// Parameters:
  ///
  /// * [InlineObject1] changeUserStatus (required):
  Future<void> changeUserStatus(InlineObject1 changeUserStatus,) async {
    final response = await changeUserStatusWithHttpInfo(changeUserStatus,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Update Status of Reported Events
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [UpdateEventRequest] updateEventRequest (required):
  Future<Response> updateEventWithHttpInfo(UpdateEventRequest updateEventRequest,) async {
    // Verify required params are set.
    if (updateEventRequest == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: updateEventRequest');
    }

    // ignore: prefer_const_declarations
    final path = r'/user/update_event';

    // ignore: prefer_final_locals
    Object postBody = updateEventRequest;

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

  /// Update Status of Reported Events
  ///
  /// Parameters:
  ///
  /// * [UpdateEventRequest] updateEventRequest (required):
  Future<void> updateEvent(UpdateEventRequest updateEventRequest,) async {
    final response = await updateEventWithHttpInfo(updateEventRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
