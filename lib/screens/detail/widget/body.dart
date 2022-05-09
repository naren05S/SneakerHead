// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sneakers_app/animation/fadeanimation.dart';
import 'package:sneakers_app/constanst.dart';
import 'package:sneakers_app/models/model.dart';
import 'package:sneakers_app/screens/bag/bag_screen.dart';
import 'package:sneakers_app/screens/detail/widget/appbar.dart';

class BodyDe extends StatefulWidget {
  Models model;

  BodyDe({required this.model});

  @override
  _BodyDeState createState() => _BodyDeState();
}

class _BodyDeState extends State<BodyDe> {
  final List<double> sizes = [6, 7.5, 8, 9.5];
  bool _isSelectedCountry = false;
  int? _isSelectedSize;

  void _addToBag({
    required String model,
    required double price,
    required String imgAddress,
    required numOfShoe,
  }) {
    final addedShoe = BagModels(
      model: model,
      price: price,
      imgAddress: imgAddress,
      numOfShoe: numOfShoe,
    );
    setState(() {
      bagModels.add(addedShoe);
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: backgroundColor,
            appBar: customAppBarDe(context),
            body: SingleChildScrollView(
                child: Column(
                  children: [
                    topInformationwidget(width, height),
                    midelImgListWidget(width, height),
                    // SizedBox(
                    //   height: 20,
                    //   width: width / 1.1,
                    //   child: Divider(
                    //     thickness: 1.4,
                    //     color: Colors.grey,
                    //   ),
                    // ),
                    Divider(
                      thickness: 1.4,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      //color: Colors.red, just for debuging
                      child: Column(
                        children: [
                          nameAndPrice(),
                          SizedBox(height: 10),
                          shoeInfo(width, height),
                          SizedBox(
                            height: 5,
                          ),
                          moreDetailsText(width, height),
                          sizeTextAndCountry(width, height),
                          endSizesAndButton(width, height),
                          SizedBox(
                            height: 20,
                          ),
                          materialButton(width, height)
                        ],
                      ),
                    )
                  ],
                ),
            )));
  }

  // Top information Widget Components
  topInformationwidget(width, height) {
    return Container(
      width: width,
      height: height / 2.3,
      child: Stack(
        children: [
          Positioned(
            left: 50,
            bottom: 20,
            child: FadeAnimation(
              delay: 0.5,
              child: Container(
                width: 1000,
                height: height / 2.2,
                decoration: BoxDecoration(
                  color: widget.model.modelColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(1500),
                    bottomRight: Radius.circular(100),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 30,
            child: Hero(
              tag: widget.model.imgAddress,
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(-25 / 360),
                child: Container(
                  width: width / 1.3,
                  height: height / 4.3,
                  child: Image(image: AssetImage(widget.model.imgAddress)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // Rounded Image Widget About Below Methode Components
  roundedimag(width, height) {
    return Container(
      padding: EdgeInsets.all(2),
      width: width / 5,
      height: height / 14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: Image(
        image: AssetImage(widget.model.imgAddress),
      ),
    );
  }

  // Middle Imagw List Widget Components
  midelImgListWidget(width, height) {
    return FadeAnimation(
      delay: 0.5,
      child: Container(
        padding: EdgeInsets.all(2),
        width: width,
        height: height / 11,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            roundedimag(width, height),
            roundedimag(width, height),
            roundedimag(width, height),
            Container(
              padding: EdgeInsets.all(2),
              width: width / 5,
              height: height / 14,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                image: DecorationImage(
                  image: AssetImage(widget.model.imgAddress),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.grey.withOpacity(1), BlendMode.darken),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Icon(
                  Icons.play_circle_fill,
                  color: lightTextColor,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //MaterialButton Components
  materialButton(width, height) {
    return FadeAnimation(
      delay: 3.5,
      child: MaterialButton(
        minWidth: width / 1.2,
        height: height / 15,
        color: materialButtonColor,
        onPressed: () {
          _addToBag(
            model: widget.model.model,
            price: widget.model.price,
            imgAddress: widget.model.imgAddress,
            numOfShoe: 1,
          );
          final snackBar = SnackBar(
              content: const Text('Added To Bag !'),
              action: SnackBarAction(
                label: 'Got it',
                onPressed: () {
                },
              ));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.pop(context);
        },
        child: Text(
          "ADD TO BAG",
          style: TextStyle(color: lightTextColor),
        ),
      ),
    );
  }

  //end section Sizes And Button Components
  endSizesAndButton(width, height) {
    return Container(
      width: width,
      height: height / 14,
      child: FadeAnimation(
        delay: 3,
        child: Row(
          children: [
            Container(
              width: width / 4.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey, width: 1)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Try it",
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    RotatedBox(
                        quarterTurns: -1,
                        child: FaIcon(FontAwesomeIcons.shoePrints))
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Container(
                width: width / 5,
                child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _isSelectedSize = index;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 5),
                          width: width / 4.4,
                          height: height / 13,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: _isSelectedSize == index
                                    ? Colors.black
                                    : Colors.grey,
                                width: 1.5),
                            color: _isSelectedSize == index
                                ? Colors.black
                                : backgroundColor,
                          ),
                          child: Center(
                            child: Text(
                              sizes[index].toString(),
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: _isSelectedSize == index
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }

  //Size Text And Country Button Components
  sizeTextAndCountry(width, height) {
    return FadeAnimation(
      delay: 2.5,
      child: Row(
        children: [
          Text(
            "Size",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: darkTextColor,
              fontSize: 22,
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Container(
            width: width / 5,
            child: TextButton(
              onPressed: () {
                setState(() {
                  _isSelectedCountry = false;
                });
              },
              child: Text(
                "UK",
                style: TextStyle(
                  fontWeight:
                      _isSelectedCountry ? FontWeight.w400 : FontWeight.bold,
                  color: _isSelectedCountry ? Colors.grey : darkTextColor,
                  fontSize: 19,
                ),
              ),
            ),
          ),
          Container(
            width: width / 5,
            child: TextButton(
              onPressed: () {
                setState(() {
                  _isSelectedCountry = true;
                });
              },
              child: Text(
                "USA",
                style: TextStyle(
                  fontWeight:
                      _isSelectedCountry ? FontWeight.bold : FontWeight.w400,
                  color: _isSelectedCountry ? darkTextColor : Colors.grey,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //more detailes Text Components
  moreDetailsText(width, height) {
    return FadeAnimation(
      delay: 2,
      child: Container(
        padding: EdgeInsets.only(right: 280),
        height: height / 26,
        child: FittedBox(
            child: Text(
          'MORE DETAILES',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
              height: 1),
        )),
      ),
    );
  }

  //About Shoe Text Components
  shoeInfo(width, height) {
    return FadeAnimation(
      delay: 1.5,
      child: Container(
        width: width,
        height: height / 9,
        child: Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin tincidunt laoreet enim, eget sodales ligula semper at. Sed id aliquet eros, nec vestibulum felis. Nunc maximus aliquet aliquam. Quisque eget sapien at velit cursus tincidunt. Duis tempor lacinia erat eget fermentum.",
          style: TextStyle(color: Colors.grey[600]),
        ),
      ),
    );
  }

  //Name And Price Text Components
  nameAndPrice() {
    return FadeAnimation(
      delay: 1,
      child: Row(
        children: [
          Text(
            widget.model.model,
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: darkTextColor,
            ),
          ),
          Expanded(child: Container()),
          Text(
            '\$${widget.model.price.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: darkTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
