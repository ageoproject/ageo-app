# ageoClient.api.UserApi

## Load the API package
```dart
import 'package:ageoClient/api.dart';
```

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**changePassword**](UserApi.md#changepassword) | **PUT** /user/change_password | Change login user password
[**changePreferredLanguage**](UserApi.md#changepreferredlanguage) | **PUT** /user/change_preferred_language | Change user's preferred language
[**changeUserStatus**](UserApi.md#changeuserstatus) | **PUT** /user/change_user_status | Change user's Status eg. ACTIVE or INACTIVE
[**updateEvent**](UserApi.md#updateevent) | **PUT** /user/update_event | Update Status of Reported Events


# **changePassword**
> changePassword(changePassword)

Change login user password

### Example
```dart
import 'package:ageoClient/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api_instance = UserApi();
final changePassword = ChangePassword(); // ChangePassword | 

try {
    api_instance.changePassword(changePassword);
} catch (e) {
    print('Exception when calling UserApi->changePassword: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **changePassword** | [**ChangePassword**](ChangePassword.md)|  | 

### Return type

void (empty response body)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **changePreferredLanguage**
> changePreferredLanguage(changePreferredLanguage)

Change user's preferred language

### Example
```dart
import 'package:ageoClient/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api_instance = UserApi();
final changePreferredLanguage = InlineObject1(); // InlineObject1 | 

try {
    api_instance.changePreferredLanguage(changePreferredLanguage);
} catch (e) {
    print('Exception when calling UserApi->changePreferredLanguage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **changePreferredLanguage** | [**InlineObject1**](InlineObject1.md)|  | 

### Return type

void (empty response body)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **changeUserStatus**
> changeUserStatus(changeUserStatus)

Change user's Status eg. ACTIVE or INACTIVE

### Example
```dart
import 'package:ageoClient/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api_instance = UserApi();
final changeUserStatus = InlineObject2(); // InlineObject2 | 

try {
    api_instance.changeUserStatus(changeUserStatus);
} catch (e) {
    print('Exception when calling UserApi->changeUserStatus: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **changeUserStatus** | [**InlineObject2**](InlineObject2.md)|  | 

### Return type

void (empty response body)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateEvent**
> updateEvent(updateEventRequest)

Update Status of Reported Events

### Example
```dart
import 'package:ageoClient/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api_instance = UserApi();
final updateEventRequest = UpdateEventRequest(); // UpdateEventRequest | 

try {
    api_instance.updateEvent(updateEventRequest);
} catch (e) {
    print('Exception when calling UserApi->updateEvent: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updateEventRequest** | [**UpdateEventRequest**](UpdateEventRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

