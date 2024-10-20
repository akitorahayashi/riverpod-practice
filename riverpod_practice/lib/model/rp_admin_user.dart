import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/model/rp_user.dart';

// クラスの定義
class RPAdminUser extends RPUser {
  // 親クラスのコンストラクタを明示的に呼び出す
  RPAdminUser({required super.name, required super.age});
}

// Provider
final rpUserProvider = StateNotifierProvider<RPUserNotifier, RPAdminUser>
    /* StateNotifierProviderの第一引数はNotifier、第二引数は提供するstateの型 */
    ((ref) {
  return RPUserNotifier();
});

// Notifier
class RPUserNotifier extends StateNotifier<
    RPAdminUser> /* StateNotifierの型パラメータは、監視するstateの型（RPUser）を指定 */ {
  RPUserNotifier()
      : super(RPAdminUser(name: 'John', age: 20)) /* 初期stateをRPUserで指定 */;

  // 状態を操作するメソッド
  void updateUser({required String enteredName, required int selectedAge}) {
    state = RPAdminUser(name: enteredName, age: selectedAge);
  }
}
