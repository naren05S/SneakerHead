import 'package:flutter/material.dart';
import 'package:sneakers_app/constanst.dart';

import 'package:sneakers_app/screens/home/widget/body.dart';
import 'widget/appbar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: customAppBar(),
        body: SingleChildScrollView(child: Body()),
      ),
    );
  }
}
