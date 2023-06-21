enum Head {
  topHead('Top of the head'),
  forehead('Forehead'),
  templesLeft('Temples (Left)'),
  templesRight('Temples (Right)'),
  backHead('Back of the head (Occipital)'),
  scalp('Scalp'),
  eyesLeft('Eyes (Left)'),
  eyesRight('Eyes (Right)'),
  earsLeft('Ears (Left)'),
  earsRight('Ears (Right)');

  const Head(this.dispName);
  final String dispName;
}

enum Face {
  nose('Nose'),
  cheeksLeft('Cheeks (Left)'),
  cheeksRight('Cheeks (Right)'),
  mouth('Mouth'),
  teeth('Teeth'),
  gums('Gums'),
  throat('Throat'),
  jawLeft('Jaw (Left)'),
  jawRight('Jaw (Right)'),
  frontNeck('Front of the neck'),
  backNeck('Back of the neck'),
  sidesNeck('Sides of the neck');

  const Face(this.dispName);
  final String dispName;
}

enum Shoulder {
  shoulderLeft('Shoulder (Left)'),
  shoulderRight('Shoulder (Right)');

  const Shoulder(this.dispName);
  final String dispName;
}

enum UpperLimbs {
  upperChest('Upper Chest'),
  lowerChest('Lower Chest'),
  breastLeft('Breast (Left)'),
  breastRight('Breast (Right)');

  const UpperLimbs(this.dispName);
  final String dispName;
}

enum Arms {
  upperArmLeft('Upper Arm (Left)'),
  upperArmRight('Upper Arm (Right)'),
  elbowLeft('Elbow (Left)'),
  elbowRight('Elbow (Right)'),
  forearmLeft('Forearm (Left)'),
  forearmRight('Forearm (Right)'),
  wristLeft('Wrist (Left)'),
  wristRight('Wrist (Right)'),
  handLeft('Hand (Left)'),
  handRight('Hand (Right)'),
  fingers('Fingers');

  const Arms(this.dispName);
  final String dispName;
}

enum LowerLimbs {
  thigh('Thigh'),
  knee('Knee'),
  lowerLeg('Lower Leg (Shin/Calf)'),
  ankle('Ankle'),
  foot('Foot'),
  toes('Toes');

  const LowerLimbs(this.dispName);
  final String dispName;
}

enum Hips {
  hips('Hips');

  const Hips(this.dispName);
  final String dispName;
}

enum Abdomen {
  upperAbdomen('Upper Abdomen'),
  lowerAbdomen('Lower Abdomen'),
  leftFlank('Left Flank'),
  rightFlank('Right Flank'),
  navelArea('Navel Area');

  const Abdomen(this.dispName);
  final String dispName;
}

enum BodyParts {
  body('Body'),
  head('Head'),
  face('Face'),
  shoulder('Shoulder'),
  upperLimbs('Upper Limbs'),
  arms('Arms'),
  lowerLimbs('Lower Limbs'),
  hips('Hips'),
  abdomen('Abdomen');

  const BodyParts(this.dispName);
  final String dispName;
}

enum SideDirection { left, right }

enum PainType {
  sharp('Sharp'),
  dull('Dull'),
  throbbing('Throbbing'),
  burning('Burning'),
  stabbing('Stabbing'),
  aching('Aching'),
  tingling('Tingling'),
  swell('Swell'),
  sore('Sore');

  const PainType(this.dispName);
  final String dispName;
}
