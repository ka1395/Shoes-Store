import 'package:flutter/material.dart';
import 'package:shoes_store/models/shoes.dart';
import 'package:like_button/like_button.dart';
import 'package:shoes_store/screens/itemdetails.dart';
import 'package:page_transition/page_transition.dart';

class ShoesCard extends StatelessWidget {
  final Shoes shoesItem;

  const ShoesCard(this.shoesItem);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.grey, width: 3)),
        elevation: 50,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: LikeButton(
                  onTap: ((isLiked) async {
                    return !isLiked;
                  }),
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 19.0),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 18),
                  width: double.infinity,
                  height: 140,
                  child: Image.asset(
                    shoesItem.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 19, left: 7),
            child: Text(
              shoesItem.name,
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 6, left: 7),
              child: Text(
                "${shoesItem.price} \$",
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headline3,
              )),
        
        
        ]),
      ),
      onTap: () {
        
        Navigator.push(
            context,
            PageTransition(
                child: ItemDetails(shoesItem.id),
                type: PageTransitionType.fade,
                duration: Duration(milliseconds: 500),
                reverseDuration: Duration(milliseconds: 500)));
      },
    );
  }
}
