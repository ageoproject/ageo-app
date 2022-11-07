# ageoClient.api.IndexApi

## Load the API package
```dart
import 'package:ageoClient/api.dart';
```

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getDatatableEventList**](IndexApi.md#getdatatableeventlist) | **POST** /anonymous/get_datatable_event_list | Get paginated list of events
[**getMapEventList**](IndexApi.md#getmapeventlist) | **POST** /anonymous/get_map_event_list | Get list of events for map view
[**reportEvent**](IndexApi.md#reportevent) | **POST** /anonymous/report_event | Report events


# **getDatatableEventList**
> InlineResponse200 getDatatableEventList(datatableoptions)

Get paginated list of events

### Example
```dart
import 'package:ageoClient/api.dart';

final api_instance = IndexApi();
final datatableoptions = Object(); // Object | 

try {
    final result = api_instance.getDatatableEventList(datatableoptions);
    print(result);
} catch (e) {
    print('Exception when calling IndexApi->getDatatableEventList: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **datatableoptions** | **Object**|  | [optional] 

### Return type

[**InlineResponse200**](InlineResponse200.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMapEventList**
> List<Event> getMapEventList(eventType, eventStatus, fromDate, toDate)

Get list of events for map view

### Example
```dart
import 'package:ageoClient/api.dart';

final api_instance = IndexApi();
final eventType = eventType_example; // String | 
final eventStatus = eventStatus_example; // String | 
final fromDate = fromDate_example; // String | 
final toDate = toDate_example; // String | 

try {
    final result = api_instance.getMapEventList(eventType, eventStatus, fromDate, toDate);
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
 **fromDate** | **String**|  | [optional] 
 **toDate** | **String**|  | [optional] 

### Return type

[**List<Event>**](Event.md)

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

