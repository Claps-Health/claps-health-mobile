// {
// "did": "0xf407beb5eb86963ce7d2994f46bb162c62e4612c8b58262acc0c5409a075fc3a",
// "year_of_birth": "male",
// "gender": "male",
// "living_country": "USA",
// "living_city": "San Francisco",
// "account_level": 2,
// "date_created": 2,
// "date_updated": 2
// }

class UserInfoModel {
  String? did;
  int? yearOfBirth;
  String? gender;
  String? livingCountry;
  String? livingCity;
  int? accountLevel;
  int? dateCreated;
  int? dateUpdated;

  UserInfoModel({
    this.did,
    this.yearOfBirth,
    this.gender,
    this.livingCountry,
    this.livingCity,
    this.accountLevel,
    this.dateCreated,
    this.dateUpdated,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        did: json['did'] as String?,
        yearOfBirth: json['year_of_birth'] as int?,
        gender: json['gender'] as String?,
        livingCountry: json['living_country'] as String?,
        livingCity: json['living_city'] as String?,
        accountLevel: json['account_level'] as int?,
        dateCreated: json['date_created'] as int?,
        dateUpdated: json['date_updated'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'did': did,
        'year_of_birth': yearOfBirth,
        'gender': gender,
        'living_country': livingCountry,
        'living_city': livingCity,
        'account_level': accountLevel,
        'date_created': dateCreated,
        'date_updated': dateUpdated,
      };
}
