import 'package:first_deewi_mvp/models/cuisine_model.dart';
import 'package:first_deewi_mvp/models/dish_model.dart';

final List<Cuisine> cuisines = [
  Cuisine(
    name: "India",
    dishes: indianDishes,
    imagePath: "assets/images/cuisine_images/indian.jpg",
  ),
  Cuisine(
    name: "Japonesa",
    dishes: japaneseDishes,
    imagePath: "assets/images/cuisine_images/japanese.jpg",
  ),
  Cuisine(
    name: "China",
    dishes: chineseDishes,
    imagePath: "assets/images/cuisine_images/chinese.jpg",
  ),
  Cuisine(
    name: "Mexicana",
    dishes: mexicanDishes,
    imagePath: "assets/images/cuisine_images/mexican.jpg",
  ),
];

final List<Dish> japaneseDishes = [
  Dish(
      name: "Plato japones 1",
      price: 10.1,
      imagePath: "assets/images/dish_images/Japanese0.jpg",
      description: """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas dignissim varius odio ac pretium. Proin nibh tortor, efficitur in lorem eget, elementum rhoncus velit. Sed vitae arcu et metus faucibus egestas interdum id nunc. Donec non sagittis enim. Ut rutrum tincidunt est sit amet tincidunt. Curabitur a odio nec tellus accumsan porta a non odio. Cras quis iaculis lacus, vitae luctus lacus. Sed consequat, eros ac efficitur luctus, nibh nulla dignissim augue, vitae viverra massa libero a purus. Donec ut quam eget magna mattis placerat vel id eros. Vivamus in ultrices nisl, sit amet vestibulum libero. Cras vel scelerisque nisl. Nam pretium, lacus sit amet consequat aliquam, urna enim pulvinar enim, nec dignissim nibh neque eget diam. Sed facilisis vitae ligula sit amet pharetra. Suspendisse dapibus nisl eget nunc egestas elementum. Nulla pulvinar arcu at placerat sollicitudin. Donec id sagittis tellus.

Aenean non turpis condimentum, pellentesque mauris vitae, molestie purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Phasellus vel interdum magna. Praesent accumsan vehicula magna, et porttitor nisl vestibulum id. Nam turpis ipsum, vulputate eu est quis, porttitor maximus neque. Praesent laoreet vehicula eleifend. Integer mattis urna id risus consequat, in sollicitudin mauris faucibus. Aenean consequat velit tellus, eu ultricies diam sodales et. Morbi tristique, nisl eget feugiat dignissim, neque purus vehicula odio, eu tincidunt orci urna a enim. Suspendisse interdum mauris lorem, nec fermentum elit fermentum sit amet. Aliquam sit amet enim tristique, elementum sem ut, lacinia elit. Morbi cursus ante lacus, vitae congue mi venenatis eget.
    """),
  Dish(
      name: "Plato japones 2",
      price: 20.2,
      imagePath: "assets/images/dish_images/Japanese1.jpg",
      description: """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas dignissim varius odio ac pretium. Proin nibh tortor, efficitur in lorem eget, elementum rhoncus velit. Sed vitae arcu et metus faucibus egestas interdum id nunc. Donec non sagittis enim. Ut rutrum tincidunt est sit amet tincidunt. Curabitur a odio nec tellus accumsan porta a non odio. Cras quis iaculis lacus, vitae luctus lacus. Sed consequat, eros ac efficitur luctus, nibh nulla dignissim augue, vitae viverra massa libero a purus. Donec ut quam eget magna mattis placerat vel id eros. Vivamus in ultrices nisl, sit amet vestibulum libero. Cras vel scelerisque nisl. Nam pretium, lacus sit amet consequat aliquam, urna enim pulvinar enim, nec dignissim nibh neque eget diam. Sed facilisis vitae ligula sit amet pharetra. Suspendisse dapibus nisl eget nunc egestas elementum. Nulla pulvinar arcu at placerat sollicitudin. Donec id sagittis tellus.

Aenean non turpis condimentum, pellentesque mauris vitae, molestie purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Phasellus vel interdum magna. Praesent accumsan vehicula magna, et porttitor nisl vestibulum id. Nam turpis ipsum, vulputate eu est quis, porttitor maximus neque. Praesent laoreet vehicula eleifend. Integer mattis urna id risus consequat, in sollicitudin mauris faucibus. Aenean consequat velit tellus, eu ultricies diam sodales et. Morbi tristique, nisl eget feugiat dignissim, neque purus vehicula odio, eu tincidunt orci urna a enim. Suspendisse interdum mauris lorem, nec fermentum elit fermentum sit amet. Aliquam sit amet enim tristique, elementum sem ut, lacinia elit. Morbi cursus ante lacus, vitae congue mi venenatis eget.
    """),
  Dish(
      name: "Plato japones 3",
      price: 30.3,
      imagePath: "assets/images/dish_images/Japanese2.jpg",
      description: """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas dignissim varius odio ac pretium. Proin nibh tortor, efficitur in lorem eget, elementum rhoncus velit. Sed vitae arcu et metus faucibus egestas interdum id nunc. Donec non sagittis enim. Ut rutrum tincidunt est sit amet tincidunt. Curabitur a odio nec tellus accumsan porta a non odio. Cras quis iaculis lacus, vitae luctus lacus. Sed consequat, eros ac efficitur luctus, nibh nulla dignissim augue, vitae viverra massa libero a purus. Donec ut quam eget magna mattis placerat vel id eros. Vivamus in ultrices nisl, sit amet vestibulum libero. Cras vel scelerisque nisl. Nam pretium, lacus sit amet consequat aliquam, urna enim pulvinar enim, nec dignissim nibh neque eget diam. Sed facilisis vitae ligula sit amet pharetra. Suspendisse dapibus nisl eget nunc egestas elementum. Nulla pulvinar arcu at placerat sollicitudin. Donec id sagittis tellus.

Aenean non turpis condimentum, pellentesque mauris vitae, molestie purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Phasellus vel interdum magna. Praesent accumsan vehicula magna, et porttitor nisl vestibulum id. Nam turpis ipsum, vulputate eu est quis, porttitor maximus neque. Praesent laoreet vehicula eleifend. Integer mattis urna id risus consequat, in sollicitudin mauris faucibus. Aenean consequat velit tellus, eu ultricies diam sodales et. Morbi tristique, nisl eget feugiat dignissim, neque purus vehicula odio, eu tincidunt orci urna a enim. Suspendisse interdum mauris lorem, nec fermentum elit fermentum sit amet. Aliquam sit amet enim tristique, elementum sem ut, lacinia elit. Morbi cursus ante lacus, vitae congue mi venenatis eget.
    """),
];

final List<Dish> chineseDishes = [
  Dish(
      name: "Plato Chino 1",
      price: 10.1,
      imagePath: "assets/images/dish_images/Chinese0.jpg",
      description: """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas dignissim varius odio ac pretium. Proin nibh tortor, efficitur in lorem eget, elementum rhoncus velit. Sed vitae arcu et metus faucibus egestas interdum id nunc. Donec non sagittis enim. Ut rutrum tincidunt est sit amet tincidunt. Curabitur a odio nec tellus accumsan porta a non odio. Cras quis iaculis lacus, vitae luctus lacus. Sed consequat, eros ac efficitur luctus, nibh nulla dignissim augue, vitae viverra massa libero a purus. Donec ut quam eget magna mattis placerat vel id eros. Vivamus in ultrices nisl, sit amet vestibulum libero. Cras vel scelerisque nisl. Nam pretium, lacus sit amet consequat aliquam, urna enim pulvinar enim, nec dignissim nibh neque eget diam. Sed facilisis vitae ligula sit amet pharetra. Suspendisse dapibus nisl eget nunc egestas elementum. Nulla pulvinar arcu at placerat sollicitudin. Donec id sagittis tellus.

Aenean non turpis condimentum, pellentesque mauris vitae, molestie purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Phasellus vel interdum magna. Praesent accumsan vehicula magna, et porttitor nisl vestibulum id. Nam turpis ipsum, vulputate eu est quis, porttitor maximus neque. Praesent laoreet vehicula eleifend. Integer mattis urna id risus consequat, in sollicitudin mauris faucibus. Aenean consequat velit tellus, eu ultricies diam sodales et. Morbi tristique, nisl eget feugiat dignissim, neque purus vehicula odio, eu tincidunt orci urna a enim. Suspendisse interdum mauris lorem, nec fermentum elit fermentum sit amet. Aliquam sit amet enim tristique, elementum sem ut, lacinia elit. Morbi cursus ante lacus, vitae congue mi venenatis eget.
    """),
  Dish(
      name: "Plato Chino 2",
      price: 20.2,
      imagePath: "assets/images/dish_images/Chinese1.jpg",
      description: """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas dignissim varius odio ac pretium. Proin nibh tortor, efficitur in lorem eget, elementum rhoncus velit. Sed vitae arcu et metus faucibus egestas interdum id nunc. Donec non sagittis enim. Ut rutrum tincidunt est sit amet tincidunt. Curabitur a odio nec tellus accumsan porta a non odio. Cras quis iaculis lacus, vitae luctus lacus. Sed consequat, eros ac efficitur luctus, nibh nulla dignissim augue, vitae viverra massa libero a purus. Donec ut quam eget magna mattis placerat vel id eros. Vivamus in ultrices nisl, sit amet vestibulum libero. Cras vel scelerisque nisl. Nam pretium, lacus sit amet consequat aliquam, urna enim pulvinar enim, nec dignissim nibh neque eget diam. Sed facilisis vitae ligula sit amet pharetra. Suspendisse dapibus nisl eget nunc egestas elementum. Nulla pulvinar arcu at placerat sollicitudin. Donec id sagittis tellus.

Aenean non turpis condimentum, pellentesque mauris vitae, molestie purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Phasellus vel interdum magna. Praesent accumsan vehicula magna, et porttitor nisl vestibulum id. Nam turpis ipsum, vulputate eu est quis, porttitor maximus neque. Praesent laoreet vehicula eleifend. Integer mattis urna id risus consequat, in sollicitudin mauris faucibus. Aenean consequat velit tellus, eu ultricies diam sodales et. Morbi tristique, nisl eget feugiat dignissim, neque purus vehicula odio, eu tincidunt orci urna a enim. Suspendisse interdum mauris lorem, nec fermentum elit fermentum sit amet. Aliquam sit amet enim tristique, elementum sem ut, lacinia elit. Morbi cursus ante lacus, vitae congue mi venenatis eget.
    """),
  Dish(
      name: "Plato Chino 3",
      price: 30.3,
      imagePath: "assets/images/dish_images/Chinese2.jpg",
      description: """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas dignissim varius odio ac pretium. Proin nibh tortor, efficitur in lorem eget, elementum rhoncus velit. Sed vitae arcu et metus faucibus egestas interdum id nunc. Donec non sagittis enim. Ut rutrum tincidunt est sit amet tincidunt. Curabitur a odio nec tellus accumsan porta a non odio. Cras quis iaculis lacus, vitae luctus lacus. Sed consequat, eros ac efficitur luctus, nibh nulla dignissim augue, vitae viverra massa libero a purus. Donec ut quam eget magna mattis placerat vel id eros. Vivamus in ultrices nisl, sit amet vestibulum libero. Cras vel scelerisque nisl. Nam pretium, lacus sit amet consequat aliquam, urna enim pulvinar enim, nec dignissim nibh neque eget diam. Sed facilisis vitae ligula sit amet pharetra. Suspendisse dapibus nisl eget nunc egestas elementum. Nulla pulvinar arcu at placerat sollicitudin. Donec id sagittis tellus.

Aenean non turpis condimentum, pellentesque mauris vitae, molestie purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Phasellus vel interdum magna. Praesent accumsan vehicula magna, et porttitor nisl vestibulum id. Nam turpis ipsum, vulputate eu est quis, porttitor maximus neque. Praesent laoreet vehicula eleifend. Integer mattis urna id risus consequat, in sollicitudin mauris faucibus. Aenean consequat velit tellus, eu ultricies diam sodales et. Morbi tristique, nisl eget feugiat dignissim, neque purus vehicula odio, eu tincidunt orci urna a enim. Suspendisse interdum mauris lorem, nec fermentum elit fermentum sit amet. Aliquam sit amet enim tristique, elementum sem ut, lacinia elit. Morbi cursus ante lacus, vitae congue mi venenatis eget.
    """),
];

final List<Dish> indianDishes = [
  Dish(
      name: "Plato indio 1",
      price: 10.1,
      imagePath: "assets/images/dish_images/Indian0.jpg",
      description: """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas dignissim varius odio ac pretium. Proin nibh tortor, efficitur in lorem eget, elementum rhoncus velit. Sed vitae arcu et metus faucibus egestas interdum id nunc. Donec non sagittis enim. Ut rutrum tincidunt est sit amet tincidunt. Curabitur a odio nec tellus accumsan porta a non odio. Cras quis iaculis lacus, vitae luctus lacus. Sed consequat, eros ac efficitur luctus, nibh nulla dignissim augue, vitae viverra massa libero a purus. Donec ut quam eget magna mattis placerat vel id eros. Vivamus in ultrices nisl, sit amet vestibulum libero. Cras vel scelerisque nisl. Nam pretium, lacus sit amet consequat aliquam, urna enim pulvinar enim, nec dignissim nibh neque eget diam. Sed facilisis vitae ligula sit amet pharetra. Suspendisse dapibus nisl eget nunc egestas elementum. Nulla pulvinar arcu at placerat sollicitudin. Donec id sagittis tellus.

Aenean non turpis condimentum, pellentesque mauris vitae, molestie purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Phasellus vel interdum magna. Praesent accumsan vehicula magna, et porttitor nisl vestibulum id. Nam turpis ipsum, vulputate eu est quis, porttitor maximus neque. Praesent laoreet vehicula eleifend. Integer mattis urna id risus consequat, in sollicitudin mauris faucibus. Aenean consequat velit tellus, eu ultricies diam sodales et. Morbi tristique, nisl eget feugiat dignissim, neque purus vehicula odio, eu tincidunt orci urna a enim. Suspendisse interdum mauris lorem, nec fermentum elit fermentum sit amet. Aliquam sit amet enim tristique, elementum sem ut, lacinia elit. Morbi cursus ante lacus, vitae congue mi venenatis eget.
    """),
  Dish(
      name: "Plato indio 2",
      price: 20.2,
      imagePath: "assets/images/dish_images/Indian1.jpg",
      description: """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas dignissim varius odio ac pretium. Proin nibh tortor, efficitur in lorem eget, elementum rhoncus velit. Sed vitae arcu et metus faucibus egestas interdum id nunc. Donec non sagittis enim. Ut rutrum tincidunt est sit amet tincidunt. Curabitur a odio nec tellus accumsan porta a non odio. Cras quis iaculis lacus, vitae luctus lacus. Sed consequat, eros ac efficitur luctus, nibh nulla dignissim augue, vitae viverra massa libero a purus. Donec ut quam eget magna mattis placerat vel id eros. Vivamus in ultrices nisl, sit amet vestibulum libero. Cras vel scelerisque nisl. Nam pretium, lacus sit amet consequat aliquam, urna enim pulvinar enim, nec dignissim nibh neque eget diam. Sed facilisis vitae ligula sit amet pharetra. Suspendisse dapibus nisl eget nunc egestas elementum. Nulla pulvinar arcu at placerat sollicitudin. Donec id sagittis tellus.

Aenean non turpis condimentum, pellentesque mauris vitae, molestie purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Phasellus vel interdum magna. Praesent accumsan vehicula magna, et porttitor nisl vestibulum id. Nam turpis ipsum, vulputate eu est quis, porttitor maximus neque. Praesent laoreet vehicula eleifend. Integer mattis urna id risus consequat, in sollicitudin mauris faucibus. Aenean consequat velit tellus, eu ultricies diam sodales et. Morbi tristique, nisl eget feugiat dignissim, neque purus vehicula odio, eu tincidunt orci urna a enim. Suspendisse interdum mauris lorem, nec fermentum elit fermentum sit amet. Aliquam sit amet enim tristique, elementum sem ut, lacinia elit. Morbi cursus ante lacus, vitae congue mi venenatis eget.
    """),
  Dish(
      name: "Plato indio 3",
      price: 30.3,
      imagePath: "assets/images/dish_images/Indian2.jpg",
      description: """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas dignissim varius odio ac pretium. Proin nibh tortor, efficitur in lorem eget, elementum rhoncus velit. Sed vitae arcu et metus faucibus egestas interdum id nunc. Donec non sagittis enim. Ut rutrum tincidunt est sit amet tincidunt. Curabitur a odio nec tellus accumsan porta a non odio. Cras quis iaculis lacus, vitae luctus lacus. Sed consequat, eros ac efficitur luctus, nibh nulla dignissim augue, vitae viverra massa libero a purus. Donec ut quam eget magna mattis placerat vel id eros. Vivamus in ultrices nisl, sit amet vestibulum libero. Cras vel scelerisque nisl. Nam pretium, lacus sit amet consequat aliquam, urna enim pulvinar enim, nec dignissim nibh neque eget diam. Sed facilisis vitae ligula sit amet pharetra. Suspendisse dapibus nisl eget nunc egestas elementum. Nulla pulvinar arcu at placerat sollicitudin. Donec id sagittis tellus.

Aenean non turpis condimentum, pellentesque mauris vitae, molestie purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Phasellus vel interdum magna. Praesent accumsan vehicula magna, et porttitor nisl vestibulum id. Nam turpis ipsum, vulputate eu est quis, porttitor maximus neque. Praesent laoreet vehicula eleifend. Integer mattis urna id risus consequat, in sollicitudin mauris faucibus. Aenean consequat velit tellus, eu ultricies diam sodales et. Morbi tristique, nisl eget feugiat dignissim, neque purus vehicula odio, eu tincidunt orci urna a enim. Suspendisse interdum mauris lorem, nec fermentum elit fermentum sit amet. Aliquam sit amet enim tristique, elementum sem ut, lacinia elit. Morbi cursus ante lacus, vitae congue mi venenatis eget.
    """),
  Dish(
      name: "Plato indio 4",
      price: 40.4,
      imagePath: "assets/images/dish_images/Indian3.jpg",
      description: """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas dignissim varius odio ac pretium. Proin nibh tortor, efficitur in lorem eget, elementum rhoncus velit. Sed vitae arcu et metus faucibus egestas interdum id nunc. Donec non sagittis enim. Ut rutrum tincidunt est sit amet tincidunt. Curabitur a odio nec tellus accumsan porta a non odio. Cras quis iaculis lacus, vitae luctus lacus. Sed consequat, eros ac efficitur luctus, nibh nulla dignissim augue, vitae viverra massa libero a purus. Donec ut quam eget magna mattis placerat vel id eros. Vivamus in ultrices nisl, sit amet vestibulum libero. Cras vel scelerisque nisl. Nam pretium, lacus sit amet consequat aliquam, urna enim pulvinar enim, nec dignissim nibh neque eget diam. Sed facilisis vitae ligula sit amet pharetra. Suspendisse dapibus nisl eget nunc egestas elementum. Nulla pulvinar arcu at placerat sollicitudin. Donec id sagittis tellus.

Aenean non turpis condimentum, pellentesque mauris vitae, molestie purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Phasellus vel interdum magna. Praesent accumsan vehicula magna, et porttitor nisl vestibulum id. Nam turpis ipsum, vulputate eu est quis, porttitor maximus neque. Praesent laoreet vehicula eleifend. Integer mattis urna id risus consequat, in sollicitudin mauris faucibus. Aenean consequat velit tellus, eu ultricies diam sodales et. Morbi tristique, nisl eget feugiat dignissim, neque purus vehicula odio, eu tincidunt orci urna a enim. Suspendisse interdum mauris lorem, nec fermentum elit fermentum sit amet. Aliquam sit amet enim tristique, elementum sem ut, lacinia elit. Morbi cursus ante lacus, vitae congue mi venenatis eget.
    """),
];

final List<Dish> mexicanDishes = [
  Dish(
      name: "Plato mexicano 1",
      price: 10.1,
      imagePath: "assets/images/dish_images/Mexican0.jpg",
      description: """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas dignissim varius odio ac pretium. Proin nibh tortor, efficitur in lorem eget, elementum rhoncus velit. Sed vitae arcu et metus faucibus egestas interdum id nunc. Donec non sagittis enim. Ut rutrum tincidunt est sit amet tincidunt. Curabitur a odio nec tellus accumsan porta a non odio. Cras quis iaculis lacus, vitae luctus lacus. Sed consequat, eros ac efficitur luctus, nibh nulla dignissim augue, vitae viverra massa libero a purus. Donec ut quam eget magna mattis placerat vel id eros. Vivamus in ultrices nisl, sit amet vestibulum libero. Cras vel scelerisque nisl. Nam pretium, lacus sit amet consequat aliquam, urna enim pulvinar enim, nec dignissim nibh neque eget diam. Sed facilisis vitae ligula sit amet pharetra. Suspendisse dapibus nisl eget nunc egestas elementum. Nulla pulvinar arcu at placerat sollicitudin. Donec id sagittis tellus.

Aenean non turpis condimentum, pellentesque mauris vitae, molestie purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Phasellus vel interdum magna. Praesent accumsan vehicula magna, et porttitor nisl vestibulum id. Nam turpis ipsum, vulputate eu est quis, porttitor maximus neque. Praesent laoreet vehicula eleifend. Integer mattis urna id risus consequat, in sollicitudin mauris faucibus. Aenean consequat velit tellus, eu ultricies diam sodales et. Morbi tristique, nisl eget feugiat dignissim, neque purus vehicula odio, eu tincidunt orci urna a enim. Suspendisse interdum mauris lorem, nec fermentum elit fermentum sit amet. Aliquam sit amet enim tristique, elementum sem ut, lacinia elit. Morbi cursus ante lacus, vitae congue mi venenatis eget.
    """),
  Dish(
      name: "Plato mexicano 2",
      price: 20.2,
      imagePath: "assets/images/dish_images/Mexican1.jpg",
      description: """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas dignissim varius odio ac pretium. Proin nibh tortor, efficitur in lorem eget, elementum rhoncus velit. Sed vitae arcu et metus faucibus egestas interdum id nunc. Donec non sagittis enim. Ut rutrum tincidunt est sit amet tincidunt. Curabitur a odio nec tellus accumsan porta a non odio. Cras quis iaculis lacus, vitae luctus lacus. Sed consequat, eros ac efficitur luctus, nibh nulla dignissim augue, vitae viverra massa libero a purus. Donec ut quam eget magna mattis placerat vel id eros. Vivamus in ultrices nisl, sit amet vestibulum libero. Cras vel scelerisque nisl. Nam pretium, lacus sit amet consequat aliquam, urna enim pulvinar enim, nec dignissim nibh neque eget diam. Sed facilisis vitae ligula sit amet pharetra. Suspendisse dapibus nisl eget nunc egestas elementum. Nulla pulvinar arcu at placerat sollicitudin. Donec id sagittis tellus.

Aenean non turpis condimentum, pellentesque mauris vitae, molestie purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Phasellus vel interdum magna. Praesent accumsan vehicula magna, et porttitor nisl vestibulum id. Nam turpis ipsum, vulputate eu est quis, porttitor maximus neque. Praesent laoreet vehicula eleifend. Integer mattis urna id risus consequat, in sollicitudin mauris faucibus. Aenean consequat velit tellus, eu ultricies diam sodales et. Morbi tristique, nisl eget feugiat dignissim, neque purus vehicula odio, eu tincidunt orci urna a enim. Suspendisse interdum mauris lorem, nec fermentum elit fermentum sit amet. Aliquam sit amet enim tristique, elementum sem ut, lacinia elit. Morbi cursus ante lacus, vitae congue mi venenatis eget.
    """),
  Dish(
      name: "Plato mexicano 3",
      price: 20.2,
      imagePath: "assets/images/dish_images/Mexican2.jpg",
      description: """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas dignissim varius odio ac pretium. Proin nibh tortor, efficitur in lorem eget, elementum rhoncus velit. Sed vitae arcu et metus faucibus egestas interdum id nunc. Donec non sagittis enim. Ut rutrum tincidunt est sit amet tincidunt. Curabitur a odio nec tellus accumsan porta a non odio. Cras quis iaculis lacus, vitae luctus lacus. Sed consequat, eros ac efficitur luctus, nibh nulla dignissim augue, vitae viverra massa libero a purus. Donec ut quam eget magna mattis placerat vel id eros. Vivamus in ultrices nisl, sit amet vestibulum libero. Cras vel scelerisque nisl. Nam pretium, lacus sit amet consequat aliquam, urna enim pulvinar enim, nec dignissim nibh neque eget diam. Sed facilisis vitae ligula sit amet pharetra. Suspendisse dapibus nisl eget nunc egestas elementum. Nulla pulvinar arcu at placerat sollicitudin. Donec id sagittis tellus.

Aenean non turpis condimentum, pellentesque mauris vitae, molestie purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Phasellus vel interdum magna. Praesent accumsan vehicula magna, et porttitor nisl vestibulum id. Nam turpis ipsum, vulputate eu est quis, porttitor maximus neque. Praesent laoreet vehicula eleifend. Integer mattis urna id risus consequat, in sollicitudin mauris faucibus. Aenean consequat velit tellus, eu ultricies diam sodales et. Morbi tristique, nisl eget feugiat dignissim, neque purus vehicula odio, eu tincidunt orci urna a enim. Suspendisse interdum mauris lorem, nec fermentum elit fermentum sit amet. Aliquam sit amet enim tristique, elementum sem ut, lacinia elit. Morbi cursus ante lacus, vitae congue mi venenatis eget.
    """),
];
