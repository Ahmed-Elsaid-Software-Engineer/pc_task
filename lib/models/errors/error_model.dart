class ErrorModel {
  late String _code;
  late String _message;

  ErrorModel({required String code, required String message}) {
    _code = code;
    _message = message;
  }

  String get code => _code;

  set code(String value) {
    _code = value;
  }

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(code: json['code'], message: json['message']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = _code;
    data['message'] = _message;
    return data;
  }

  String get message => _message;

  set message(String value) {
    _message = value;
  }
}
