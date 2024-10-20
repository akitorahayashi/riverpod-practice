import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class RPUser {
  final String id = UniqueKey().toString();
  final String name;
  final int age;

  RPUser({required this.name, required this.age});
}

final rpUserProvider = StateNotifierProvider<RPUserNotifier, List<RPUser>>(
  (ref) => RPUserNotifier(),
);

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
  void updateUser(String oldId, RPUser updatedUser) {
    state = state
        .map((user) => user.id == oldId ? updatedUser : user)
        .toList(); // ID が一致するユーザーを更新
  }
}
