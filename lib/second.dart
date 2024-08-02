import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:stateManagement/home.dart';

import 'package:stateManagement/model.dart';

class second extends StatefulWidget {
  const second({super.key});

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  @override
  Widget build(BuildContext context) {
    var wishList = context.watch<Movie>().wishList;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Consumer<Movie>(
        builder: (context, ins, child) {
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 50,
                  crossAxisSpacing: 10,
                  mainAxisExtent: 340),
              itemCount: wishList.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, index) {
                return Card(
                  color: Colors.black.withOpacity(0.7),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image(
                          image: AssetImage(ins.movies[wishList[index]].image),
                          fit: BoxFit.fitHeight),
                      Text(
                        "Titel:-${ins.movies[wishList[index]].title}",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "Price:- Rs ${ins.movies[wishList[index]].Price}",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                );
              });
        },
      ),
      floatingActionButton: IconButton(
        icon: const Icon(
          Icons.route,
          color: Colors.pink,
        ),
        onPressed: () {
          Get.to(home());
        },
      ),
    );
  }
}
