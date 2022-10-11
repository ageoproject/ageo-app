//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class IndexApi {
  IndexApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Login api for System admin and managers
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [LoginRequest] loginRequest (required):
  Future<Response> loginAPIWithHttpInfo(LoginRequest loginRequest,) async {
    // Verify required params are set.
    if (loginRequest == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: loginRequest');
    }

    // ignore: prefer_const_declarations
    final path = r'/login';

    // ignore: prefer_final_locals
    Object postBody = loginRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const authNames = <String>[];
    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes[0],
      authNames,
    );
  }

  /// Login api for System admin and managers
  ///
  /// Parameters:
  ///
  /// * [LoginRequest] loginRequest (required):
  Future<void> loginAPI(LoginRequest loginRequest,) async {
    final response = await loginAPIWithHttpInfo(loginRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Report events
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [Event] eventReport (required):
  Future<Response> reportEventsWithHttpInfo(Event eventReport,) async {
    // Verify required params are set.
    if (eventReport == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: eventReport');
    }

    // ignore: prefer_const_declarations
    final path = r'/report_event';

    // ignore: prefer_final_locals
    Object postBody = eventReport;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const authNames = <String>[];
    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes[0],
      authNames,
    );
  }

  /// Report events
  ///
  /// Parameters:
  ///
  /// * [Event] eventReport (required):
  Future<EventReportResponse> reportEvents(Event eventReport,) async {
    final response = await reportEventsWithHttpInfo(eventReport,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'EventReportResponse',) as EventReportResponse;
    
    }
    return Future<EventReportResponse>.value();
  }
}
