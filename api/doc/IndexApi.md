# ageoClient.api.IndexApi

## Load the API package
```dart
import 'package:ageoClient/api.dart';
```

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getDatatableEventList**](IndexApi.md#getdatatableeventlist) | **POST** /anonymous/get_datatable_event_list | Get paginated list of events
[**getEventDetails**](IndexApi.md#geteventdetails) | **GET** /anonymous/get_event_details | Get details of an event
[**getMapEventList**](IndexApi.md#getmapeventlist) | **POST** /anonymous/get_map_event_list | Get list of events for map view
[**questionMasterList**](IndexApi.md#questionmasterlist) | **GET** /anonymous/question_master_list | Get master list of event questions
[**reportEvent**](IndexApi.md#reportevent) | **POST** /anonymous/report_event | Report events


# **getDatatableEventList**
> InlineResponse200 getDatatableEventList(eventType, eventStatus, fromDate, toDate, datatableoptions)

Get paginated list of events

### Example
```dart
import 'package:ageoClient/api.dart';

final api_instance = IndexApi();
final eventType = eventType_example; // String | 
final eventStatus = eventStatus_example; // String | 
final fromDate = 8.14; // num | 
final toDate = 8.14; // num | 
final datatableoptions = Object(); // Object | 

try {
    final result = api_instance.getDatatableEventList(eventType, eventStatus, fromDate, toDate, datatableoptions);
    print(result);
} catch (e) {
    print('Exception when calling IndexApi->getDatatableEventList: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventType** | **String**|  | [optional] 
 **eventStatus** | **String**|  | [optional] 
 **fromDate** | **num**|  | [optional] 
 **toDate** | **num**|  | [optional] 
 **datatableoptions** | **Object**|  | [optional] 

### Return type

[**InlineResponse200**](InlineResponse200.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getEventDetails**
> Event getEventDetails(eventId)

Get details of an event

### Example
```dart
import 'package:ageoClient/api.dart';

final api_instance = IndexApi();
final eventId = eventId_example; // String | 

try {
    final result = api_instance.getEventDetails(eventId);
    print(result);
} catch (e) {
    print('Exception when calling IndexApi->getEventDetails: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **String**|  | 

### Return type

[**Event**](Event.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMapEventList**
> List<Event> getMapEventList(eventType, eventStatus, fromDate, toDate, polygon)

Get list of events for map view

### Example
```dart
import 'package:ageoClient/api.dart';

final api_instance = IndexApi();
final eventType = eventType_example; // String | 
final eventStatus = eventStatus_example; // String | 
final fromDate = 8.14; // num | 
final toDate = 8.14; // num | 
final polygon = [List<List<num>>()]; // List<List<num>> | 

try {
    final result = api_instance.getMapEventList(eventType, eventStatus, fromDate, toDate, polygon);
    print(result);
} catch (e) {
    print('Exception when calling IndexApi->getMapEventList: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventType** | **String**|  | [optional] 
 **eventStatus** | **String**|  | [optional] 
 **fromDate** | **num**|  | [optional] 
 **toDate** | **num**|  | [optional] 
 **polygon** | [**List<List<num>>**](List.md)|  | [optional] 

### Return type

[**List<Event>**](Event.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **questionMasterList**
> Object questionMasterList()

Get master list of event questions

### Example
```dart
import 'package:ageoClient/api.dart';

final api_instance = IndexApi();

try {
    final result = api_instance.questionMasterList();
    print(result);
} catch (e) {
    print('Exception when calling IndexApi->questionMasterList: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reportEvent**
> Event reportEvent(eventReport)

Report events

### Example
```dart
import 'package:ageoClient/api.dart';

final api_instance = IndexApi();
final eventReport = Event(); // Event | 

try {
    final result = api_instance.reportEvent(eventReport);
    print(result);
} catch (e) {
    print('Exception when calling IndexApi->reportEvent: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventReport** | [**Event**](Event.md)|  | 

### Return type

[**Event**](Event.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

