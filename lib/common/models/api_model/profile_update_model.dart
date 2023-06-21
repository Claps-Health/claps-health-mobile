// {
// "year_of_birth": 1990,
// "gender": "Male",
// "living_country": "USA",
// "living_city": "San francisco"
// }

class ProfileUpdateModel {
  int yearOfBirth;
  String gender;
  String livingCountry;
  String livingCity;

  ProfileUpdateModel({
    required this.yearOfBirth,
    required this.gender,
    required this.livingCountry,
    required this.livingCity,
  });

  factory ProfileUpdateModel.fromJson(Map<String, dynamic> json) {
    return ProfileUpdateModel(
      yearOfBirth: json['year_of_birth'] as int,
      gender: json['gender'] as String,
      livingCountry: json['living_country'] as String,
      livingCity: json['living_city'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'year_of_birth': yearOfBirth,
        'gender': gender,
        'living_country': livingCountry,
        'living_city': livingCity,
      };
}
