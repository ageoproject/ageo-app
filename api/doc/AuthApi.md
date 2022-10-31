# ageoClient.api.AuthApi

## Load the API package
```dart
import 'package:ageoClient/api.dart';
```

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**forgetPassword**](AuthApi.md#forgetpassword) | **POST** /auth/forget_password | Initiating forget password
[**login**](AuthApi.md#login) | **POST** /auth/login | Login
[**recoverPasswordRequest**](AuthApi.md#recoverpasswordrequest) | **POST** /auth/recover_password_request | Reset Password
[**signup**](AuthApi.md#signup) | **POST** /auth/signup | Sign up


# **forgetPassword**
> Object forgetPassword(email)

Initiating forget password

### Example
```dart
import 'package:ageoClient/api.dart';

final api_instance = AuthApi();
final email = email_example; // String | 

try {
    final result = api_instance.forgetPassword(email);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->forgetPassword: $e\n');
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
> LoginResponce login(loginRequest)

Login

### Example
```dart
import 'package:ageoClient/api.dart';

final api_instance = AuthApi();
final loginRequest = InlineObject3(); // InlineObject3 | 

try {
    final result = api_instance.login(loginRequest);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->login: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **loginRequest** | [**InlineObject3**](InlineObject3.md)|  | [optional] 

### Return type

[**LoginResponce**](LoginResponce.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
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

# **signup**
> LoginResponse signup(signupRequest)

Sign up

### Example
```dart
import 'package:ageoClient/api.dart';

final api_instance = AuthApi();
final signupRequest = InlineObject4(); // InlineObject4 | 

try {
    final result = api_instance.signup(signupRequest);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->signup: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **signupRequest** | [**InlineObject4**](InlineObject4.md)|  | [optional] 

### Return type

[**LoginResponse**](LoginResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

