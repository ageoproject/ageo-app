# ageoClient.api.SuperAdminApi

## Load the API package
```dart
import 'package:ageoClient/api.dart';
```

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createUser**](SuperAdminApi.md#createuser) | **POST** /create_user | Admin creates manager


# **createUser**
> User createUser(userDetails)

Admin creates manager

### Example
```dart
import 'package:ageoClient/api.dart';

final api_instance = SuperAdminApi();
final userDetails = InlineObject(); // InlineObject | 

try {
    final result = api_instance.createUser(userDetails);
    print(result);
} catch (e) {
    print('Exception when calling SuperAdminApi->createUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userDetails** | [**InlineObject**](InlineObject.md)|  | [optional] 

### Return type

[**User**](User.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

