import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_template/src/routers/bloc/navigation_stack.dart';
import 'package:test_template/src/routers/page_config.dart';
import 'package:hive/hive.dart';

class NavigationCubit extends Cubit<NavigationStack> {
  NavigationCubit(
    List<PageConfig> initialPages, [
    Box<PageConfig>? boxPageConfig,
  ]) : super(
          NavigationStack(stack: initialPages, boxPageConfig: boxPageConfig),
        );

  Future<void> push(String path, [Map<String, dynamic>? args]) async {
    final config = PageConfig(location: path, args: args);
    emit(await state.push(config));
  }

  Future<void> clearAndPush(String path, [Map<String, dynamic>? args]) async {
    final config = PageConfig(location: path, args: args);
    emit(await state.clearAndPush(config));
  }

  Future<void> pop() async {
    emit(await state.pop());
  }

  bool canPop() {
    return state.canPop();
  }

  Future<void> pushBeneathCurrent(
    String path, [
    Map<String, dynamic>? args,
  ]) async {
    final config = PageConfig(location: path, args: args);
    emit(await state.pushBeneathCurrent(config));
  }

  bool isBackHistory(PageConfig config) {
    return state.isBackHistory(config);
  }

  Future<void> restoreState() async {
    emit(await state.restoreStack());
  }
}
