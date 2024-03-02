import 'package:menufy/providers/restaurant_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> cartItem = Provider.of<Item>(context).cartItem;
    List<Map<String, dynamic>> items =
        Provider.of<Item>(context, listen: false).items;

    num totalAmount() {
      num sum = 0;
      for (int i = 0; i < cartItem.length; i++) {
        sum += cartItem[i]['price'] * cartItem[i]['count'];
      }
      return sum;
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: cartItem.length,
              itemBuilder: ((context, index) {
                return Padding(
                    padding: const EdgeInsets.all(4),
                    child: Card(
                        elevation: 3,
                        child: SizedBox(
                            height: 100,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    cartItem[index]['images'],
                                    fit: BoxFit.cover,
                                    width: 150,
                                    height: 100,
                                  ),
                                  // SizedBox(
                                  //   width: 30,
                                  // ),

                                  Column(
                                    children: [
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        cartItem[index]['name'],
                                        softWrap: true,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                          "₹${cartItem[index]['price'].toString()}")
                                    ],
                                  ),

                                  Column(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          margin: const EdgeInsets.all(6),
                                          height: 30,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.yellowAccent.shade700,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Provider.of<Item>(context,
                                                          listen: false)
                                                      .decrement(
                                                          items.indexWhere(
                                                              (element) =>
                                                                  element[
                                                                      'id'] ==
                                                                  cartItem[
                                                                          index]
                                                                      ['id']));

                                                  Provider.of<Item>(context,
                                                          listen: false)
                                                      .removeCart(
                                                          cartItem[index]
                                                              ['id']);
                                                },
                                                child: const Icon(Icons.remove),
                                              ),
                                              Text(
                                                cartItem[index]['count']
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              InkWell(
                                                onTap: (() {
                                                  Provider.of<Item>(context,
                                                          listen: false)
                                                      .increment(
                                                          items.indexWhere(
                                                              (element) =>
                                                                  element[
                                                                      'id'] ==
                                                                  cartItem[
                                                                          index]
                                                                      ['id']));

                                                  Provider.of<Item>(context,
                                                          listen: false)
                                                      .addCart(cartItem[index]
                                                          ['id']);
                                                }),
                                                child: const Icon(Icons.add),
                                              )
                                            ],
                                          )),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "₹${cartItem[index]['price'] * cartItem[index]['count']}"
                                            .toString(),
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ]))));
              }),
            ),
            if (cartItem.isNotEmpty)
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  // for apply coupon
                  showBelowName('OFFERS'),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 5,
                          child: Container(
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              leading: Image.asset(
                                'assets/images/coupon.png',
                                width: 30,
                                fit: BoxFit.cover,
                              ),
                              title: const Text(
                                'Apply Coupon',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              trailing: const Icon(
                                Icons.chevron_right_rounded,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  showBelowName('BILL SUMMARY'),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        height: 110,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Item total'),
                                  Text("₹${totalAmount().toString()}"),
                                ]),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Govt. taxes and restaurant charges'),
                                  Text(
                                    "₹14",
                                    softWrap: true,
                                  ),
                                ]),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(
                              color: Colors.black,
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Grand Total',
                                    softWrap: true,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    "₹${totalAmount() + 14}",
                                    style: const TextStyle(fontSize: 20),
                                    softWrap: true,
                                  ),
                                ]),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            // if (cartItem.length != 0)
          ],
        ),
      ),
      // for showing fix placed button
      bottomNavigationBar: cartItem.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Colors.yellowAccent.shade700)),
                onPressed: () {},
                child: const Text(
                  'Placed Orders',
                  style: TextStyle(color: Colors.black),
                ),
              ))
          : null,
    );
  }

// for divider
  Row showBelowName(String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: Divider(
            color: Colors.black,
            endIndent: 10.0,
            thickness: 1,
          ),
        ),
        Text(
          name,
          style: const TextStyle(color: Colors.black),
        ),
        const Expanded(
          child: Divider(
            color: Colors.black,
            indent: 10.0,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
