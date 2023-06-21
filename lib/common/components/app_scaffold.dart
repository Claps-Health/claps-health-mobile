import 'package:flutter/material.dart';

class AppScaffold extends Scaffold {
  const AppScaffold(
      {super.key, super.appBar, super.body, super.bottomNavigationBar})
      : super(extendBodyBehindAppBar: true);
}
