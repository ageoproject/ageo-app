# ageoClient.api.AdminApi

## Load the API package
```dart
import 'package:ageoClient/api.dart';
```

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addManager**](AdminApi.md#addmanager) | **POST** /admin/manager | 
[**changeApiuserStatus**](AdminApi.md#changeapiuserstatus) | **PUT** /admin/change_apiuser_status | 
[**downloadApiuserList**](AdminApi.md#downloadapiuserlist) | **POST** /admin/download_apiuser_list | Download Excel file of api users
[**downloadManagerList**](AdminApi.md#downloadmanagerlist) | **POST** /admin/download_manager_list | Download Excel file of managers
[**getDatatableApiuserList**](AdminApi.md#getdatatableapiuserlist) | **POST** /admin/get_datatable_apiuser_list | 
[**getDatatableManagerList**](AdminApi.md#getdatatablemanagerlist) | **POST** /admin/get_datatable_manager_list | 
[**getManager**](AdminApi.md#getmanager) | **GET** /admin/manager | 
[**updateManager**](AdminApi.md#updatemanager) | **PUT** /admin/manager | 


# **addManager**
> User addManager(managerDetails)



### Example
```dart
import 'package:ageoClient/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api_instance = AdminApi();
final managerDetails = User(); // User | 

try {
    final result = api_instance.addManager(managerDetails);
    print(result);
} catch (e) {
    print('Exception when calling AdminApi->addManager: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **managerDetails** | [**User**](User.md)|  | [optional] 

### Return type

[**User**](User.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **changeApiuserStatus**
> changeApiuserStatus(userId, newStatus)



### Example
```dart
import 'package:ageoClient/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api_instance = AdminApi();
final userId = userId_example; // String | 
final newStatus = newStatus_example; // String | 

try {
    api_instance.changeApiuserStatus(userId, newStatus);
} catch (e) {
    print('Exception when calling AdminApi->changeApiuserStatus: $e\n');
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

# **downloadApiuserList**
> MultipartFile downloadApiuserList(filters)

Download Excel file of api users

### Example
```dart
import 'package:ageoClient/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api_instance = AdminApi();
final filters = InlineObject6(); // InlineObject6 | 

try {
    final result = api_instance.downloadApiuserList(filters);
    print(result);
} catch (e) {
    print('Exception when calling AdminApi->downloadApiuserList: $e\n');
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

# **downloadManagerList**
> MultipartFile downloadManagerList(filters)

Download Excel file of managers

### Example
```dart
import 'package:ageoClient/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api_instance = AdminApi();
final filters = InlineObject5(); // InlineObject5 | 

try {
    final result = api_instance.downloadManagerList(filters);
    print(result);
} catch (e) {
    print('Exception when calling AdminApi->downloadManagerList: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **filters** | [**InlineObject5**](InlineObject5.md)|  | [optional] 

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

final api_instance = AdminApi();
final datatableoptions = Object(); // Object | 

try {
    api_instance.getDatatableApiuserList(datatableoptions);
} catch (e) {
    print('Exception when calling AdminApi->getDatatableApiuserList: $e\n');
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

final api_instance = AdminApi();
final datatableoptions = Object(); // Object | 

try {
    api_instance.getDatatableManagerList(datatableoptions);
} catch (e) {
    print('Exception when calling AdminApi->getDatatableManagerList: $e\n');
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

# **getManager**
> User getManager(managerId)



### Example
```dart
import 'package:ageoClient/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api_instance = AdminApi();
final managerId = managerId_example; // String | 

try {
    final result = api_instance.getManager(managerId);
    print(result);
} catch (e) {
    print('Exception when calling AdminApi->getManager: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **managerId** | **String**|  | 

### Return type

[**User**](User.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateManager**
> User updateManager(managerDetails)



### Example
```dart
import 'package:ageoClient/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api_instance = AdminApi();
final managerDetails = User(); // User | 

try {
    final result = api_instance.updateManager(managerDetails);
    print(result);
} catch (e) {
    print('Exception when calling AdminApi->updateManager: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **managerDetails** | [**User**](User.md)|  | [optional] 

### Return type

[**User**](User.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

