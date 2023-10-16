import 'package:flutter/cupertino.dart';

class Base {
  static Widget emptyData() {
    return SizedBox(
      width: double.infinity,
      child: Image.asset('asset/images/no_internet.png'),
    );
  }
}
