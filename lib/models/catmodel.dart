// To parse this JSON data, do
//
//     final productoModel = productoModelFromJson(jsonString);

import 'dart:convert';

CatModel productoModelFromJson(String str) => CatModel.fromJson(json.decode(str));

String productoModelToJson(CatModel data) => json.encode(data.toJson());

class CatModel {

    String id;
    String ideCa;
    String nombreCa; //trabajamos decimales

    CatModel({
        this.id,
        this.ideCa = '',
        this.nombreCa  = '',

    });

    factory CatModel.fromJson(Map<String, dynamic> json) => new CatModel(
        id         : json["id"],
        ideCa     : json["ideCa"],
        nombreCa      : json["nombreCa"],

    );

    Map<String, dynamic> toJson() => {
        // "id"         : id,
        "ideCa"     : ideCa,
        "nombreCa"      : nombreCa,

    };
}
