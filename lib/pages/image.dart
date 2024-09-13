import 'package:flutter/material.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  int count = 0;
  String imgURL =
      "https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExZTU5djZnaHIweWFqaTNwc21seHkydDYwYTlvYnEydmEzaWkwc2FpMSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9cw/7UeCUvFZRqoZ16ZysE/giphy.webp";
  String buttonMess = "Jump!";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Image.network(imgURL),
          ),
          FilledButton(
              onPressed: () {
                count++;
                if (count % 2 == 1) {
                  setState(
                    () {
                      imgURL =
                          "https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExZWE4bWh3eHU5cnN4c25qN2lhNDE0eW1oYjd4bWJ6dnBicGltbHEzaiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/PRjOfXMsyJuN7kQGla/giphy.webp";
                      buttonMess = "No Jumping";
                    },
                  );
                } else {
                  setState(() {
                    imgURL =
                        "https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExZTU5djZnaHIweWFqaTNwc21seHkydDYwYTlvYnEydmEzaWkwc2FpMSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9cw/7UeCUvFZRqoZ16ZysE/giphy.webp";
                    buttonMess = "Jump!";
                  });
                }
              },
              child: Text(buttonMess))
        ],
      ),
    );
  }
}
