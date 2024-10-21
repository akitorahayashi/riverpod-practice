import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class RPUser {
  final String id = UniqueKey().toString();
  final String name;
  final int age;

  RPUser({required this.name, required this.age});
}

final rpUsersProvider =
    StateNotifierProvider.autoDispose<RPUserNotifier, List<RPUser>>((ref) {
  return RPUserNotifier();
});

// 自分でカスタマイズしたdisposeを実装する場合
// final counterProvider = StateNotifierProvider<RPUserNotifier, int>((ref) {
//   final notifier = RPUserNotifier();

//   ref.onDispose(() {
//     notifier.dispose();
//   });

//   return notifier;
// });

class RPUserNotifier extends StateNotifier<List<RPUser>> {
  RPUserNotifier() : super([]);

  // ユーザーを追加するメソッド
  void addUser(RPUser user) {
    state = [...state, user]; // 新しいユーザーをリストに追加
  }

  // ユーザーを削除するメソッド
  void removeUser(String id) {
    state = state.where((user) => user.id != id).toList(); // ID でフィルタリングして削除
  }

  // ユーザーを更新するメソッド
  void updateUser({required int indexInUsers, required RPUser updatedUser}) {
    // リスト全体を新しいリストとして再設定することで再描画をトリガーする
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == indexInUsers) updatedUser else state[i],
    ];
  }
}
