// import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:shop_app/models/catmodel.dart';
// import 'package:flutter/material.dart';

class CategoriasProvider {

  CollectionReference  categoriass = FirebaseFirestore.instance.collection('categorias');


  getCategorias() async {
    print("crimea");
    return categoriass
    .snapshots();

  }


}