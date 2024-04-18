import 'package:flutter/material.dart';
import 'package:merry_marry/pages/home_page.dart';
import 'package:merry_marry/pages/list_page.dart';
import 'package:merry_marry/pages/setting_page.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MerryMarry());
}

class MerryMarry extends StatefulWidget {
  const MerryMarry({super.key});

  @override
  State<MerryMarry> createState() => _MerryMarryState();
}

class _MerryMarryState extends State<MerryMarry> {
  // 네비게이션 바 인덱스
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ListPage(),
    SettingPage()
  ];

  void navTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 기본 홈 페이지
        home: Scaffold(
            appBar: CustomAppBar(),
            body: _pages[_selectedIndex],
            bottomNavigationBar:  BottomNavigationBar(
              items: _navItems.map((item) {
                      return BottomNavigationBarItem(icon: Icon(item.navIcon), label: item.label);
              }).toList(),
              currentIndex: _selectedIndex,
              onTap: navTapped,
              selectedFontSize: 12,
            )
        )
    );
  }
}


/// Custom App Bar
/// 화면의 크기 및 위치와 관련된 정보를 제공하는 위젯
/// PreferredSize 클래스를 사용하여 위젯의 높이를 지정해야 함.
/// AppBar 높이는 kToolbarHeight 상수 사용
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Align(
        alignment: Alignment.centerLeft,
        child: Text('MerryMarry'),
      ),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.account_circle))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

/// NavItem
/// BottomNavigationBar 에 필요한 icon, label을  담고 있는 모델 클래스
class NavItem {
  final IconData navIcon;
  final String label;

  const NavItem({
    required this.navIcon,
    required this.label
  });
}

/// 전역적 선언
/// 네비게이션 추가 또는 삭제를 위해
const _navItems = [
  NavItem(navIcon: Icons.favorite, label: 'home'),
  NavItem(navIcon: Icons.list, label: 'list'),
  NavItem(navIcon: Icons.settings, label: 'setting')
];