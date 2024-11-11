import 'dart:convert';

import 'package:dartz/dartz.dart'; 
import 'package:http/http.dart' as http;
import 'package:pc_task/core/database/api/api_consumer.dart';
import 'package:pc_task/core/database/api/api_data_model.dart';
import 'package:pc_task/core/error/status_request.dart';
import 'package:pc_task/core/helper/connectivity_status.dart';
import 'package:pc_task/core/resources/const_values.dart';
import 'package:pc_task/core/utils/typedef_helper.dart';

class HttpConsumer extends ApiConsumer {

  @override
  ResultFuture get(
      {required String path,
      Map<String, dynamic>? data,
      Map<String, String>? headers,
      Map<String, String>? queryParameters}) async {
    try {
      if (await ConnectivityStatus.checkConnectionInternet()) {
        var response = await http.get(
          Uri.parse(path).replace(queryParameters: queryParameters),
        );

        // Successful responses (200 – 299)
        // Client error responses (400 – 499)
        if (response.statusCode >= ConstValues.k200 &&
                response.statusCode <= ConstValues.k299 ||
            response.statusCode >= ConstValues.k400 &&
                response.statusCode <= ConstValues.k499) {
          Map responseBody = {};
          responseBody = jsonDecode(response.body);
          //that all data was correct and inserted
          return Right(ApiDataModel(
              statusRequest: response.statusCode, data: responseBody));
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.failure);
      }
    } catch (ex) {
      return const Left(StatusRequest.serverFailure);
    }
  }

  @override
  ResultFuture patch({required String path, Map? data, Map? queryParameters}) {
    // TODO: implement patch
    throw UnimplementedError();
  }
 
  @override
  ResultFuture delete({required String path, Map<String, String>? queryParameters, Map<String, dynamic>? body, Map<String, String>? headers}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  ResultFuture post({required String path, Map<String, dynamic>? body, Map<String, String>? headers}) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  ResultFuture put({required String path, Map<String, dynamic>? data, Map<String, String>? headers, Map<String, String>? queryParameters}) {
    // TODO: implement put
    throw UnimplementedError();
  }
}
/*
*
* DioErrorType.CONNECT_TIMEOUT: The connection timeout error occurs when the client fails to establish a connection to the server within the specified timeout duration.

DioErrorType.SEND_TIMEOUT: The send timeout error occurs when the client fails to send the request to the server within the specified timeout duration.

DioErrorType.RECEIVE_TIMEOUT: The receive timeout error occurs when the client fails to receive a response from the server within the specified timeout duration.

DioErrorType.RESPONSE: The response error occurs when the server responds with an error status code (e.g., 4xx or 5xx) or if the response cannot be processed.

DioErrorType.CANCEL: The request cancellation error occurs when the request is canceled before completing.

DioErrorType.DEFAULT: The default error type, representing any other type of error not covered by the specific cases above.

DioErrorType.CANCEL: The request cancellation error occurs when the request is canceled before completing.

DioErrorType.CONNECT_ERROR: The connection error occurs when there is an error establishing a connection to the server.

DioErrorType.RESPONSE: The response error occurs when the server responds with an error status code (e.g., 4xx or 5xx) or if the response cannot be processed.

DioErrorType.DEFAULT: The default error type, representing any other type of error not covered by the specific cases above.
* */
