import 'package:menufy/providers/carosel_slider.dart';
import 'package:menufy/providers/restaurant_item.dart';
import 'package:menufy/scrrens/cart.dart';
import 'package:menufy/scrrens/fav_screen.dart';
import 'package:menufy/widgets/bottomnavigator.dart';
import 'package:menufy/widgets/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import '../scrrens/search_screen.dart';

class RestaurantScreen extends StatefulWidget {
  static const routeName = './restscreen';

  const RestaurantScreen({super.key});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  final int _currIndex = 0;
  String condition = 'home';
  PageController _pageController = PageController();

  @override
  void initState() {

    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> images =
        Provider.of<CarouselImages>(context, listen: false).images;
    List<Map<String, dynamic>> items =
        Provider.of<Item>(context, listen: false).items;

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        actions: [
          PopupMenuButton(
              icon: const Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              onSelected: (value) {
                Navigator.of(context).pushNamed(
                  Fav.routeName,
                );
              },
              itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 1,
                      child: Text('Favorites'),
                    )
                  ])
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Amrik Sukhdev',
              style: TextStyle(color: Colors.black),
            ),
            RatingBar.builder(
                initialRating: 4,
                minRating: 1,
                maxRating: 5,
                updateOnDrag: true,
                itemSize: 20,
                allowHalfRating: true,
                itemBuilder: ((context, index) {
                  return const Icon(
                    Icons.star,
                    color: Colors.black,
                    size: 1,
                  );
                }),
                onRatingUpdate: ((value) {}))
          ],
        ),
        backgroundColor: Colors.yellowAccent.shade700,
      ),
      body: PageView(controller: _pageController, children: [
        SingleChildScrollView(
            child: Column(children: [
          const SizedBox(
            height: 10,
          ),
          CarouselSlider(
              items: images.map((e) {
                return Builder(builder: (BuildContext context) {
                  return Container(
                    child: Image.asset(
                      e,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  );
                });
              }).toList(),
              options: CarouselOptions(
                // height: 200,
                // autoPlay: true,
                height: 300,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,

                scrollDirection: Axis.horizontal,
              )),
          const SizedBox(
            height: 5,
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              physics: const ScrollPhysics(),
              itemBuilder: ((context, index) {
                return RestaurentItem(index, condition, "");
              })),
        ])),
        const SearchScreen(),
        const Fav(),
        Container(
          height: 50,
          color: Colors.greenAccent,
        ),
        const CartScreen()
      ]),
      bottomNavigationBar: Navigation(_currIndex, _pageController),
    );
  }
}
