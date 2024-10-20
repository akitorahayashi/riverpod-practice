import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/constant/rp_textstyle.dart';
import 'package:riverpod_practice/model/rp_admin_user.dart';

class ManagerBlock extends ConsumerWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  ManagerBlock({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // RPAdminUser の状態を監視
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
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Enter Name'),
          ),
          // 年齢の入力フィールド
          TextField(
            controller: _ageController,
            decoration: const InputDecoration(labelText: 'Enter Age'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          // 更新ボタン
          ElevatedButton(
            onPressed: () {
              // ユーザー情報を変更
              final enteredName = _nameController.text; // 入力された名前
              final selectedAge = int.tryParse(_ageController.text) ??
                  rpUser.age; // 入力された年齢を数値に変換

              // ユーザー情報を更新するメソッドを呼び出す
              ref.read(rpAdminUserProvider.notifier).updateAdminUser(
                    enteredName: enteredName,
                    selectedAge: selectedAge,
                  );
            },
            child: const Text('Update User'),
          ),
        ]),
      ),
    );
  }
}
