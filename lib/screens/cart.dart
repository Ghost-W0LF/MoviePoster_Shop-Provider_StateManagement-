import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stateManagement/model.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.read<Movie>().cart;
    return Scaffold(
      appBar: AppBar(
          title: Text(
              "Total Price is  ${context.read<Movie>().totalPrice().toString()}")),
      body: SingleChildScrollView(
        child: Consumer<Movie>(
          builder: (context, ins, child) {
            return Column(
              children: [
                GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 50,
                            crossAxisSpacing: 10,
                            mainAxisExtent: 400),
                    itemCount: cart.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, index) {
                      return Card(
                        color: Colors.black.withOpacity(0.7),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image(
                                image:
                                    AssetImage(ins.movies[cart[index]].image),
                                fit: BoxFit.fitHeight),
                            Text(
                              "Titel:-${ins.movies[cart[index]].title}",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "Price:- Rs ${ins.movies[cart[index]].Price}",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      );
                    }),
             
              ],
            );
          },
        ),
      ),
    );
  }
}
