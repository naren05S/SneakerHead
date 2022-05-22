import 'package:flutter/material.dart';
import 'package:sneakers_app/constanst.dart';

import 'package:sneakers_app/screens/bag/widget/body.dart';
import 'widget/appbar.dart';

class MyBagScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        // appBar: customAppBarBag(context),
        body: BodyBag(),
      ),
    );
  }
}
