//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//


// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class IndexApi {
  IndexApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Get paginated list of events
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] eventType:
  ///
  /// * [String] eventStatus:
  ///
  /// * [num] fromDate:
  ///
  /// * [num] toDate:
  ///
  /// * [Object] datatableoptions:
  Future<Response> getDatatableEventListWithHttpInfo({ String? eventType, String? eventStatus, num? fromDate, num? toDate, Object? datatableoptions, }) async {
    // Verify required params are set.

    // ignore: prefer_const_declarations
    final path = r'/anonymous/get_datatable_event_list';

    // ignore: prefer_final_locals
    Object? postBody = datatableoptions;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (eventType != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'eventType', eventType));
    }
    if (eventStatus != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'eventStatus', eventStatus));
    }
    if (fromDate != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'fromDate', fromDate));
    }
    if (toDate != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'toDate', toDate));
    }

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

  /// Get paginated list of events
  ///
  /// Parameters:
  ///
  /// * [String] eventType:
  ///
  /// * [String] eventStatus:
  ///
  /// * [num] fromDate:
  ///
  /// * [num] toDate:
  ///
  /// * [Object] datatableoptions:
  Future<InlineResponse200?> getDatatableEventList({ String? eventType, String? eventStatus, num? fromDate, num? toDate, Object? datatableoptions, }) async {
    final response = await getDatatableEventListWithHttpInfo( eventType: eventType, eventStatus: eventStatus, fromDate: fromDate, toDate: toDate, datatableoptions: datatableoptions, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'InlineResponse200',) as InlineResponse200?;
    
    }
    return Future<InlineResponse200>.value();
  }

  /// Get details of an event
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] eventId (required):
  Future<Response> getEventDetailsWithHttpInfo(String eventId,) async {
    // Verify required params are set.
    if (eventId == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: eventId');
    }

    // ignore: prefer_const_declarations
    final path = r'/anonymous/get_event_details';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_convertParametersForCollectionFormat('', 'eventId', eventId));

    const authNames = <String>[];
    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes[0],
      authNames,
    );
  }

  /// Get details of an event
  ///
  /// Parameters:
  ///
  /// * [String] eventId (required):
  Future<Event?> getEventDetails(String eventId,) async {
    final response = await getEventDetailsWithHttpInfo(eventId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Event',) as Event?;
    
    }
    return Future<Event>.value();
  }

  /// Get list of events for map view
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] eventType:
  ///
  /// * [String] eventStatus:
  ///
  /// * [num] fromDate:
  ///
  /// * [num] toDate:
  ///
  /// * [List<List<num>>] polygon:
  Future<Response> getMapEventListWithHttpInfo({ String? eventType, String? eventStatus, num? fromDate, num? toDate, List<List<num>>? polygon, }) async {
    // Verify required params are set.

    // ignore: prefer_const_declarations
    final path = r'/anonymous/get_map_event_list';

    // ignore: prefer_final_locals
    Object? postBody = polygon;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (eventType != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'eventType', eventType));
    }
    if (eventStatus != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'eventStatus', eventStatus));
    }
    if (fromDate != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'fromDate', fromDate));
    }
    if (toDate != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'toDate', toDate));
    }

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

  /// Get list of events for map view
  ///
  /// Parameters:
  ///
  /// * [String] eventType:
  ///
  /// * [String] eventStatus:
  ///
  /// * [num] fromDate:
  ///
  /// * [num] toDate:
  ///
  /// * [List<List<num>>] polygon:
  Future<List<Event>> getMapEventList({ String? eventType, String? eventStatus, num? fromDate, num? toDate, List<List<num>>? polygon, }) async {
    final response = await getMapEventListWithHttpInfo( eventType: eventType, eventStatus: eventStatus, fromDate: fromDate, toDate: toDate, polygon: polygon, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<Event>') as List)
        .cast<Event>()
        .toList(growable: false);

    }
    return Future<List<Event>>.value();
  }

  /// Get master list of event questions
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> questionMasterListWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/anonymous/question_master_list';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const authNames = <String>[];
    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes[0],
      authNames,
    );
  }

  /// Get master list of event questions
  Future<Object?> questionMasterList() async {
    final response = await questionMasterListWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Object',) as Object?;
    
    }
    return Future<Object>.value();
  }

  /// Report events
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [Event] eventReport (required):
  Future<Response> reportEventWithHttpInfo(Event eventReport,) async {
    // Verify required params are set.
    if (eventReport == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: eventReport');
    }

    // ignore: prefer_const_declarations
    final path = r'/anonymous/report_event';

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
  Future<Event?> reportEvent(Event eventReport,) async {
    final response = await reportEventWithHttpInfo(eventReport,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Event',) as Event?;
    
    }
    return Future<Event>.value();
  }
}
