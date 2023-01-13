import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shoes_store/Data.dart';
import '../widgets/shoesCart.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  List Brand_Images = [
    "assets/images/adidas.jpg",
    "assets/images/nike.jpg",
    "assets/images/puma.jpg"
  ];
  int current_index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.04,
                  bottom: MediaQuery.of(context).size.height * 0.02),
              child: Text(
                "HOME",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * .94,
              child: Card(
                elevation: 30,

                child: CarouselSlider.builder(
                  itemCount: Brand_Images.length,
                  itemBuilder: (_, int index, int realIndex) {
                    return Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 1),
                        child: Image.asset(Brand_Images[index]));
                  },
                  options: CarouselOptions(
                    onPageChanged: (index, _) {
                      current_index = index;
                    },
                    autoPlay: true,
                    autoPlayAnimationDuration: Duration(seconds: 2),
                    initialPage: 2,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true,
                    disableCenter: true,
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * .94,
              height: MediaQuery.of(context).size.height * .67,
              child: GridView(
                children: shoes.map((e) => ShoesCard(e)).toList(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  mainAxisSpacing: 30,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 5,
                  mainAxisExtent: 270,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
