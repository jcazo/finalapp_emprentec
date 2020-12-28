import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    @required this.id,
    @required this.images,
    @required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    @required this.title,
    @required this.price,
    @required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/image-22FF44.png",
      // "assets/images/ps4_console_white_1.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "LIBRO EDMINISTER ELECTRICOS",
    price: 45,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/image-44RT11.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "PSP REMATE",
    price: 200,
    description: description2,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/image-54FD12.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Clases de termo",
    price: 30,
    description: description3,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/image-88KK23.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "SE VENDE TAJADA DE TORTA",
    price: 5.0,
    description: description4,
    rating: 4.1,
    isFavourite: true,
  ),
];

const String description =
    "Libro fotocopiado pirateado a buen precio \n Libros - Emprendedor: LIBROSPI \nUnidad: unid IDANUN: 22FF44";
const String description2 =
    "Vendo psp en buen estado 8/10 \nTecnología - Emprendedor: TECH-MARK \nUnidad: unid IDANUN: 44RT11";
const String description3 =
    "doy clases de termo aprobe a la primera con rios. El más crack. \n Asesoría - Emprendedor: CLASSTEC \n Unidad: hora IDANUN: 54FD12";
const String description4 =
    "relleno de chocolate con manajar y tocosh \n Postres - Emprendedor: POSTREC \n Unidad: tajada IDANUN: 88KK23";
const String description5 =
    "Libro fotocopiado pirateado a buen precio";
