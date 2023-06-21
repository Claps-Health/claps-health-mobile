import 'package:app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  Widget _buildBody() {
    return <Widget>[
      const SizedBox(height: Constants.defaultSpaceSize * 6),
      const NavBackTitle(title: "Profile"),
      const SizedBox(height: Constants.defaultSpaceSize * 3),
      Text("Please update your profile", style: AppTextStyles.profileGrayText)
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize * 3),
      const BlueDotItem(title: "Experience all app functions")
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const BlueDotItem(title: "Receive basic airdrop of Health Points")
          .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2),
      const SizedBox(height: Constants.defaultSpaceSize * 3),
      Obx(() => AppDropdownButton(
            itemTitle: "Year of Birth",
            menuItems: controller.yearList.toList(),
            hintText: controller.hintYear.value,
            onChangeFn: controller.onYearChange,
            dropdownWidth: Get.width - Constants.defaultSpaceSize * 4,
          )),
      const SizedBox(height: Constants.defaultSpaceSize * 2),
      Obx(() => AppDropdownButton(
            itemTitle: "Gender",
            menuItems: controller.genderList,
            hintText: controller.hintGender.value,
            onChangeFn: controller.onGenderChange,
            dropdownWidth: Get.width - Constants.defaultSpaceSize * 4,
          )),
      const SizedBox(height: Constants.defaultSpaceSize * 2),
      Obx(() => AppDropdownButton(
            itemTitle: "Living Area",
            menuItems: controller.livingAreaList.toList(),
            hintText: controller.hintLivingArea.value,
            onChangeFn: controller.onLivingAreaChange,
            dropdownWidth: Get.width - Constants.defaultSpaceSize * 4,
          )),
      const SizedBox(height: Constants.defaultSpaceSize * 2),
      Obx(() => AppDropdownButton(
            itemTitle: "City",
            menuItems: controller.cityList.toList(),
            hintText: controller.hintCity.value,
            onChangeFn: controller.onCityChange,
            dropdownWidth: Get.width - Constants.defaultSpaceSize * 4,
          )),
      const SizedBox(height: Constants.defaultSpaceSize * 12),
      mainElevatedButton(onPressed: controller.onUpdateTap, text: "Update"),
      const SizedBox(height: Constants.defaultSpaceSize * 5),
    ]
        .toColumn(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
        )
        .marginSymmetric(horizontal: Constants.defaultSpaceSize * 2)
        .scrollable();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ProfileController(),
      builder: (controller) => Scaffold(
        body: _buildBody().gradientBody(),
      ),
    );
  }
}
