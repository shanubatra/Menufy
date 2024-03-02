import 'package:flutter/material.dart';
import '../providers/restaurant_item.dart';
import 'package:provider/provider.dart';

class RestaurentItem extends StatefulWidget {
  final int index;
  final String condition;
  final String text;

  const RestaurentItem(this.index, this.condition, this.text, {super.key});

  @override
  State<RestaurentItem> createState() => _RestaurentItemState();
}

class _RestaurentItemState extends State<RestaurentItem> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> dummy =
        Provider.of<Item>(context, listen: false).items;
    List<Map<String, dynamic>> items = widget.condition == 'home'
        ? Provider.of<Item>(
            context,
          ).items
        : Provider.of<Item>(context).searchItem(widget.text);

    return Card(
        margin: const EdgeInsets.all(10),
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          // margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          width: double.infinity,
          height: 250,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Column(children: [
              Stack(
                children: [
                  Image.asset(
                    items[widget.index]['images'].toString(),
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: items[widget.index]['fav'] == false
                        ? IconButton(
                            onPressed: (() {
                              widget.condition == 'home'
                                  ? Provider.of<Item>(context, listen: false)
                                      .changeFav(widget.index)
                                  : Provider.of<Item>(context, listen: false)
                                      .changeFav(dummy.indexWhere((element) =>
                                          element['id'] ==
                                          items[widget.index]['id']));
                            }),
                            icon: const CircleAvatar(
                              radius: 15.0,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.favorite_border_rounded,
                                color: Colors.red,
                                size: 20,
                              ),
                            ))
                        // icon: Container(
                        //     alignment: Alignment.topRight,
                        //     child: Container(
                        //       padding: const const EdgeInsets.all(4.0),
                        //       decoration: BoxDecoration(
                        //         boxShadow: [
                        //           BoxShadow(
                        //             color: Colors.grey,
                        //             blurRadius: 4.0,
                        //             offset: Offset(3.0, 3.0),
                        //           )
                        //         ],
                        //         shape: BoxShape.circle,
                        //         color: Colors.white,
                        //       ),
                        //       child: Icon(
                        //         Icons.favorite_border_rounded,
                        //         size: 17.0,
                        //         color: Colors.red,
                        //       ),
                        //     )))
                        : IconButton(
                            onPressed: (() {
                              widget.condition == 'home'
                                  ? Provider.of<Item>(context, listen: false)
                                      .changeFav(widget.index)
                                  : Provider.of<Item>(context, listen: false)
                                      .changeFav(dummy.indexWhere((element) =>
                                          element['id'] ==
                                          items[widget.index]['id']));
                            }),
                            icon: const CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 15.0,
                              child: Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 20,
                              ),
                            )),
                  ),
                  Positioned(
                      left: 10,
                      bottom: 10,
                      child: Text(
                        items[widget.index]['name'] as String,
                        style: const TextStyle(color: Colors.black, fontSize: 25),
                      ))
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "  ₹${items[widget.index]['price'].toString()}",
                      style: const TextStyle(fontSize: 17),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 13, 93, 46),
                          borderRadius: BorderRadius.circular(6)),
                      height: 30,
                      width: 35,
                      child: Row(
                        children: [
                          Text(
                            items[widget.index]['rating'] as String,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          const Icon(
                            Icons.star,
                            size: 15,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (() {
                        widget.condition == 'home'
                            ? Provider.of<Item>(context, listen: false)
                                .changeState(widget.index)
                            : Provider.of<Item>(context, listen: false)
                                .changeState(dummy.indexWhere((element) =>
                                    element['id'] ==
                                    items[widget.index]['id']));
                      }),
                      child: Container(
                          margin: const EdgeInsets.all(6),
                          height: 50,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Colors.yellowAccent.shade700,
                              borderRadius: BorderRadius.circular(5)),
                          // color: Colors.yellowAccent.shade700,
                          child: items[widget.index]['pressed'] != true
                              ? const Center(
                                  child: Text(
                                    'ADD',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        widget.condition == 'home'
                                            ? Provider.of<Item>(context,
                                                    listen: false)
                                                .decrement(widget.index)
                                            : Provider.of<Item>(context,
                                                    listen: false)
                                                .decrement(dummy.indexWhere(
                                                    (element) =>
                                                        element['id'] ==
                                                        items[widget.index]
                                                            ['id']));

                                        Provider.of<Item>(context,
                                                listen: false)
                                            .removeCart(
                                                items[widget.index]['id']);
                                      },
                                      child: const Icon(Icons.remove),
                                    ),
                                    Text(
                                      "${items[widget.index]['count']}",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    InkWell(
                                      onTap: (() {
                                        widget.condition == 'home'
                                            ? Provider.of<Item>(context,
                                                    listen: false)
                                                .increment(widget.index)
                                            : Provider.of<Item>(context,
                                                    listen: false)
                                                .increment(dummy.indexWhere(
                                                    (element) =>
                                                        element['id'] ==
                                                        items[widget.index]
                                                            ['id']));

                                        Provider.of<Item>(context,
                                                listen: false)
                                            .addCart(items[widget.index]['id']);
                                      }),
                                      child: const Icon(Icons.add),
                                    )
                                  ],
                                )),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
