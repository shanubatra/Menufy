import 'package:menufy/providers/table.dart';
import 'package:menufy/scrrens/restaurant_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SeatScreen extends StatefulWidget {
  const SeatScreen({super.key});

  @override
  State<SeatScreen> createState() => _SeatScreenState();
}

class _SeatScreenState extends State<SeatScreen> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final List<int> table = Provider.of<TableNo>(context).tableNo;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Amrik Sukhdev',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellowAccent.shade700,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              cursorColor: Colors.black,
              autofocus: false,
              controller: controller,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.black,
                    ),
                    onPressed: controller.clear,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  hintText: "Search for table",
                  focusColor: Colors.black,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2,
                      ))),
            ),
          ),
          Expanded(
            child: GridView.builder(
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  // mainAxisSpacing: 10,
                  // crossAxisSpacing: 10
                ),
                itemBuilder: ((context, index) {
                  return InkWell(
                      onTap: () {
                        Provider.of<TableNo>(context, listen: false)
                            .addTabale(index);

                        Navigator.of(context).pushNamed(
                            RestaurantScreen.routeName,
                            arguments: index);
                      },
                      child: table.contains(index)
                          ? Container(
                              height: 100,
                              margin: const EdgeInsets.all(8),
                              child: Card(
                                color: Colors.red,
                                elevation: 6,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "${index + 1}",
                                        style: const TextStyle(
                                            fontSize: 50,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text('Total Seats ->  4'),
                                      // Container(
                                      //   color: Colors.green.shade900,
                                      //   width: 50,
                                      //   height: 50,
                                      // )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              height: 100,
                              margin: const EdgeInsets.all(8),
                              child: Card(
                                color: Colors.green,
                                elevation: 6,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "${index + 1}",
                                        style: const TextStyle(
                                            fontSize: 50,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text('Total Seats ->  4'),
                                      // Container(
                                      //   color: Colors.green.shade900,
                                      //   width: 50,
                                      //   height: 50,
                                      // )
                                    ],
                                  ),
                                ),
                              ),
                            ));
                })),
          ),
        ],
      ),
    );
  }
}
