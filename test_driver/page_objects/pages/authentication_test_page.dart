import 'package:flutter_driver/src/driver/driver.dart';

import '../elements/sign_in_form_test_element.dart';
import '../utils.dart';
import 'test_page.dart';

class AuthenticationTestPage extends TestPage {
  final _signInForm = find.byValueKey('__SIGN_IN_FORM_WIDGET__');

  AuthenticationTestPage(FlutterDriver driver) : super(driver);

  @override
  Future<bool> isReady({Duration timeout}) async {
    return widgetExists(driver, _signInForm);
  }

  SignInFormTestElement get signInFormTestElement =>
      SignInFormTestElement(driver);
}
