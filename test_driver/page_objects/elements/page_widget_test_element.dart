import 'package:flutter_driver/src/driver/driver.dart';

import '../utils.dart';
import 'test_element.dart';

class PageWidgetTestElement extends TestElement {
  final _progressIndicator =
      find.byValueKey('__Splash_Page_Progress_Indicator__');

  PageWidgetTestElement(FlutterDriver driver) : super(driver);

  Future<bool> isReady() async {
    return widgetExists(driver, _progressIndicator);
  }
}
