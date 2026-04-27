import 'package:flutter/material.dart';
import 'package:projectquranmu_application/components/navbar/navmodel.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap, this.onCenterTap,
  });

  final List<NavItem> items;
  final int currentIndex;
  final Function(int) onTap;
  final VoidCallback? onCenterTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, 
      height: 80,
      decoration: BoxDecoration(
        color: const Color(0xff5F9F9F),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(items.length, (index) {
              final item = items[index];
              final isActive = index == currentIndex;

              return InkWell(
                customBorder: CircleBorder(),
                onTap: () => onTap(index),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item.icon,
                      color: isActive ? Colors.white : Colors.white70,
                      size: 35,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.label,
                      style: TextStyle(
                        color: isActive ? Colors.white : Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),

          // FLOATING CENTER ICON
          Positioned(
            top: -20,
            child: GestureDetector(
              onTap: onCenterTap,
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color(0xff5F9F9F),   // warna border
                    width: 5,             // ketebalan
                  ),
                ),
                child: Icon(
                  Icons.menu_book, 
                  color: Color(0xff5F9F9F),
                  size: 35,
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}