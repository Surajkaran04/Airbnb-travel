
import 'api_response_model.dart';
import 'country_model.dart';

class UserModel extends Serializable{
  Userdata? userdata;

  UserModel({this.userdata});

  UserModel.fromJson(Map<String, dynamic> json) {
    userdata = json['userdata'] != null
        ? Userdata.fromJson(json['userdata'])
        : null;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (userdata != null) {
      data['userdata'] = userdata!.toJson();
    }
    return data;
  }
}

class Userdata {
  int? id;
  String? name;
  String? employeeID;
  String? email;
  String? mobile;
  String? emailVerifiedAt;
  int? roleId;
  String? status;
  String? deviceType;
  String? deviceToken;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? token;
  Role? role;
  String? profileImage;
  Country? country;

  Userdata(
      {this.id,
        this.name,
        this.employeeID,
        this.email,
        this.mobile,
        this.emailVerifiedAt,
        this.roleId,
        this.status,
        this.deviceType,
        this.deviceToken,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.token,
        this.role,
        this.profileImage,
        this.country
      });

  Userdata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    employeeID = json['employeeID'];
    email = json['email'];
    mobile = json['mobile'];
    emailVerifiedAt = (json['email_verified_at']??'').toString();
    roleId = json['role_id'];
    status = json['status'];
    deviceType = (json['device_type']??'').toString();
    deviceToken =( json['device_token']??'').toString();
    createdAt = (json['created_at']??'').toString();
    updatedAt = (json['updated_at']??'').toString();
    deletedAt = (json['deleted_at']??'').toString();
    token = json['token']??'';
    profileImage = json['profile_image']??'';
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
    country = json['country'] != null ? Country.fromJson(json['country']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['employeeID'] = employeeID;
    data['email'] = email;
    data['mobile'] = mobile;
    data['email_verified_at'] = emailVerifiedAt;
    data['role_id'] = roleId;
    data['status'] = status;
    data['device_type'] = deviceType;
    data['device_token'] = deviceToken;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['token'] = token;
    data['profile_image'] = profileImage;
    if (role != null) {
      data['role'] = role!.toJson();
    }
    if (country != null) {
      data['country'] = country!.toJson();
    }
    return data;
  }
}

class Role {
  int? roleId;
  String? roleName;
  String? createdAt;
  String? updatedAt;

  Role({this.roleId, this.roleName, this.createdAt, this.updatedAt});

  Role.fromJson(Map<String, dynamic> json) {
    roleId = json['role_id'];
    roleName = json['role_name']??'';
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['role_id'] = roleId;
    data['role_name'] = roleName;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}


