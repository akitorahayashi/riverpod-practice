import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/model/rp_admin_user.dart';
import 'package:riverpod_practice/view/manager_block.dart';

class RPHomePage extends ConsumerWidget {
  const RPHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            ElevatedButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
