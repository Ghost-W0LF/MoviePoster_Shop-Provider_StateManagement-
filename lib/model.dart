import 'package:flutter/material.dart';

class MovieProvider {
  final String title;
  final String director;
  final int Price;
  final String image;

  MovieProvider({
    required this.title,
    required this.director,
    required this.Price,
    required this.image,
  });
}

class Movie extends ChangeNotifier {
  List<MovieProvider> movies = [
    MovieProvider(
        title: 'Doctor Strange',
        director: 'Frank Darabont',
        Price: 1000,
        image: "assets/DOCTOR STRANGE.jpeg"),
    MovieProvider(
        title: 'Captain America',
        director: 'Francis Ford Coppola',
        Price: 1200,
        image: "assets/Captain America.jpeg"),
    MovieProvider(
        title: 'Black Panthert',
        director: 'Christopher Nolan',
        Price: 800,
        image: "assets/BlackPanther.jpeg"),
    MovieProvider(
        title: 'End Game',
        director: 'Christopher Nolan',
        Price: 1500,
        image: "assets/Endgame.jpeg"),
    MovieProvider(
        title: 'Thor',
        director: 'Christopher Nolan',
        Price: 900,
        image: "assets/Thor.jpeg"),
    MovieProvider(
        title: 'Iron Man',
        director: 'Christopher Nolan',
        Price: 2000,
        image: "assets/Iron man.jpeg"),
    MovieProvider(
        title: 'EG',
        director: 'Christopher Nolan',
        Price: 100,
        image: "assets/CA.jpeg"),
    // Add more movies here...
  ];

  List<int> wishList = [];
  List<int> cart = [];

  void addMovieToWishList(index) {
    wishList.add(index);

    notifyListeners();
  }

  void remove(index) {
    wishList.remove(index);

    notifyListeners();
  }

  void addToCart(index) {
    cart.add(index);
    notifyListeners();
  }

  int totalPrice() {
    int total = 0;
    for (int index in cart) {
      total += movies[index].Price;
    }
    return total;
  }

  @override
  void notifyListeners() {

    super.notifyListeners();
  }
}

