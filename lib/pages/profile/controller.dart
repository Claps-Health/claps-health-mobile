import 'dart:core';

import 'package:app/common/index.dart';
import 'package:app/common/models/api_model/profile_update_model.dart';
import 'package:country_state_city/country_state_city.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxList<KeyValueModel> yearList = <KeyValueModel>[].obs;
  RxString hintYear = "".obs;

  final List<KeyValueModel> genderList = [
    KeyValueModel(key: "Male", value: "Male"),
    KeyValueModel(key: "Female", value: "Female"),
  ];
  RxString hintGender = "".obs;

  RxList<KeyValueModel> livingAreaList = <KeyValueModel>[].obs;
  RxString hintLivingArea = "".obs;

  RxList<KeyValueModel> cityList = <KeyValueModel>[].obs;
  RxString hintCity = "".obs;

  @override
  void onInit() {
    initYearData();
    getAllCountries().then((value) {
      livingAreaList.value = value
          .map((e) => KeyValueModel(key: e.isoCode, value: e.name))
          .toList();
    });
    updateHintValues();
    super.onInit();
  }

  void updateHintValues() {
    hintYear.value =
        (ConfigService.to.myUserInfo?.yearOfBirth ?? "").toString();
    hintGender.value = ConfigService.to.myUserInfo?.gender ?? "";
    hintLivingArea.value = ConfigService.to.myUserInfo?.livingCountry ?? "";
    hintCity.value = ConfigService.to.myUserInfo?.livingCity ?? "";
  }

  void initYearData() {
    int yearNow = DateTime.now().year;
    yearList.value = List.generate(100, (index) {
      String content = (yearNow - index).toString();
      return KeyValueModel(key: content, value: content);
    });
  }

  void onYearChange(KeyValueModel? kv) {
    hintYear.value = kv?.value ?? "";
  }

  void onGenderChange(KeyValueModel? kv) {
    hintGender.value = kv?.value ?? "";
  }

  void onLivingAreaChange(KeyValueModel? kv) {
    hintLivingArea.value = kv?.value ?? "";
    hintCity.value = "";

    if (kv?.key == null) {
      return;
    }

    loadCityList(kv!.key);
  }

  Future<void> loadCityList(String countryCode) async {
    Loading.show();
    List<City> allCities = await getCountryCities(countryCode);
    cityList.value = allCities
        .map((e) => KeyValueModel(key: e.name, value: e.name))
        .toList();
    await Loading.dismiss();
  }

  void onCityChange(KeyValueModel? kv) {
    hintCity.value = kv?.value ?? "";
  }

  Future<void> onUpdateTap() async {
    if (hintYear.value.isNotEmpty &&
        hintGender.value.isNotEmpty &&
        hintLivingArea.value.isNotEmpty &&
        (cityList.isEmpty || hintCity.value.isNotEmpty)) {
      Loading.show();
      ProfileUpdateApi.handleUpdateProfile(ProfileUpdateModel(
          yearOfBirth: int.tryParse(hintYear.value) ?? DateTime.now().year,
          gender: hintGender.value,
          livingCountry: hintLivingArea.value,
          livingCity: hintCity.value));
      await Loading.dismiss();
      Get.back();
      Loading.toast("Update successfully");
    } else {
      Loading.toast("Please make sure all fields are selected");
    }
  }
}
