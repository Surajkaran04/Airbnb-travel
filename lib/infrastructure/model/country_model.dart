
import 'api_response_model.dart';

class CountryModel extends Serializable{
  List<Country>? countries;

  CountryModel({this.countries});

  CountryModel.fromJson(Map<String, dynamic> json) {
    if (json['countries'] != null) {
      countries = <Country>[];
      json['countries'].forEach((v) {
        countries!.add(Country.fromJson(v));
      });
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (countries != null) {
      data['countries'] = countries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Country {
  int? id;
  String? name;
  String? dailCode;
  String? code;


  Country({this.id, this.name, this.dailCode, this.code});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    dailCode = json['dial_code'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['dial_code'] = dailCode;
    data['code'] = code;
    return data;
  }
}