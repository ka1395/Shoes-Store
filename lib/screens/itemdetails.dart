import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:shoes_store/Data.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class ItemDetails extends StatelessWidget {
  final String id;

  const ItemDetails(this.id);

  @override
  Widget build(BuildContext context) {
    var item = shoes.firstWhere((element) => element.id == id);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 1, 14, 32),
            Color.fromARGB(255, 2, 29, 67),
            Color.fromARGB(255, 3, 105, 249)
          ],
        )),
        width: double.infinity,
        height: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(children: [
            Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              width: double.infinity,
              height: (MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top) *
                  .45,
              child: Image.asset(
                item.image,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              left: 3,
              top: MediaQuery.of(context).size.height * .035,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Platform.isIOS
                      ? Colors.white
                      : Color.fromARGB(255, 2, 29, 67),
                ),
                child: IconButton(
                    color: Platform.isIOS
                        ? Color.fromARGB(255, 2, 29, 67)
                        : Colors.white,
                    icon: Icon(
                      Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
                      size: 39,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
            ),
          ]),
          Container(
            width: double.infinity,
            height: (MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top) *
                .45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8, left: 10),
                  child: Text(
                    item.name,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8, left: 10),
                  child: RatingStars(
                    maxValue: 5,
                    starSize: 30,
                    value: item.score,
                    valueLabelVisibility: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8, left: 10),
                  child: Text(
                    item.description,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: (MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top) *
                .10,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                    left: 10,
                  ),
                  child: Container(
                    width: 122,
                    child: Text(
                      item.price.toString() + " \$",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Platform.isIOS
                      ? CupertinoButton(
                          color: Colors.white,
                          child: Text(
                            "Buy",
                            style: TextStyle(fontSize: 25, color: Colors.black),
                          ),
                          onPressed: () {
                            CupertinoAlertDialog(
                              content: Container(
                                alignment: Alignment.center,
                                height: 100,
                                width: 100,
                                child: Column(
                                  children: [
                                    Text(
                                      "Buying Successed",
                                      style:
                                          Theme.of(context).textTheme.headline2,
                                    ),
                                    SizedBox(
                                      height: 35,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 60),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Thanks for deal with us",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w800),
                                          ),
                                          FlutterLogo(),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })
                      : MaterialButton(
                          height: 50,
                          minWidth: 200,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7)),
                          color: Colors.white,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return AlertDialog(
                                    elevation: 15,
                                    title: Text(
                                      "Notification",
                                      style:
                                          Theme.of(context).textTheme.headline2,
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    content: Container(
                                      alignment: Alignment.center,
                                      height: 100,
                                      width: 100,
                                      child: Column(
                                        children: [
                                          Divider(
                                            color: Colors.black,
                                          ),
                                          Text(
                                            "Buying Successed",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline2,
                                          ),
                                          SizedBox(
                                            height: 35,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 60),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Thanks for deal with us",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w800),
                                                ),
                                                FlutterLogo(),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Text(
                            "Buy",
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
