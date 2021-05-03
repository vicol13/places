import 'dart:math';
import 'package:flutter/material.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/picked_image_card.dart';
import 'add_photo_button.dart';

///
/// list view of photos when adding a sight
///
class PhotoListView extends StatefulWidget {
  const PhotoListView({
    Key key,
    @required this.images,
  }) : super(key: key);

  final List<String> images;

  @override
  _PhotoListViewState createState() => _PhotoListViewState();
}

class _PhotoListViewState extends State<PhotoListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AddPhotoButton(
                onTap: () {
                  setState(() {
                    if (Random().nextBool()) {
                      widget.images.add("https://picsum.photos/300/300");
                    } else {
                      widget.images.add("https://source.unsplash.com/random");
                    }
                  });
                  print(widget.images);
                },
              ),
              for (int i = 0; i <= widget.images.length - 1; i++)
                DragTarget<int>(
                  builder: (_1, _2, _3) {
                    return Draggable<int>(
                      data: i,
                      childWhenDragging: Container(
                        height: 60,
                        width: 70,
                        color: Colors.transparent,
                      ),
                      child: PickedImageCard(
                        imageurl: widget.images[i],
                        key: ValueKey(i),
                        onDismissed: () {
                          setState(() {
                            widget.images.removeAt(i);
                          });
                        },
                      ),
                      feedback: PickedImageCard(
                        imageurl: widget.images[i],
                        key: ValueKey(i),
                        onDismissed: () {
                          setState(() {
                            widget.images.removeAt(i);
                          });
                        },
                      ),
                    );
                  },
                  onWillAccept: (int position) {
                    if (position == i) {
                      return false;
                    }
                    return true;
                  },
                  onAccept: (data) {
                    setState(() {
                      var tmp = widget.images[i];
                      widget.images[i] = widget.images[data];
                      widget.images[data] = tmp;
                    });
                  },
                ),
            ]),
      ),
    );
  }
}
