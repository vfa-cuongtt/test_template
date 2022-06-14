import 'package:test_template/src/common/configs/dependency_injection/injection.dart';
import 'package:test_template/src/routers/e_page.dart';
import 'package:test_template/src/routers/page_config.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:logger/logger.dart';

class NavigationStack {
  NavigationStack({required this.stack, this.boxPageConfig});

  final List<PageConfig> stack;
  final Box<PageConfig>? boxPageConfig;

  List<EPage> get pages {
    return List.unmodifiable(stack.map<EPage>((e) => e.page));
  }

  List<PageConfig> get configs => stack;

  int get length => stack.length;

  PageConfig get first => stack.first;

  PageConfig get last => stack.last;

  ///the reason behind returning Navigation Stack instead of just being a void
  ///is to chain calls as we'll see in navigation_cubit.dart.tmpl
  //not to go into how a cubit defines a state to be new with lists,
  //I've just returned a new instance

  void clear() {
    stack.removeRange(0, stack.length - 2);
    //pages list in navigator can't be empty, remember
  }

  bool canPop() {
    return stack.length > 1;
  }

  bool isBackHistory(PageConfig config) {
    if (stack.length >= 2) {
      return stack.elementAt(stack.length - 2).route == config.route;
    }

    return false;
  }

  Future<NavigationStack> pop() async {
    if (canPop()) {
      stack.remove(stack.last);
    }
    await addLocal();
    return NavigationStack(stack: stack, boxPageConfig: boxPageConfig);
  }

  Future<NavigationStack> pushBeneathCurrent(PageConfig config) async {
    stack.insert(stack.length - 1, config);
    await addLocal();
    return NavigationStack(stack: stack, boxPageConfig: boxPageConfig);
  }

  Future<void> addLocal() async {
    if (boxPageConfig is Box<PageConfig>) {
      await boxPageConfig!.clear();
      await boxPageConfig!.addAll(stack);
      getIt<Logger>().d('[boxPageConfig]: ${boxPageConfig!.values}');
    }
  }

  Future<NavigationStack> restoreStack() async {
    if (boxPageConfig is Box<PageConfig> && boxPageConfig!.values.isNotEmpty) {
      stack
        ..clear()
        ..addAll(boxPageConfig!.values);
    }
    return NavigationStack(stack: stack, boxPageConfig: boxPageConfig);
  }

  Future<NavigationStack> push(PageConfig config) async {
    if (stack.last != config) {
      stack.add(config);
    }
    await addLocal();
    return NavigationStack(stack: stack, boxPageConfig: boxPageConfig);
  }

  NavigationStack replace(PageConfig config) {
    if (canPop()) {
      stack.removeLast();
      push(config);
    } else {
      stack
        ..insert(0, config)
        ..removeLast();
    }
    return NavigationStack(stack: stack, boxPageConfig: boxPageConfig);
  }

  Future<NavigationStack> clearAndPush(PageConfig config) async {
    stack
      ..clear()
      ..add(config);
    await addLocal();
    return NavigationStack(stack: stack, boxPageConfig: boxPageConfig);
  }

  NavigationStack clearAndPushAll(List<PageConfig> configs) {
    stack
      ..clear()
      ..addAll(configs);
    return NavigationStack(stack: stack, boxPageConfig: boxPageConfig);
  }

  @override
  String toString() {
    return stack.toString();
  }
}
