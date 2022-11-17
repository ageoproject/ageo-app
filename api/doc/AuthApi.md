# ageoClient.api.AuthApi

## Load the API package
```dart
import 'package:ageoClient/api.dart';
```

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**forgotPassword**](AuthApi.md#forgotpassword) | **POST** /auth/forgot_password | Initiating forget password
[**login**](AuthApi.md#login) | **POST** /auth/login | Login
[**recoverPasswordRequest**](AuthApi.md#recoverpasswordrequest) | **POST** /auth/recover_password_request | Reset Password
[**resetPassword**](AuthApi.md#resetpassword) | **POST** /auth/reset_password | Reset Password Request
[**signup**](AuthApi.md#signup) | **POST** /auth/signup | Sign up


# **forgotPassword**
> String forgotPassword(email)

Initiating forget password

### Example
```dart
import 'package:ageoClient/api.dart';

final api_instance = AuthApi();
final email = email_example; // String | 

try {
    final result = api_instance.forgotPassword(email);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->forgotPassword: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **String**|  | 

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **login**
> LoginResponse login(loginRequest)

Login

### Example
```dart
import 'package:ageoClient/api.dart';

final api_instance = AuthApi();
final loginRequest = InlineObject2(); // InlineObject2 | 

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
 **loginRequest** | [**InlineObject2**](InlineObject2.md)|  | [optional] 

### Return type

[**LoginResponse**](LoginResponse.md)

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

# **resetPassword**
> String resetPassword(signupRequest)

Reset Password Request

### Example
```dart
import 'package:ageoClient/api.dart';

final api_instance = AuthApi();
final signupRequest = InlineObject4(); // InlineObject4 | 

try {
    final result = api_instance.resetPassword(signupRequest);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->resetPassword: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **signupRequest** | [**InlineObject4**](InlineObject4.md)|  | [optional] 

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **signup**
> LoginResponse signup(signupRequest)

Sign up

### Example
```dart
import 'package:ageoClient/api.dart';

final api_instance = AuthApi();
final signupRequest = InlineObject3(); // InlineObject3 | 

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
 **signupRequest** | [**InlineObject3**](InlineObject3.md)|  | [optional] 

### Return type

[**LoginResponse**](LoginResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

