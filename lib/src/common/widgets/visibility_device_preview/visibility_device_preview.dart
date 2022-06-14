import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_template/src/app.dart';

class VisibilityDevicePreview extends StatelessWidget {
  const VisibilityDevicePreview({
    Key? key,
    required this.enabled,
  }) : super(key: key);

  final bool enabled;

  bool get useInheritedMediaQuery => true;

  Widget builder(BuildContext context, Widget? widget) {
    return DevicePreview.appBuilder(context, widget);
  }

  @override
  Widget build(BuildContext context) {
    return enabled
        ? DevicePreview(
            builder: (BuildContext context) => MyApp(devicePreview: this),
          )
        : const MyApp();
  }
}
