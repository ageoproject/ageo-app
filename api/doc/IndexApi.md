# ageoClient.api.IndexApi

## Load the API package
```dart
import 'package:ageoClient/api.dart';
```

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**loginAPI**](IndexApi.md#loginapi) | **POST** /login | Login api for System admin and managers
[**reportEvents**](IndexApi.md#reportevents) | **POST** /report_event | Report events


# **loginAPI**
> loginAPI(loginRequest)

Login api for System admin and managers

### Example
```dart
import 'package:ageoClient/api.dart';

final api_instance = IndexApi();
final loginRequest = LoginRequest(); // LoginRequest | 

try {
    api_instance.loginAPI(loginRequest);
} catch (e) {
    print('Exception when calling IndexApi->loginAPI: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **loginRequest** | [**LoginRequest**](LoginRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reportEvents**
> EventReportResponse reportEvents(eventReport)

Report events

### Example
```dart
import 'package:ageoClient/api.dart';

final api_instance = IndexApi();
final eventReport = Event(); // Event | 

try {
    final result = api_instance.reportEvents(eventReport);
    print(result);
} catch (e) {
    print('Exception when calling IndexApi->reportEvents: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventReport** | [**Event**](Event.md)|  | 

### Return type

[**EventReportResponse**](EventReportResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

