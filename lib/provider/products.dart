import 'package:flushfood/models/product.dart';
import 'package:flushfood/widget/popular_products.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Products with ChangeNotifier {
  final List<Product> _products = [
    Product(
      
        id: 'Chiken Burger',
        title: 'Chiken Burger',
        description:
            'Crispy seasoned chicken breast, topped with mandatory melted cheese and piled onto soft rolls with onion, avocado, lettuce, tomato and garlic mayo. Quick to make for a midweek meal, great for gatherings!',
        price: 30.99,
        imageUrl:
            'assets/images/chiken.jpg',
        brand: 'Burger',
        productCategoryName: 'Burger',
        quantity: 15,
        isPopular: false

    ),
    Product(
        id: 'Saucy Mozzarella & Chicken Burgers',
        title: 'Saucy Mozzarella & Chicken Burgers',
        description:
            'Mozzarella cheese and your favourite pasta or pizza sauce make the perfect toppings for these Italian spiced burgers. Serve with roasted oven fries and a crisp green salad.',
        price: 50,
        imageUrl:
            'assets/images/chikenburger.jfif',
        brand: 'Burger',
        productCategoryName: 'Burger',
        quantity: 10,
        isPopular: false),
    Product(
        id: 'Healthy Chicken Burgers',
        title: 'Healthy Chicken Burgers',
        description:
            'Topped with avocado, onion, alfafa sprouts, tomatoes and sun-dried tomato pesto, these tasty burgers are perfect for any health conscious chick.',
        price: 50.99,
        imageUrl:
            'assets/images/healthyburger.jfif',
        brand: 'Burger King',
        productCategoryName: 'Burger',
        quantity: 20,
        isPopular: true),
    Product(
        id: 'Neapolitan Pizza',
        title: 'Neapolitan Pizza',
        description:
            'Neapolitan is the original pizza. This delicious pie dates all the way back to 18th century in Naples, Italy. During this time, the poorer citizens of this seaside city frequently purchased food that was cheap and could be eaten quickly. Luckily for them, Neapolitan pizza was affordable and readily available through numerous street vendors',
        price: 10,
        imageUrl: 'assets/images/neapolitan.jpg',
        brand: 'Pizza Hut',
        productCategoryName: 'Pizza',
        quantity: 13,
        isPopular: true),
    Product(
        id: 'Chicago Pizza ',
        title: 'Chicago Pizza',
        description:
            'Chicago pizza, also commonly referred to as deep-dish pizza, gets its name from the city it was invented in. ',
        price: 25,
        imageUrl:
            'assets/images/chicago.jpg',
        brand: 'Pizza Hut',
        productCategoryName: 'Pizza',
        quantity: 20,
        isPopular: false),

    Product(
        id: ' New York-Style Pizza',
        title: 'New York-Style Pizza',
        description: 'New York-style pizza usually features tomato sauce and mozzarella cheese. ',
        price: 38,
        imageUrl:
            'assets/images/newyork.jfif',
        brand: 'Pizza Hut',
        productCategoryName: 'Pizza',
        quantity: 30,
        isPopular: false),
    Product(
        id: 'Fish & Chips',
        title: 'Fish & Chips',
        description:
            'un plat à base de poisson pané et frites',
        price: 51.89,
        imageUrl:
            'assets/images/fish.jfif',
        brand: 'Plat',
        productCategoryName: 'Plat',
        quantity: 7,
        isPopular: false),
    Product(
        id: 'Toad in the Hole',
        title: 'Toad in the Hole',
        description: 'un clafouti salé anglais à base de saucisses',
        price: 39.99,
        imageUrl:
            'assets/images/toad.jfif',
        brand: 'Plat',
        productCategoryName: 'Plat',
        quantity: 11,
        isPopular: false),
    Product(
        id: ' roast dinner',
        title: ' roast dinner',
        description: 'viande rôtie (bœuf, poulet, porc ou agneau en fonction des goûts), pommes de terre cuites au four, légumes rôtis ou cuits à la vapeur, tels que des panais et des carottes, farce et « Yorkshire pudding », une sorte de clafouti salé fait à base d œufs, de lait, de farine et cuit dans le gras de cuisson de la viande.',
        price: 58.88,
        imageUrl:
            'assets/images/roast.jfif',
        brand: 'Plat',
        productCategoryName: 'Plat',
        quantity: 8941,
        isPopular: true),
    Product(
        id: 'Baguette au jambon',
        title: 'Baguette au jambon',
        description:
            'Baguette au jambon',
        price: 14,
        imageUrl:
            'assets/images/jambon.jpg',
        brand: 'sandwitch',
        productCategoryName: 'sandwitch',
        quantity: 15,
        isPopular: false),
    Product(
        id: 'Toast jambon',
        title: 'Toast jambon',
        description:
            'Toast au jambon panini',
        price: 19,
        imageUrl:
            'assets/images/toast.jfif',
        brand: 'sandwitch',
        productCategoryName: 'sandwitch',
        quantity: 31,
        isPopular: false),
    Product(
        id: 'Sandwichs grillés',
        title: 'Sandwichs grillés',
        description:
            'Sandwichs grillés au fromage et jambon, pain complet .',
        price: 20,
        imageUrl:
            'assets/images/paincomplet.jpg',
        brand: 'sandwitch',
        productCategoryName: 'sandwitch',
        quantity: 15,
        isPopular: true),
    Product(
        id: 'Coca Cola',
        title: 'Coca Cola',
        description:
            'Il s agit d une boisson alcoolisée à base de coca, de noix de kola et de damiana.',
        price: 5,
        imageUrl:
            'assets/images/coca.jfif',
        brand: 'Drinks',
        productCategoryName: 'Drinks',
        quantity: 150,
        isPopular: false),
    Product(
        id: 'Pepsi',
        title: 'Pepsi',
        description:
            'Pepsi is a carbonated soft drink manufactured by PepsiCo ',
        price: 2,
        imageUrl:
            'assets/images/pepsi.jfif',
        brand: 'Drinks',
        productCategoryName: 'Drinks',
        quantity: 325,
        isPopular: true),
    Product(
        id: 'Schweppes',
        title: 'Schweppes',
        description:
            'Schweppes',
        price: 8,
        imageUrl:
            'assets/images/schweps.jfif',
        brand: 'Drinks',
        productCategoryName: 'Drinks',
        quantity: 81,
        isPopular: true),
    Product(
        id: 'Cheesecake',
        title: 'Cheescake',
        description:
            'Un gâteau au fromage au Canada francophone, est une variété nord-américaine de gâteau au fromage.',
        price: 30,
        imageUrl:
            'assets/images/cheescake.jpg',
        brand: 'Dessert',
        productCategoryName: 'Dessert',
        quantity: 20,
        isPopular: true),
        Product(
        id: 'Cheescake au chocolat blanc ',
        title: 'Cheescake au chocolat blanc ',
        description:
            'This gorgeous, festive cake marries two favorite holiday cake flavors: red velvet and cheesecake.  The cake features layers of white chocolate cheesecake alternated with red velvet cake layers, topped with white chocolate frosting and candy "leaves".  ',
        price: 60,
        imageUrl:
            'assets/images/gateau.jpg',
        brand: 'Dessert',
        productCategoryName: 'Dessert',
        quantity: 10,
        isPopular: true),
         Product(
        id: 'Cheescake Aux framboises ',
        title: 'Cheescake Aux framboises',
        description:
            'Cheescake Aux framboises ',
        price: 55,
        imageUrl:
            'assets/images/cheescake1.jpg',
        brand: 'Dessert',
        productCategoryName: 'Dessert',
        quantity: 5,
        isPopular: true),

  ];

  List<Product> get products {
    return [..._products];
  }

  List<Product> get popularProducts {
    return _products.where((element) => element.isPopular).toList();
  }

  static get productid => null;

  static set documentReference(documentReference) {}

  Product findById(String productId) {
    return _products.firstWhere((element) => element.id == productId);
  }

  List<Product> findByCategory(String categoryName) {
    List _categoryList = _products
        .where((element) => element.productCategoryName
            .toLowerCase()
            .contains(categoryName.toLowerCase()))
        .toList();
    return _categoryList;
  }

  List<Product> findByBrand(String brandName) {
    List _categoryList = _products
        .where((element) =>
            element.brand.toLowerCase().contains(brandName.toLowerCase()))
        .toList();
    return _categoryList;
  }

  List<Product> searchQuery(String searchText) {
    List _searchList = _products
        .where((element) =>
            element.title.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
    return _searchList;
  }
}

class Firestore {
  static var instance;
}
