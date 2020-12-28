import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
// import 'package:shop_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String conformpassword;
  String nombreCompleto;
  String numeroDocumento;
  String celular;
  bool remember = false;
  final List<String> errors = [];
  FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildNombreFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildDocFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildCelularFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConformPassFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continuar",
            press: () async {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                showLoaderDialog(context);
                crearUsuario(
                    celular: celular,
                    nombres: nombreCompleto,
                    documento: numeroDocumento,
                    contrasena: password,
                    correo: email);
                // if all are valid then go to success screen

              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => conformpassword = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && password == conformpassword) {
          removeError(error: kMatchPassError);
        }
        conformpassword = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirmar Contraseña",
        hintText: "Re-ingresa tu contraseña",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Contraseña",
        hintText: "Ingresa tu contraseña",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Ingresa tu email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  TextFormField buildNombreFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) => nombreCompleto = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        } else if (value.length < 8) {
          removeError(error: kNamellongError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kNamellongError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Nombre completo",
        hintText: "Ingresa tus nombres y apellidos",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildDocFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      maxLength: 8,
      onSaved: (newValue) => numeroDocumento = newValue.toString(),
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kdoclNullError);
        } else if (value.length > 8) {
          removeError(error: kdoclongError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kdoclNullError);
          return "";
        } else if (value.length > 8) {
          addError(error: kdoclongError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Numero de documento",
        hintText: "Ingresa DNI",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildCelularFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      maxLength: 9,
      onSaved: (newValue) => celular = newValue.toString(),
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        } else if (value.length == 9) {
          removeError(error: kPhoneNumberLongError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        } else if (value.length < 9) {
          addError(error: kPhoneNumberLongError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        prefix: Text('+51'),
        labelText: "Celular",
        hintText: "Ingresa Celular",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void crearUsuario(
      {String correo,
      String contrasena,
      String nombres,
      String documento,
      String celular}) async {
    try {
      UserCredential authresult = await _auth.createUserWithEmailAndPassword(
          email: correo.trim(), password: contrasena);

      _auth.currentUser.updateProfile(displayName: nombres);
      var nombre = _auth.currentUser.displayName;
      print(nombre);
      try {
        await _firestore.collection("usuarios").doc(authresult.user.uid).set({
          "nombreUs": nombres,
          "celular": celular,
          "contraseña": contrasena,
          "email": email,
          "dni": documento
        });
        Navigator.pushNamed(context, SignInScreen.routeName);
      } catch (e) {
        print(e);
      }
    } catch (e) {
      print(e);
    }
  }
}
