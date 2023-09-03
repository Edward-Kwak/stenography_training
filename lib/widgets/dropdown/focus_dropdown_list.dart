part of 'focus_dropdown_button.dart';

class FocusDropdownList<T> extends StatefulWidget {
  const FocusDropdownList({
    super.key,
    required this.offset,
    required this.width,
    required this.isUpside,
    required this.layerLink,
    required this.items,
    required this.selectedValue,
    required this.toValue,
    this.isDataGridItem = false,
  });

  final Offset offset;
  final double width;
  final bool isUpside;
  final LayerLink layerLink;
  final List<T> items;
  final T? selectedValue;
  final String Function(T value) toValue;
  final bool isDataGridItem;

  @override
  State<FocusDropdownList<T>> createState() => _FocusDropdownListState<T>();
}

class _FocusDropdownListState<T> extends State<FocusDropdownList<T>> {
  late List<TextStyle> itemTextStyles =
  List.generate(widget.items.length, (index) => AppStyles.bodyMR);
  late List<Color> itemBackgroundColors =
  List.generate(widget.items.length, (index) => AppColors.white);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
            ),
          ),
          Positioned(
            top: widget.isUpside ? null : widget.offset.dy,
            left: widget.offset.dx,
            bottom: !widget.isUpside ? null : widget.offset.dy,
            child: CompositedTransformFollower(
              link: widget.layerLink,
              targetAnchor:
              widget.isUpside ? Alignment.topLeft : Alignment.bottomLeft,
              followerAnchor:
              widget.isUpside ? Alignment.bottomLeft : Alignment.topLeft,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                padding: const EdgeInsets.symmetric(vertical: 10),
                height: widget.items.length >= 8
                    ? 8 * 36 + 22
                    : widget.items.length * 36 + 22,
                width: widget.width,
                decoration: AppDecorations.borderGreyRadius10.copyWith(
                  boxShadow: [
                    const BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 2,
                      color: AppColors.greyDisableButton,
                    )
                  ],
                ),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: widget.items.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => Navigator.of(context).pop(widget.items[index]),
                    onHover: (hovered) {
                      if (hovered) {
                        setState(() {
                          itemTextStyles[index] = AppStyles.bodyMB
                              .copyWith(color: AppColors.primary100);
                          itemBackgroundColors[index] = AppColors.primary20;
                        });
                      } else {
                        setState(() {
                          itemTextStyles[index] = AppStyles.bodyMR;
                          itemBackgroundColors[index] = AppColors.white;
                        });
                      }
                    },
                    child: Container(
                      alignment: widget.isDataGridItem
                          ? Alignment.center
                          : Alignment.centerLeft,
                      height: 36,
                      width: double.infinity,
                      color: itemBackgroundColors[index],
                      padding: widget.isDataGridItem
                          ? EdgeInsets.zero
                          : const EdgeInsets.only(left: 16),
                      child: Text(
                        widget.toValue(widget.items[index]),
                        style: itemTextStyles[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
