import 'dart:convert';
import 'package:ageo/model/image_model.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteHelper{

  final String _dbName="AGEO_Observatory.db";
  final String _tableName="CapturedImage";
  late final Database _databaseInstance;

  Database get databaseInstance=>_databaseInstance;

  SQLiteHelper._constructor();
  static final SQLiteHelper _instance=SQLiteHelper._constructor();
  factory SQLiteHelper(){
    return _instance;
  }

  Future<void> initDataBase()async{
    String databasesPath = await getDatabasesPath();
    _databaseInstance= await openDatabase(databasesPath+_dbName,onCreate: _createTable,version: 1);
    // print("Data initialized");
  }

  Future<void> _createTable(Database db, int version)async{
    await db.execute(
        'CREATE TABLE $_tableName (id integer primary key autoincrement, imageHash TEXT not null UNIQUE, imageName TEXT not null , sensorData TEXT not null)');
    // print("table Created successfully");
  }

  Future<void> insertImage({required ImageModel imageModel})async{
    await _databaseInstance.insert(_tableName, {
      "imageHash":imageModel.imageHash,
      "imageName":imageModel.imageName,
      "sensorData":json.encode(imageModel.sensorData),
    });
    // print("Image inserted in DB");
  }

  Future<ImageModel?> getImage({required String hashValue})async{
    // List<Map<String, dynamic>> result=await _databaseInstance.query(_tableName,);
    List<Map<String, dynamic>> result=await _databaseInstance.query(_tableName,where: "imageHash='$hashValue'");
    // print("Length of response => ${result.length} => $result");
    ImageModel? imageModel;
    if(result.isNotEmpty){
      imageModel=ImageModel.fromJson(result.first);
    }
    return imageModel;
  }

  Future<void> deleteImage()async{
    int result=await _databaseInstance.delete(_tableName,where: "id=1");
    // print(result);
  }
  Future<void> deleteTable()async{
    List<Map<String, dynamic>> result=await _databaseInstance.rawQuery("DROP TABLE $_tableName");
    // print(result);
  }
  Future close() async => _databaseInstance.close();
}