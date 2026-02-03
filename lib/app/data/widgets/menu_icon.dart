part of 'widgets.dart';

class MenuIcon extends StatelessWidget {
  final String title;
  final IconData icon;
  final int index;
  final MainController controller;

  const MenuIcon({
    super.key,
    required this.title,
    required this.icon,
    required this.index,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.changeTabIndex(index);
      },
      child: Obx(() {
        final isActive = controller.tabIndex.value == index;

        return Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isActive
                ? Theme.of(context).primaryColor
                : Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: isActive
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              if (!isActive)
                Text(
                  title,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }
}
