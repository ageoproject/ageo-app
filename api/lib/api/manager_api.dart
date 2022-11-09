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

  /// Download Excel file of events
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [InlineObject6] filters:
  Future<Response> downloadExcelWithHttpInfo({ InlineObject6? filters, }) async {
    // Verify required params are set.

    // ignore: prefer_const_declarations
    final path = r'/manager/download_excel';

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
  /// * [InlineObject6] filters:
  Future<MultipartFile?> downloadExcel({ InlineObject6? filters, }) async {
    final response = await downloadExcelWithHttpInfo( filters: filters, );
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
