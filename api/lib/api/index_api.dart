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

  /// Submit contact us form
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [InlineObject] formData:
  Future<Response> contactUsWithHttpInfo({ InlineObject? formData, }) async {
    // Verify required params are set.

    // ignore: prefer_const_declarations
    final path = r'/anonymous/contact_us';

    // ignore: prefer_final_locals
    Object? postBody = formData;

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

  /// Submit contact us form
  ///
  /// Parameters:
  ///
  /// * [InlineObject] formData:
  Future<String?> contactUs({ InlineObject? formData, }) async {
    final response = await contactUsWithHttpInfo( formData: formData, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'String',) as String?;
    
    }
    return Future<String>.value();
  }

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
  /// * [String] userRole:
  ///
  /// * [Object] datatableoptions:
  Future<Response> getDatatableEventListWithHttpInfo({ String? eventType, String? eventStatus, num? fromDate, num? toDate, String? userRole, Object? datatableoptions, }) async {
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
    if (userRole != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'userRole', userRole));
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
  /// * [String] userRole:
  ///
  /// * [Object] datatableoptions:
  Future<InlineResponse200?> getDatatableEventList({ String? eventType, String? eventStatus, num? fromDate, num? toDate, String? userRole, Object? datatableoptions, }) async {
    final response = await getDatatableEventListWithHttpInfo( eventType: eventType, eventStatus: eventStatus, fromDate: fromDate, toDate: toDate, userRole: userRole, datatableoptions: datatableoptions, );
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
  /// * [String] userRole:
  ///
  /// * [List<List<num>>] polygon:
  Future<Response> getMapEventListWithHttpInfo({ String? eventType, String? eventStatus, num? fromDate, num? toDate, String? userRole, List<List<num>>? polygon, }) async {
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
    if (userRole != null) {
      queryParams.addAll(_convertParametersForCollectionFormat('', 'userRole', userRole));
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
  /// * [String] userRole:
  ///
  /// * [List<List<num>>] polygon:
  Future<List<Event>> getMapEventList({ String? eventType, String? eventStatus, num? fromDate, num? toDate, String? userRole, List<List<num>>? polygon, }) async {
    final response = await getMapEventListWithHttpInfo( eventType: eventType, eventStatus: eventStatus, fromDate: fromDate, toDate: toDate, userRole: userRole, polygon: polygon, );
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
  /// * [String] eventType (required):
  ///
  /// * [String] time (required):
  ///
  /// * [String] location (required):
  ///
  /// * [MultipartFile] image1:
  ///
  /// * [MultipartFile] image2:
  ///
  /// * [MultipartFile] image3:
  ///
  /// * [bool] quickReport:
  ///
  /// * [String] comment:
  ///
  /// * [String] sensorData:
  ///
  /// * [String] commonEventDetails:
  ///
  /// * [String] customEventDetails:
  Future<Response> reportEventWithHttpInfo(String eventType, String time, String location, { MultipartFile? image1, MultipartFile? image2, MultipartFile? image3, bool? quickReport, String? comment, String? sensorData, String? commonEventDetails, String? customEventDetails, }) async {
    // Verify required params are set.
    if (eventType == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: eventType');
    }
    if (time == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: time');
    }
    if (location == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: location');
    }

    // ignore: prefer_const_declarations
    final path = r'/anonymous/report_event';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const authNames = <String>[];
    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (eventType != null) {
      hasFields = true;
      mp.fields[r'eventType'] = parameterToString(eventType);
    }
    if (time != null) {
      hasFields = true;
      mp.fields[r'time'] = parameterToString(time);
    }
    if (location != null) {
      hasFields = true;
      mp.fields[r'location'] = parameterToString(location);
    }
    if (image1 != null) {
      hasFields = true;
      mp.fields[r'image1'] = image1.field;
      mp.files.add(image1);
    }
    if (image2 != null) {
      hasFields = true;
      mp.fields[r'image2'] = image2.field;
      mp.files.add(image2);
    }
    if (image3 != null) {
      hasFields = true;
      mp.fields[r'image3'] = image3.field;
      mp.files.add(image3);
    }
    if (quickReport != null) {
      hasFields = true;
      mp.fields[r'quickReport'] = parameterToString(quickReport);
    }
    if (comment != null) {
      hasFields = true;
      mp.fields[r'comment'] = parameterToString(comment);
    }
    if (sensorData != null) {
      hasFields = true;
      mp.fields[r'sensorData'] = parameterToString(sensorData);
    }
    if (commonEventDetails != null) {
      hasFields = true;
      mp.fields[r'commonEventDetails'] = parameterToString(commonEventDetails);
    }
    if (customEventDetails != null) {
      hasFields = true;
      mp.fields[r'customEventDetails'] = parameterToString(customEventDetails);
    }
    if (hasFields) {
      postBody = mp;
    }

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
  /// * [String] eventType (required):
  ///
  /// * [String] time (required):
  ///
  /// * [String] location (required):
  ///
  /// * [MultipartFile] image1:
  ///
  /// * [MultipartFile] image2:
  ///
  /// * [MultipartFile] image3:
  ///
  /// * [bool] quickReport:
  ///
  /// * [String] comment:
  ///
  /// * [String] sensorData:
  ///
  /// * [String] commonEventDetails:
  ///
  /// * [String] customEventDetails:
  Future<Event?> reportEvent(String eventType, String time, String location, { MultipartFile? image1, MultipartFile? image2, MultipartFile? image3, bool? quickReport, String? comment, String? sensorData, String? commonEventDetails, String? customEventDetails, }) async {
    final response = await reportEventWithHttpInfo(eventType, time, location,  image1: image1, image2: image2, image3: image3, quickReport: quickReport, comment: comment, sensorData: sensorData, commonEventDetails: commonEventDetails, customEventDetails: customEventDetails, );
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
