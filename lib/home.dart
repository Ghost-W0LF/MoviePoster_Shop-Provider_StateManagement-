import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:stateManagement/model.dart';
import 'package:stateManagement/screens/cart.dart';

import 'package:stateManagement/second.dart';

class home extends StatefulWidget {
  home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    var wishList = context.watch<Movie>().wishList;
    var methods = context.watch<Movie>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Favrouite Movie ${wishList.length}"),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(Cart());
              },
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Consumer<Movie>(
          builder: (context, ins, child) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 440),
                itemCount: ins.movies.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  return Card(
                    color: Colors.black.withOpacity(0.7),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image(
                                image: AssetImage(ins.movies[index].image),
                                fit: BoxFit.fitHeight),
                            Text(
                              "Titel:-${ins.movies[index].title}",
                              style: TextStyle(color: Colors.white),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Price:- Rs ${ins.movies[index].Price}",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      context.read<Movie>().addToCart(index);
                                    },
                                    icon: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                          ],
                        ),
                        Positioned(
                            right: 0,
                            child: IconButton(
                              icon: Icon(
                                Icons.favorite,
                                color: wishList.contains(index)
                                    ? Colors.red
                                    : Colors.white,
                                size: 30,
                              ),
                              onPressed: () {
                                if (wishList.contains(index)) {
                                  context.read<Movie>().remove(index);
                                } else {
                                  context
                                      .read<Movie>()
                                      .addMovieToWishList(index);
                                }
                              },
                            ))
                      ],
                    ),
                  );
                });
          },
        ),
      ),
      floatingActionButton: IconButton(
        icon: const Icon(
          Icons.route,
          color: Colors.black,
        ),
        onPressed: () {
          Get.to(second());
        },
      ),
    );
  }
}
/*  */