import 'package:riverpod_practice/model/rp_user.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

// クラスの定義
class RPAdminUser extends RPUser {
  RPAdminUser({
    // 親クラスのコンストラクタで必要とされているパラメータを明示的に呼び出す
    required super.name,
    required super.age,
  });
}

// Provider
final rpAdminUserProvider =
    StateNotifierProvider.autoDispose<RPUserNotifier, RPAdminUser>(
        /* StateNotifierProviderの第一引数はNotifier、第二引数は提供するstateの型 */
        (ref) {
  return RPUserNotifier();
});

// Notifier
class RPUserNotifier extends StateNotifier<
    RPAdminUser> /* StateNotifierの型パラメータは、監視するstateの型（RPUser）を指定 */ {
  RPUserNotifier()
      : super(RPAdminUser(name: '', age: 20)) /* 初期stateをRPUserで指定 */;

  // adminUser状態を操作するメソッド
  void updateAdminUser(
      {required String enteredName, required int selectedAge}) {
    state = RPAdminUser(name: enteredName, age: selectedAge);
  }
}
