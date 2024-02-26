import 'package:flutter/material.dart';

import 'toys.dart';

class Cart extends ChangeNotifier {
  List<Toy> ToyShop = [
    Toy(
      name: 'FLORA',
      price: '180',
      image: 'lib/images/logo2.webp',
      description:
          'Flora is a beautiful doll that comes with a beautiful dress and a matching hat. She is a perfect gift',
    ),
    Toy(
      name: 'OUCH',
      price: '200',
      image: 'lib/images/logo7.webp',
      description:
          'Meet OUCH, the thrilling and colorful game of surprise! Press buttons, but watch out for the unexpected ''ouch''',
    ),
    Toy(
      name: 'MR SATO',
      price: '300',
      image: 'lib/images/logo4.webp',
      description:
        'A lively and entertaining game! Press buttons, but watch out for the unexpected twist. Fun for everyone!',
    ),
    Toy(
      name: 'TYGRR',
      price: '400',
      image: 'lib/images/logo6.webp',
      description:
        'A wild and exciting game! Navigate the challenge, but be ready for the unexpected twist.!',
    ),
  ];
  List<Toy> userCart = [];
  List<Toy> getToyList() {
    return ToyShop;
  }

  List<Toy> getUserCart() {
    return userCart;
  }

  void addItemToCart(Toy toy) {
    userCart.add(toy);
    notifyListeners();
  }

  void removeItemFromCart(Toy toy) {
    userCart.remove(toy);
    notifyListeners();
  }
}
