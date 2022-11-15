# ageoClient.api.ManagerApi

## Load the API package
```dart
import 'package:ageoClient/api.dart';
```

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**changeEventStatus**](ManagerApi.md#changeeventstatus) | **PUT** /manager/change_event_status | 
[**changeUserStatus**](ManagerApi.md#changeuserstatus) | **POST** /manager/change_user_status | 
[**downloadEventList**](ManagerApi.md#downloadeventlist) | **POST** /manager/download_event_list | Download Excel file of events
[**getDatatableApiuserList**](ManagerApi.md#getdatatableapiuserlist) | **POST** /manager/get_datatable_apiuser_list | 
[**getDatatableManagerList**](ManagerApi.md#getdatatablemanagerlist) | **POST** /manager/get_datatable_manager_list | 


# **changeEventStatus**
> changeEventStatus(newStatus, eventId)



### Example
```dart
import 'package:ageoClient/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api_instance = ManagerApi();
final newStatus = newStatus_example; // String | 
final eventId = eventId_example; // String | 

try {
    api_instance.changeEventStatus(newStatus, eventId);
} catch (e) {
    print('Exception when calling ManagerApi->changeEventStatus: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **newStatus** | **String**|  | 
 **eventId** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **changeUserStatus**
> changeUserStatus(userId, newStatus)



### Example
```dart
import 'package:ageoClient/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api_instance = ManagerApi();
final userId = userId_example; // String | 
final newStatus = newStatus_example; // String | 

try {
    api_instance.changeUserStatus(userId, newStatus);
} catch (e) {
    print('Exception when calling ManagerApi->changeUserStatus: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | 
 **newStatus** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **downloadEventList**
> MultipartFile downloadEventList(filters)

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
    final result = api_instance.downloadEventList(filters);
    print(result);
} catch (e) {
    print('Exception when calling ManagerApi->downloadEventList: $e\n');
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

# **getDatatableApiuserList**
> getDatatableApiuserList(datatableoptions)



### Example
```dart
import 'package:ageoClient/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api_instance = ManagerApi();
final datatableoptions = Object(); // Object | 

try {
    api_instance.getDatatableApiuserList(datatableoptions);
} catch (e) {
    print('Exception when calling ManagerApi->getDatatableApiuserList: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **datatableoptions** | **Object**|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDatatableManagerList**
> getDatatableManagerList(datatableoptions)



### Example
```dart
import 'package:ageoClient/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api_instance = ManagerApi();
final datatableoptions = Object(); // Object | 

try {
    api_instance.getDatatableManagerList(datatableoptions);
} catch (e) {
    print('Exception when calling ManagerApi->getDatatableManagerList: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **datatableoptions** | **Object**|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

