// ignore_for_file: unnecessary_this

import 'package:path/path.dart' as p;
import 'package:trab_front/helpers/constants/strings.dart';
import 'package:trab_front/helpers/enums/trash_type.dart';
import 'package:trab_front/helpers/extensions/datetime_extension.dart';

import '../constants/app_utils.dart' show Regexes;

extension StringExt on String {
  /// An extension for validating String is an email.
  bool get isValidEmail => Regexes.emailRegex.hasMatch(this);

  /// An extension for validating String is a name.
  bool get isValidName => Regexes.nameRegex.hasMatch(this);

  /// An extension for validating String is a contact.
  bool get isValidContact => Regexes.contactRegex.hasMatch(this);

  /// An extension for validating String is a contact.
  bool get isValidErp => Regexes.erpRegex.hasMatch(this);

  /// An extension for validating String is a zipcode.
  bool get isValidZipCode => Regexes.zipCodeRegex.hasMatch(this);

  /// An extension for validating String is a credit card number.
  bool get isValidCreditCardNumber =>
      Regexes.creditCardNumberRegex.hasMatch(this);

  /// An extension for validating String is a credit card CVV.
  bool get isValidCreditCardCVV => Regexes.creditCardCVVRegex.hasMatch(this);

  /// An extension for validating String is a credit card expiry.
  bool get isValidCreditCardExpiry =>
      Regexes.creditCardExpiryRegex.hasMatch(this);
  String get removeSpecialCharacters =>
      this.replaceAll(RegExp(r'[^\w\sㄱ-ㅎㅏ-ㅣ가-힣]+'), AppStrings.empty);

  /// An extension for converting String to Capitalcase.
  String get capitalize =>
      this[0].toUpperCase() + this.substring(1).toLowerCase();

  /// An extension for replacing underscores in a String with spaces.
  String get removeUnderScore => this.replaceAll('_', ' ');

  /// An extension for getting file extension
  String get ext => p.extension(this);

  String getTimerFormatted() {
    List<String> parts = this.split(':');
    if (parts.length != 2) {
      return "0:00";
    }

    int minutes = int.tryParse(parts[0]) ?? 0;
    int seconds = int.tryParse(parts[1]) ?? 0;

    Duration duration = Duration(minutes: minutes, seconds: seconds);
    Duration nextDuration = duration + const Duration(seconds: 1);

    String newMinutes = (nextDuration.inMinutes % 60).toString();
    String newSeconds =
        (nextDuration.inSeconds % 60).toString().padLeft(2, '0');

    return "$newMinutes:$newSeconds";
  }

  int getMinutes() {
    List<String> parts = this.split(':');

    int minutes = int.tryParse(parts[0]) ?? 0;

    return minutes;
  }

  int getSeconds() {
    List<String> parts = this.split(':');

    int seconds = int.tryParse(parts[1]) ?? 0;

    return seconds;
  }

  String get getDateUpperString =>
      DateTime.parse('20$this').getCurrentDateFormatted().toUpperCase();
}
