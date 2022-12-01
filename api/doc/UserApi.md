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
[**refreshApiKey**](UserApi.md#refreshapikey) | **PUT** /user/refresh_apikey | Refresh API key for user


# **changePassword**
> changePassword(oldPassword, newPassword)

Change login user password

### Example
```dart
import 'package:ageoClient/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api_instance = UserApi();
final oldPassword = oldPassword_example; // String | 
final newPassword = newPassword_example; // String | 

try {
    api_instance.changePassword(oldPassword, newPassword);
} catch (e) {
    print('Exception when calling UserApi->changePassword: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oldPassword** | **String**|  | 
 **newPassword** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: Not defined
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

# **refreshApiKey**
> LoginResponse refreshApiKey()

Refresh API key for user

### Example
```dart
import 'package:ageoClient/api.dart';
// TODO Configure API key authorization: Token
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('Token').apiKeyPrefix = 'Bearer';

final api_instance = UserApi();

try {
    final result = api_instance.refreshApiKey();
    print(result);
} catch (e) {
    print('Exception when calling UserApi->refreshApiKey: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**LoginResponse**](LoginResponse.md)

### Authorization

[Token](../README.md#Token)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

