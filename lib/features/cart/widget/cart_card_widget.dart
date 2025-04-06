import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoes_app/core/shoes_model.dart';
import 'package:shoes_app/features/productDetails/product_details.dart';

class CartCardWidget extends StatefulWidget {
  final ShoesModel model;
  final bool? isShaken;
  final VoidCallback? onTap;
  final bool isSelected;
  const CartCardWidget(
      {super.key,
      required this.model,
      this.isShaken,
      required this.isSelected,
      this.onTap});

  @override
  State<CartCardWidget> createState() => _CartCardWidgetState();
}

class _CartCardWidgetState extends State<CartCardWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _shakeAnimation = Tween<double>(begin: -0.03, end: 0.03).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    if (widget.isShaken == true) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(CartCardWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isShaken != oldWidget.isShaken) {
      if (widget.isShaken == true) {
        _controller.repeat(reverse: true);
      } else {
        _controller.stop();
        _controller.value = 0;
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {});
        widget.onTap?.call();
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.rotate(
            angle: widget.isShaken == true ? _shakeAnimation.value : 0,
            child: AnimatedContainer(
              height: 140,
              margin: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: widget.isSelected
                    ? Border.all(
                        color: Colors.black,
                        width: 2,
                      )
                    : null,
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(30),
              ),
              duration: Duration(milliseconds: 250),
              child: TweenAnimationBuilder(
                tween: Tween<double>(begin: 1, end: 0.5),
                duration: Duration(milliseconds: 500),
                builder: (BuildContext context, double value, Widget? child) =>
                    Opacity(
                  opacity: widget.isSelected ?? false ? value : 1,
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.4,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.model.category.toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey.shade500,
                                      fontFamily:
                                          GoogleFonts.montserrat().fontFamily,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    widget.model.name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    "\$${widget.model.price}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily:
                                          GoogleFonts.montserrat().fontFamily,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Image.asset(
                        widget.model.imageUrl,
                        fit: BoxFit.contain,
                        height: 100,
                      ),
                      const SizedBox(width: 20),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
