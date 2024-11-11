
import 'package:pc_task/core/utils/typedef_helper.dart';

abstract class ApiConsumer {
  //get data from database
  ResultFuture get(
      {required String path,
      Map<String, String>? headers,
      Map<String, dynamic>? data,
      Map<String, String>? queryParameters});

// send data to database
  ResultFuture post({
    required String path,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  });

//update data but is excited
  ResultFuture patch({
    required String path,
    Map<String, dynamic>? data,
    Map<String, String>? queryParameters,
  });

//update data and if data excited will update not excited will create it
  ResultFuture put(
      {required String path,
      Map<String, dynamic>? data,
      Map<String, String>? headers,
      Map<String, String>? queryParameters});

//delete data from database
  ResultFuture delete({
    required String path,
    Map<String, String>? queryParameters,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  });
}
