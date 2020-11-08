import 'package:first_deewi_mvp/models/cuisine_model.dart';
import 'package:first_deewi_mvp/models/dish_model.dart';

final List<Cuisine> cuisines = [
  Cuisine(
    name: "Japanese",
    dishes: japaneseDishes,
    imagePath: "assets/images/cuisine_images/japanese.jpg",
  ),
  Cuisine(
    name: "Chinese",
    dishes: chineseDishes,
    imagePath: "assets/images/cuisine_images/chinese.jpg",
  ),
  Cuisine(
    name: "Indian",
    dishes: indianDishes,
    imagePath: "assets/images/cuisine_images/indian.jpg",
  ),
  Cuisine(
    name: "Mexican",
    dishes: mexicanDishes,
    imagePath: "assets/images/cuisine_images/mexican.jpg",
  ),
];

final List<Dish> japaneseDishes = [
  Dish(
    name: "Japanese dish num. 1",
    price: 10.1,
    imagePath: "assets/images/dish_images/dish.jpg",
  ),
  Dish(
    name: "Japanese dish num. 2",
    price: 20.2,
    imagePath: "assets/images/dish_images/dish.jpg",
  ),
  Dish(
    name: "Japanese dish num. 3",
    price: 30.3,
    imagePath: "assets/images/dish_images/dish.jpg",
  ),
];

final List<Dish> chineseDishes = [
  Dish(
    name: "Chinese dish num. 1",
    price: 10.1,
    imagePath: "assets/images/dish_images/dish.jpg",
  ),
  Dish(
    name: "Chinese dish num. 2",
    price: 20.2,
    imagePath: "assets/images/dish_images/dish.jpg",
  ),
  Dish(
    name: "Chinese dish num. 3",
    price: 30.3,
    imagePath: "assets/images/dish_images/dish.jpg",
  ),
  Dish(
    name: "Chinese dish num. 4",
    price: 40.4,
    imagePath: "assets/images/dish_images/dish.jpg",
  ),
];

final List<Dish> indianDishes = [
  Dish(
    name: "Indian dish num. 1",
    price: 10.1,
    imagePath: "assets/images/dish_images/dish.jpg",
  ),
  Dish(
    name: "Indian dish num. 2",
    price: 20.2,
    imagePath: "assets/images/dish_images/dish.jpg",
  ),
  Dish(
    name: "Indian dish num. 3",
    price: 30.3,
    imagePath: "assets/images/dish_images/dish.jpg",
  ),
  Dish(
    name: "Indian dish num. 4",
    price: 40.4,
    imagePath: "assets/images/dish_images/dish.jpg",
  ),
  Dish(
    name: "Indian dish num. 5",
    price: 50.5,
    imagePath: "assets/images/dish_images/dish.jpg",
  ),
];

final List<Dish> mexicanDishes = [
  Dish(
    name: "Mexican dish num. 1",
    price: 10.1,
    imagePath: "assets/images/dish_images/dish.jpg",
  ),
  Dish(
    name: "Mexican dish num. 2",
    price: 20.2,
    imagePath: "assets/images/dish_images/dish.jpg",
  ),
];
