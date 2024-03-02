import 'package:menufy/providers/restaurant_item.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Fav extends StatelessWidget {
  static const routeName = './fav';

  const Fav({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> favItem = Provider.of<Item>(
      context,
    ).showfav();
    print(favItem);
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Favorite',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellowAccent.shade700,
      ),
      body: favItem.isEmpty
          ? Image.asset('assets/images/favorite.png')
          : ListView.builder(
              itemCount: favItem.length,
              itemBuilder: ((context, index) {
                return Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 6,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          height: 150,
                          width: 200,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                favItem[index]['images'] as String,
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                      Positioned(
                          top: 5,
                          right: 5,
                          child: IconButton(
                              onPressed: () {
                                int i = Provider.of<Item>(context,
                                        listen: false)
                                    .items
                                    .indexWhere((element) =>
                                        element['id'] == favItem[index]['id']);
                                Provider.of<Item>(context, listen: false)
                                    .changeFav(i);
                              },
                              icon: const CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 15.0,
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 20,
                                ),
                              )
                              // : IconButton(
                              //     onPressed: () {
                              //       Provider.of<Item>(context, listen: false)
                              //           .changeFav(index);
                              //       print(favItem.length);
                              //     },
                              //     icon: Icon(
                              //       Icons.favorite_border_outlined,
                              //       size: 30,
                              //       color: Colors.white,
                              //     ))
                              ))
                    ]),

                    SizedBox(
                        // padding: EdgeInsets.all(2),
                        height: 150,
                        width: 180,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              favItem[index]['name'] as String,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  // padding: EdgeInsets.symmetric(
                                  //     horizontal: 4, vertical: 4),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(255, 13, 93, 46),
                                    // borderRadius: BorderRadius.circular(3)
                                  ),
                                  height: 30,
                                  width: 20,
                                  child: const Icon(
                                    Icons.star,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  favItem[index]['rating'] as String,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              favItem[index]['price'].toString(),
                              style: const TextStyle(fontSize: 20),
                            )
                          ],
                        ))
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [Text(favItem[index]['name'] as String)],
                    // )
                  ],
                );
              })),
    );
  }
}
