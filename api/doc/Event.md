# ageoClient.model.Event

## Load the model package
```dart
import 'package:ageoClient/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | [optional] 
**eventId** | **String** |  | [optional] 
**eventType** | **String** |  | [optional] 
**time** | **String** |  | [optional] 
**status** | **String** |  | [optional] [default to 'PENDING']
**image** | **List<String>** |  | [optional] [default to const []]
**quickReport** | **bool** |  | [optional] [default to false]
**comment** | **String** |  | [optional] 
**location** | [**EventLocation**](EventLocation.md) |  | [optional] 
**city** | **String** |  | [optional] 
**state** | **String** |  | [optional] 
**country** | **String** |  | [optional] 
**sensorData** | [**Object**](.md) |  | [optional] 
**commonEventDetails** | [**Object**](.md) |  | [optional] 
**customEventDetails** | [**Object**](.md) |  | [optional] 
**verifyBy** | [**User**](User.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


