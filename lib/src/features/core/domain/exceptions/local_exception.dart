import 'package:test_template/src/features/core/domain/exceptions/app_exception.dart';

class LocalException implements AppException {
  @override
  String get message => 'Error occur local';
}
