import 'package:flutter/material.dart';
import 'package:places/ui/screen/widgets/network_image.dart';

class PhotoCarousel extends StatefulWidget {
  final List<String> elements;
  PhotoCarousel({this.elements});
  @override
  _PhotoCarouselState createState() => _PhotoCarouselState();
}

class _PhotoCarouselState extends State<PhotoCarousel> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          child: PageView.builder(
              itemCount: widget.elements.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentIndex = page;
                });
              },
              itemBuilder: (BuildContext ctx, int index) {
                return Container(
                  child: NetworkImageWithLoader(
                    url: widget.elements[index],
                  ),
                );
              }),
        ),
        _Indicator(
          size: widget.elements.length,
          selected: _currentIndex,
        )
      ],
    );
  }
}

class _Indicator extends StatelessWidget {
  final int size;
  final int selected;
  _Indicator({this.selected, this.size, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      child: Row(
        children: [
          for (int i = 0; i < size; i++)
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: i == selected
                      ? Theme.of(context).primaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(i == size - 1 ? 0 : 15),
                      bottomRight: Radius.circular(i == size - 1 ? 0 : 15),
                      bottomLeft: Radius.circular(i == 0 ? 0 : 15),
                      topLeft: Radius.circular(i == 0 ? 0 : 15)),
                ),
              ),
            )
        ],
      ),
    );
  }
}
