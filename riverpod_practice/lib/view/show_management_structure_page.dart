import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/constant/rp_textstyle.dart';
import 'package:riverpod_practice/model/rp_admin_user.dart';

class RPHomePage extends ConsumerWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  RPHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // RPUser の状態を監視
    final RPAdminUser rpUser = ref.watch(rpUserProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Riverpod Practice"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text('Name: ${rpUser.name}',
                style: RPTextstyle.detailProfileTextStyle),
            Text('Age: ${rpUser.age}',
                style: RPTextstyle.detailProfileTextStyle),
            const SizedBox(height: 20),
            // 名前の入力フィールド
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Enter Name'),
            ),
            // 年齢の入力フィールド
            TextField(
              controller: ageController,
              decoration: InputDecoration(labelText: 'Enter Age'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            // 更新ボタン
            ElevatedButton(
              onPressed: () {
                // ユーザー情報を変更
                final enteredName = nameController.text; // 入力された名前
                final selectedAge = int.tryParse(ageController.text) ??
                    rpUser.age; // 入力された年齢を数値に変換

                // ユーザー情報を更新するメソッドを呼び出す
                ref.read(rpUserProvider.notifier).updateUser(
                      enteredName: enteredName,
                      selectedAge: selectedAge,
                    );
              },
              child: Text('Update User'),
            ),
          ],
        ),
      ),
    );
  }
}
