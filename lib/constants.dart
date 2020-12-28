import 'package:flutter/material.dart';
import 'package:shop_app/size_config.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Porfavor ingresa tu email";
const String kInvalidEmailError = "Porfavor ingresa un Email válido";
const String kPassNullError = "Porfavor ingresa tu contraseña";
const String kShortPassError = "Contraseña muy corta";
const String kMatchPassError = "Contraseña no coincide";
const String kNamelNullError = "Porfavor ingresa tu nombre";
const String kNamellongError = "Porfavor un nombre mas completo";
const String kdoclNullError = "Porfavor ingresa tu nombre";
const String kdoclongError = "Porfavor un nombre mas completo";
const String kPhoneNumberNullError = "Porfavor ingresa tu teléfono";
const String kPhoneNumberLongError =
    "Porfavor ingresa un telefono de 9 digitos";
const String kAddressNullError = "Porfavor ingresa tu dirección";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}
