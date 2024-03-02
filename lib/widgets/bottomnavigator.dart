import 'package:menufy/providers/restaurant_item.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Navigation extends StatefulWidget {
  late int currIndex;
  final PageController _pageController;
  Navigation(this.currIndex, this._pageController, {super.key});
  @override
  State<Navigation> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavyBar(
        items: [
          BottomNavyBarItem(
              textAlign: TextAlign.center,
              icon: const Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: const Text(
                'Home',
                style: TextStyle(color: Colors.black),
              ),
              activeColor: const Color.fromRGBO(255, 215, 0, 1)),
          BottomNavyBarItem(
              textAlign: TextAlign.center,
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              title: const Text(
                'Search',
                style: TextStyle(color: Colors.black),
              ),
              activeColor: const Color.fromRGBO(255, 215, 0, 1)
              // activeColor: Colors.black
              ),
          BottomNavyBarItem(
              icon: const Icon(
                Icons.favorite_border,
                color: Colors.black,
              ),
              title: const Text(
                'Favorites',
                style: TextStyle(color: Colors.black),
              )),
          BottomNavyBarItem(
              textAlign: TextAlign.center,
              icon: const Icon(
                Icons.filter_1,
                color: Colors.black,
              ),
              title: const Text(
                'Filter',
                style: TextStyle(color: Colors.black),
              ),
              activeColor: const Color.fromRGBO(255, 215, 0, 1)),
          BottomNavyBarItem(
              textAlign: TextAlign.center,
              icon: Consumer<Item>(builder: (_, object, __) {
                return Badge(
                  label: Text(
                    object.cartItem.length.toString(),
                    // style: TextStyle(color: Colors.black),
                  ),
                  isLabelVisible: object.cartItem.isEmpty ? false : true,
                  child: const Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                  ),
                );
              }),
              title: const Text(
                'Cart',
                style: TextStyle(color: Colors.black),
              ),
              activeColor: const Color.fromRGBO(255, 215, 0, 1)),
        ],
        selectedIndex: widget.currIndex,
        onItemSelected: ((value) {
          setState(() {
            widget.currIndex = value;
            if (widget._pageController.hasClients) {
              widget._pageController.animateToPage(value,
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.easeIn);
            }
          });
        }));
  }
}
