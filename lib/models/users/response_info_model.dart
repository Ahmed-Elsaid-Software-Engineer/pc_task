class ResponseUsersIModel {
  final int? page;
  final int? perPage;
  final int? total;
  final int? totalPages;
  final List<UsersInfoModel>? usersModel;
  final SupportModel? support;

  ResponseUsersIModel(
      {this.page,
      this.perPage,
      this.total,
      this.totalPages,
      this.usersModel,
      this.support});

  factory ResponseUsersIModel.fromJson(Map<String, dynamic> json) {
     return ResponseUsersIModel(
      page: json['page'],
      perPage: json['per_page'],
      total: json['total'],
      totalPages: json['total_pages'],
      usersModel: json['data'] == null
          ? null
          : (json['data'] as List)
              .map(
                (e) => UsersInfoModel.fromJson(e),
              )
              .toList(),
      support: json['support'] != null
          ? SupportModel.fromJson(json['support'])
          : null,
    );
  }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['page'] = this.page;
//   data['per_page'] = this.perPage;
//   data['total'] = this.total;
//   data['total_pages'] = this.totalPages;
//   if (this.data != null) {
//     data['data'] = this.data!.map((v) => v.toJson()).toList();
//   }
//   if (this.support != null) {
//     data['support'] = this.support!.toJson();
//   }
//   return data;
// }
}

class UsersInfoModel {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  UsersInfoModel({this.id, this.email, this.firstName, this.lastName, this.avatar});

  factory UsersInfoModel.fromJson(Map<String, dynamic> json) => UsersInfoModel(
        id: json['id'],
        email: json['email'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        avatar: json['avatar'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['avatar'] = avatar;
    return data;
  }
}

class SupportModel {
  final String? url;
  final String? text;

  SupportModel({this.url, this.text});

  factory SupportModel.fromJson(Map<String, dynamic> json) => SupportModel(
        url: json['url'],
        text: json['text'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['text'] = text;
    return data;
  }
}
