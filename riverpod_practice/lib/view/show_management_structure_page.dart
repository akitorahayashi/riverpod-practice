import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/model/rp_user.dart';
import 'package:riverpod_practice/view/employees_block.dart';
import 'package:riverpod_practice/view/manager_block.dart';

class RPHomePage extends ConsumerWidget {
  const RPHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<RPUser> rpUsers = ref.watch(rpUsersProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Riverpod Practice"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ManagerBlock(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Center(
                child: Text("-  Employees  -", style: TextStyle(fontSize: 20)),
              ),
            ),
            ...List.generate(
              rpUsers.length,
              (index) => EmployeeBlock(indexInrpUsers: index),
            ),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(rpUsersProvider.notifier)
                    .addUser(RPUser(name: 'Guest', age: 20));
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
