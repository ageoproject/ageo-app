//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//


// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ManagerApi {
  ManagerApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'PUT /manager/change_event_status' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] newStatus (required):
  ///
  /// * [String] eventId (required):
  Future<Response> changeEventStatusWithHttpInfo(String newStatus, String eventId,) async {
    // Verify required params are set.
    if (newStatus == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: newStatus');
    }
    if (eventId == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: eventId');
    }

    // ignore: prefer_const_declarations
    final path = r'/manager/change_event_status';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_convertParametersForCollectionFormat('', 'newStatus', newStatus));
      queryParams.addAll(_convertParametersForCollectionFormat('', 'eventId', eventId));

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

  /// Parameters:
  ///
  /// * [String] newStatus (required):
  ///
  /// * [String] eventId (required):
  Future<void> changeEventStatus(String newStatus, String eventId,) async {
    final response = await changeEventStatusWithHttpInfo(newStatus, eventId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Download Excel file of events
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [InlineObject5] filters:
  Future<Response> downloadEventListWithHttpInfo({ InlineObject5? filters, }) async {
    // Verify required params are set.

    // ignore: prefer_const_declarations
    final path = r'/manager/download_event_list';

    // ignore: prefer_final_locals
    Object? postBody = filters;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const authNames = <String>['Token'];
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

  /// Download Excel file of events
  ///
  /// Parameters:
  ///
  /// * [InlineObject5] filters:
  Future<MultipartFile?> downloadEventList({ InlineObject5? filters, }) async {
    final response = await downloadEventListWithHttpInfo( filters: filters, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultipartFile',) as MultipartFile?;
    
    }
    return Future<MultipartFile>.value();
  }
}
