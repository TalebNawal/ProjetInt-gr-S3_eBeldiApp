import 'package:flutter/material.dart';

String uri = 'http://192.168.43.43:5000';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 213, 171, 20),
      Color.fromARGB(255, 255, 217, 0),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromARGB(255, 213, 171, 20);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Color.fromARGB(255, 11, 67, 29)!;
  static const unselectedNavBarColor = Colors.black87;

  // STATIC IMAGES
  static const List<String> carouselImages = [
    'https://media.istockphoto.com/id/120576717/photo/jars-of-honey-and-dipper.jpg?s=612x612&w=0&k=20&c=mIhQx4PlUMjiDUGNezmXFn_hXRTLSt8AlorRMQBTcaw=',
    'https://media.istockphoto.com/id/638406692/photo/olive-oil.jpg?s=612x612&w=0&k=20&c=I_E-Q3f2-xd-3Xr8yz9906X1ixdX2xOzXLLEiq3ipWs=',
    'https://media.istockphoto.com/id/1141250153/photo/olives-on-white.jpg?s=612x612&w=0&k=20&c=ljnT1odgB6chsfTWOl6FrJ-USmEiS0eW_YKLsppdEzc=',
    'https://media.istockphoto.com/id/815165708/photo/spelt-whole-grain-flour.jpg?s=612x612&w=0&k=20&c=4fxLuVvhKk7icVJs4BEHz1DpRzf6SU4pfZYsyiyE6lc=',
    'https://media.istockphoto.com/id/157637475/photo/variety-of-spices.jpg?s=612x612&w=0&k=20&c=_tNOem-nqz8dwDWnNqjclD4OSxIPmH4wwSTm6X3ldXE=',
    'https://media.istockphoto.com/id/857057200/photo/spices-and-herbs-isolated-on-white-background.jpg?s=612x612&w=0&k=20&c=C520xXsTfq_aN-gRV8FvIYtjqelhdWaS_6TutpFAaN0=',
    'https://media.istockphoto.com/id/1203174798/photo/black-tea-cup-shot-from-above-on-white-background-copy-space.jpg?s=612x612&w=0&k=20&c=lMIb1zbaWgGJyxc_5CqUIgJm6M1l9ltwfZACtho7x9A=',
    'https://media.istockphoto.com/id/1210564532/fr/photo/huile-dolive-et-olives-isol%C3%A9es-sur-le-fond-blanc-r%C3%A9fl%C3%A9chissant.jpg?b=1&s=170667a&w=0&k=20&c=gRjc6OY1khQpUHMWdidlRMZ87Kp8Yh8u541E5WaWy3E=',
    'https://cdn.pixabay.com/photo/2020/05/01/10/36/olive-5116310__480.png',
    'https://cdn.pixabay.com/photo/2018/03/01/23/03/eat-3191933__480.jpg',
    'https://media.istockphoto.com/id/1384978726/fr/photo/bal-kaymak-turc-cr%C3%A8me-au-miel-et-au-beurre.jpg?b=1&s=170667a&w=0&k=20&c=MVHYWmAQRdk2mjzt4Lob51ZqecAaTlLHVt0VbJimYZw=',

    //'https://cdn.pixabay.com/photo/2017/08/19/08/42/olive-2657693__480.jpg',
    // 'https://cdn.pixabay.com/photo/2016/08/15/22/30/olive-oil-1596639__480.jpg',
    'https://media.istockphoto.com/id/576732962/fr/photo/lhuile-dolive.jpg?b=1&s=170667a&w=0&k=20&c=gNz7JhMFx0m5LNp6mRua7EYRLGLv691c_hbOGxKup5k=',

    //'https://cdn.pixabay.com/photo/2017/08/19/08/42/olive-2657696_1280.jpg',
    // 'https://cdn.pixabay.com/photo/2016/08/15/20/29/olive-oil-1596417_1280.jpg',
    //'https://www.agrimaroc.ma/wp-content/uploads/produits-terroir-labels-660x330.png',
    //'https://www.challenge.ma/wp-content/uploads/2016/01/produit-terroir1.jpg',
    //'https://aujourdhui.ma/wp-content/uploads/2021/04/ADA-Maroc-produits-du-terroir.jpg',
    // 'https://www.leconomiste.com/sites/default/files/eco7/public/produits-terroir-mohammedia.jpg',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Huiles',
      'image': 'assets/images/huile-dolive.jpeg',
    },
    {
      'title': 'Miel',
      'image': 'assets/images/pot-de-miel.jpeg',
    },
    {
      'title': 'Farines',
      'image': 'assets/images/farine.jpeg',
    },
    {
      'title': 'Epices',
      'image': 'assets/images/epices.jpeg',
    },
    {
      'title': 'Tisanes',
      'image': 'assets/images/tisane.jpeg',
    },
    {
      'title': 'Fruits secs',
      'image': 'assets/images/amande.jpeg',
    },
  ];
}
