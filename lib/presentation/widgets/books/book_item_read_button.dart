import 'package:deep_read_app/presentation/views/books/book_preview.dart';
import 'package:flutter/material.dart';

class BookItemReadButton extends StatelessWidget {
  final String previewLink;

  const BookItemReadButton({
    Key? key,
    required this.previewLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookPreview(
              previewLink: previewLink,
            ),
          ),
        );
      },
      child: const Text('Ver Vista Previa'),
    );
  }
}
