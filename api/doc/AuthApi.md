# ageoClient.api.AuthApi

## Load the API package
```dart
import 'package:ageoClient/api.dart';
```

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**forgetPasswordRequest**](AuthApi.md#forgetpasswordrequest) | **POST** /auth/forget_password_request | Initiating forget password
[**login**](AuthApi.md#login) | **POST** /auth/login | Login
[**recoverPasswordRequest**](AuthApi.md#recoverpasswordrequest) | **POST** /auth/recover_password_request | Reset Password


# **forgetPasswordRequest**
> Object forgetPasswordRequest(email)

Initiating forget password

### Example
```dart
import 'package:ageoClient/api.dart';

final api_instance = AuthApi();
final email = email_example; // String | 

try {
    final result = api_instance.forgetPasswordRequest(email);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->forgetPasswordRequest: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **String**|  | 

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **login**
> LoginResponce login()

Login

### Example
```dart
import 'package:ageoClient/api.dart';

final api_instance = AuthApi();

try {
    final result = api_instance.login();
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->login: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**LoginResponce**](LoginResponce.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **recoverPasswordRequest**
> recoverPasswordRequest()

Reset Password

### Example
```dart
import 'package:ageoClient/api.dart';

final api_instance = AuthApi();

try {
    api_instance.recoverPasswordRequest();
} catch (e) {
    print('Exception when calling AuthApi->recoverPasswordRequest: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

