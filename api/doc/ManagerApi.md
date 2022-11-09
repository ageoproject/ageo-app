# ageoClient.api.ManagerApi

## Load the API package
```dart
import 'package:ageoClient/api.dart';
```

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**downloadExcel**](ManagerApi.md#downloadexcel) | **POST** /manager/download_excel | Download Excel file of events


# **downloadExcel**
> MultipartFile downloadExcel(filters)

Download Excel file of events

### Example
```dart
import 'package:ageoClient/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api_instance = ManagerApi();
final filters = InlineObject6(); // InlineObject6 | 

try {
    final result = api_instance.downloadExcel(filters);
    print(result);
} catch (e) {
    print('Exception when calling ManagerApi->downloadExcel: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **filters** | [**InlineObject6**](InlineObject6.md)|  | [optional] 

### Return type

[**MultipartFile**](MultipartFile.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/octet-stream, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

