
 import 'package:pc_task/core/error/status_request.dart';

handlingData(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.hasData;
  }
}
