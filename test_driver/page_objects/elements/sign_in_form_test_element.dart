import 'package:flutter_driver/src/driver/driver.dart';

import '../page_objects.dart';
import 'test_element.dart';

class SignInFormTestElement extends TestElement {
  final _emailTextField = find.byValueKey('__Email_Text_Form_Field__');
  final _passwordTextField = find.byValueKey('__Password_Text_Form_Field__');
  final _signInButton = find.byValueKey('__Sign_In_Form_Sign_In_Button__');
  final _registerButton = find.byValueKey('__Sign_In_Form_Register_Button__');
  final _signInWithGoogleButton =
      find.byValueKey('__Sign_In_Form_Sign_In_With_Google_Button__');

  SignInFormTestElement(FlutterDriver driver) : super(driver);

  Future<void> enterEmail(String emailStr) async {
    await driver.tap(_emailTextField);
    await driver.enterText(emailStr);
    await driver.waitFor(find.text(emailStr));
  }

  Future<void> enterPassword(String passwordStr) async {
    await driver.tap(_passwordTextField);
    await driver.enterText(passwordStr);
    await driver.waitFor(find.text(passwordStr));
  }

  Future<WeatherTestPage> tapSignInButton() async {
    await driver.tap(_signInButton);
    return WeatherTestPage(driver);
  }

  Future<WeatherTestPage> tapRegisterButton() async {
    await driver.tap(_registerButton);
    return WeatherTestPage(driver);
  }

  Future<WeatherTestPage> tapSignInWithGoogleButton() async {
    await driver.tap(_signInWithGoogleButton);
    return WeatherTestPage(driver);
  }
}
