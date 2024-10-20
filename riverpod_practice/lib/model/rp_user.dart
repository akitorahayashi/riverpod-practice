import 'package:flutter_riverpod/flutter_riverpod.dart';

// クラスの定義
class RPUser {
  final String name;
  final int age;

  RPUser({required this.name, required this.age});
}

// Provider
final rpUserProvider = StateNotifierProvider<RPUserNotifier, RPUser>
    /* StateNotifierProviderの第一引数はNotifier、第二引数は提供するstateの型 */
    ((ref) {
  return RPUserNotifier();
});

// Notifier
class RPUserNotifier extends StateNotifier<
    RPUser> /* StateNotifierの型パラメータは、監視するstateの型（RPUser）を指定 */ {
  RPUserNotifier()
      : super(RPUser(name: 'John', age: 20)) /* 初期stateをRPUserで指定 */;

  // 状態を操作するメソッド
  void updateUser({required String enteredName, required int selectedAge}) {
    state = RPUser(name: enteredName, age: selectedAge);
  }
}
