import 'package:test_template/src/features/core/domain/exceptions/app_exception.dart';

class UnknownException implements AppException {
  const UnknownException();

  @override
  String get message => 'Unknown Error';
}
