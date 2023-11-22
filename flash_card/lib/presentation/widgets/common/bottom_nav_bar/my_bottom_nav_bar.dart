import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavIndexProvider = StateProvider<int>((ref) => 0);

class MyBottomNavBar extends ConsumerWidget {
  const MyBottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      // SafeAreaを追加
      child: SizedBox(
        height: 39, // コンテナの高さを増やす
        child: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: (index) {
            ref.read(bottomNavIndexProvider.notifier).state = index;
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 20), // アイコンサイズを指定
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school, size: 20), // アイコンサイズを指定
              label: 'vocabulary',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book, size: 20), // アイコンサイズを指定
              label: 'sentence',
            ),
          ],
          backgroundColor: Colors.white.withOpacity(0.8),
          selectedItemColor: Colors.blue.shade300,
          unselectedItemColor: Colors.grey.shade500,
          currentIndex: ref.watch(bottomNavIndexProvider),
          selectedLabelStyle: const TextStyle(fontSize: 8), // テキストサイズを調整
          unselectedLabelStyle: const TextStyle(fontSize: 8), // テキストサイズを調整
        ),
      ),
    );
  }
}
