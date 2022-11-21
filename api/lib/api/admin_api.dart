//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//


// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class AdminApi {
  AdminApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /admin/manager' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [User] managerDetails:
  Future<Response> addManagerWithHttpInfo({ User? managerDetails, }) async {
    // Verify required params are set.

    // ignore: prefer_const_declarations
    final path = r'/admin/manager';

    // ignore: prefer_final_locals
    Object? postBody = managerDetails;

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

  /// Parameters:
  ///
  /// * [User] managerDetails:
  Future<User?> addManager({ User? managerDetails, }) async {
    final response = await addManagerWithHttpInfo( managerDetails: managerDetails, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'User',) as User?;
    
    }
    return Future<User>.value();
  }

  /// Performs an HTTP 'PUT /admin/change_apiuser_status' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] userId (required):
  ///
  /// * [String] newStatus (required):
  Future<Response> changeApiuserStatusWithHttpInfo(String userId, String newStatus,) async {
    // Verify required params are set.
    if (userId == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: userId');
    }
    if (newStatus == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: newStatus');
    }

    // ignore: prefer_const_declarations
    final path = r'/admin/change_apiuser_status';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_convertParametersForCollectionFormat('', 'userId', userId));
      queryParams.addAll(_convertParametersForCollectionFormat('', 'newStatus', newStatus));

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
  /// * [String] userId (required):
  ///
  /// * [String] newStatus (required):
  Future<void> changeApiuserStatus(String userId, String newStatus,) async {
    final response = await changeApiuserStatusWithHttpInfo(userId, newStatus,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Download Excel file of api users
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [InlineObject6] filters:
  Future<Response> downloadApiuserListWithHttpInfo({ InlineObject6? filters, }) async {
    // Verify required params are set.

    // ignore: prefer_const_declarations
    final path = r'/admin/download_apiuser_list';

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

  /// Download Excel file of api users
  ///
  /// Parameters:
  ///
  /// * [InlineObject6] filters:
  Future<MultipartFile?> downloadApiuserList({ InlineObject6? filters, }) async {
    final response = await downloadApiuserListWithHttpInfo( filters: filters, );
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

  /// Download Excel file of managers
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [InlineObject5] filters:
  Future<Response> downloadManagerListWithHttpInfo({ InlineObject5? filters, }) async {
    // Verify required params are set.

    // ignore: prefer_const_declarations
    final path = r'/admin/download_manager_list';

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

  /// Download Excel file of managers
  ///
  /// Parameters:
  ///
  /// * [InlineObject5] filters:
  Future<MultipartFile?> downloadManagerList({ InlineObject5? filters, }) async {
    final response = await downloadManagerListWithHttpInfo( filters: filters, );
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

  /// Performs an HTTP 'POST /admin/get_datatable_apiuser_list' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [Object] datatableoptions:
  Future<Response> getDatatableApiuserListWithHttpInfo({ Object? datatableoptions, }) async {
    // Verify required params are set.

    // ignore: prefer_const_declarations
    final path = r'/admin/get_datatable_apiuser_list';

    // ignore: prefer_final_locals
    Object? postBody = datatableoptions;

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

  /// Parameters:
  ///
  /// * [Object] datatableoptions:
  Future<void> getDatatableApiuserList({ Object? datatableoptions, }) async {
    final response = await getDatatableApiuserListWithHttpInfo( datatableoptions: datatableoptions, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'POST /admin/get_datatable_manager_list' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [Object] datatableoptions:
  Future<Response> getDatatableManagerListWithHttpInfo({ Object? datatableoptions, }) async {
    // Verify required params are set.

    // ignore: prefer_const_declarations
    final path = r'/admin/get_datatable_manager_list';

    // ignore: prefer_final_locals
    Object? postBody = datatableoptions;

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

  /// Parameters:
  ///
  /// * [Object] datatableoptions:
  Future<void> getDatatableManagerList({ Object? datatableoptions, }) async {
    final response = await getDatatableManagerListWithHttpInfo( datatableoptions: datatableoptions, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'GET /admin/manager' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] managerId (required):
  Future<Response> getManagerWithHttpInfo(String managerId,) async {
    // Verify required params are set.
    if (managerId == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: managerId');
    }

    // ignore: prefer_const_declarations
    final path = r'/admin/manager';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_convertParametersForCollectionFormat('', 'managerId', managerId));

    const authNames = <String>['Token'];
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

  /// Parameters:
  ///
  /// * [String] managerId (required):
  Future<User?> getManager(String managerId,) async {
    final response = await getManagerWithHttpInfo(managerId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'User',) as User?;
    
    }
    return Future<User>.value();
  }

  /// Performs an HTTP 'PUT /admin/manager' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [User] managerDetails:
  Future<Response> updateManagerWithHttpInfo({ User? managerDetails, }) async {
    // Verify required params are set.

    // ignore: prefer_const_declarations
    final path = r'/admin/manager';

    // ignore: prefer_final_locals
    Object? postBody = managerDetails;

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

  /// Parameters:
  ///
  /// * [User] managerDetails:
  Future<User?> updateManager({ User? managerDetails, }) async {
    final response = await updateManagerWithHttpInfo( managerDetails: managerDetails, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'User',) as User?;
    
    }
    return Future<User>.value();
  }
}
