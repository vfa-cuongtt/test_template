import 'package:test_template/src/common/configs/dependency_injection/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  generateForDir: [''],
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<GetIt> configureDependencies({required String environment}) async {
  final regExpEnv = RegExp(
    r'^dev|test|$',
  );
  assert(regExpEnv.hasMatch(environment), 'Environment is not valid');
  return $initGetIt(getIt, environment: environment);
}
