import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/constant/rp_textstyle.dart';
import 'package:riverpod_practice/model/rp_admin_user.dart';

class ManagerBlock extends ConsumerWidget {
  final TextEditingController _nameInputController = TextEditingController();
  final TextEditingController _ageInputController = TextEditingController();

  ManagerBlock({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // build関数内でRPAdminUserの状態を監視
    final RPAdminUser rpUser = ref.watch(rpAdminUserProvider);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Text('Name: ${rpUser.name}',
              style: RPTextstyle.detailProfileTextStyle),
          Text('Age: ${rpUser.age}', style: RPTextstyle.detailProfileTextStyle),
          const SizedBox(height: 20),
          // 名前の入力フィールド
          TextField(
            controller: _nameInputController,
            decoration: const InputDecoration(labelText: 'Enter Name'),
          ),
          // 年齢の入力フィールド
          TextField(
            controller: _ageInputController,
            decoration: const InputDecoration(labelText: 'Enter Age'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          // 更新ボタン
          ElevatedButton(
            onPressed: () {
              // ユーザー情報を変更
              final enteredName = _nameInputController.text; // 入力された名前
              final enteredAge = int.tryParse(_ageInputController.text) ??
                  rpUser.age; // 入力された年齢を数値に変換

              // notifierの関数を使って監視している値を変更
              ref.read(rpAdminUserProvider.notifier).updateAdminUser(
                  newAdminUser:
                      RPAdminUser(name: enteredName, age: enteredAge));
            },
            child: const Text('Update User'),
          ),
        ]),
      ),
    );
  }
}
