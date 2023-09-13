import 'package:flutter/material.dart';

void showToast(BuildContext context, String message) {
  final overlay = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.of(context).size.height * 0.1,
      right:10,
      child: Material(
        color: Colors.transparent,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            border:Border.all(color: const Color.fromARGB(10, 0, 0, 0)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Wrap(
            children: [
              const Icon(Icons.check_circle, color: Colors.green),
              const SizedBox(width: 5),
              Text(
                message,
                style: const TextStyle(color: Colors.black, fontSize: 16),
              )
            ],
          ),
        ),
      ),
    ),
  );

  Overlay.of(context).insert(overlay);
  Future.delayed(const Duration(seconds: 2), () {
    overlay.remove();
  });
}
