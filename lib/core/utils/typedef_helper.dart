import 'package:dartz/dartz.dart';
import 'package:pc_task/core/database/api/api_data_model.dart';
import 'package:pc_task/core/error/status_request.dart';

typedef ResultFuture = Future<Either<StatusRequest, ApiDataModel>>;
