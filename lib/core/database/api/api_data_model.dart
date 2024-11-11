class ApiDataModel {
  late int _statusRequest;
  late Map _data;

  ApiDataModel({required int statusRequest, required Map data}) {
    _statusRequest = statusRequest;
    _data = data;
  }

  int get statusRequest => _statusRequest;

  set statusRequest(int value) {
    _statusRequest = value;
  }

  Map get data => _data;

  set data(Map value) {
    _data = value;
  }
}
