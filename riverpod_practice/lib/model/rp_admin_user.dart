import 'package:riverpod_practice/model/external/pref_service.dart';
import 'package:riverpod_practice/model/rp_user.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dart:convert';

// クラスの定義
class RPAdminUser extends RPUser {
  RPAdminUser({
    // 親クラスのコンストラクタで必要とされているパラメータを明示的に呼び出す
    required super.name,
    required super.age,
  });

  // JSONからRPAdminUserを生成するファクトリーメソッド
  factory RPAdminUser.fromJson(Map<String, dynamic> json) {
    return RPAdminUser(
      name: json['name'],
      age: json['age'],
    );
  }

  // RPAdminUserをJSONに変換するメソッド
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
    };
  }
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
      : super(RPAdminUser(name: '', age: 20)) /* 初期stateをRPUserで指定 */ {
    // sharedPreferenceからデータを取得
    PrefService().getPref.then((pref) {
      final savedAdminUser = pref.getString("rpAdminUser");
      if (savedAdminUser != null) {
        final readAdminUser = RPAdminUser.fromJson(json.decode(pref.getString(
            "rpAdminUser")!)); // sharedPreferenceから取得したデータをRPAdminUserに変換
        state = readAdminUser; // stateを更新
      }
    });
  }

  // adminUser状態を操作するメソッド
  void updateAdminUser({required RPAdminUser newAdminUser}) {
    state = newAdminUser;
    PrefService().getPref.then((pref) {
      pref.setString("rpAdminUser", json.encode(newAdminUser.toJson()));
    });
  }
}
