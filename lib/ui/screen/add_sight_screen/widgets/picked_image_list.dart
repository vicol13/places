import 'dart:math';
import 'package:flutter/material.dart';
import 'package:places/ui/screen/add_sight_screen/widgets/picked_image_card.dart';
import 'add_photo_button.dart';

///
/// list view of photos when adding a sight
///
class PhotoListView extends StatefulWidget {
  PhotoListView({
    Key key,
    @required this.images,
  }) : super(key: key);

  List<String> images;

  @override
  _PhotoListViewState createState() => _PhotoListViewState();
}

class _PhotoListViewState extends State<PhotoListView> {
  @override
  Widget build(BuildContext context) {
    // костыли  ! todo refactor
    // each operation done by index on original collection
    // should be decresed by one
    //
    // ! run type copy is for display not for CRUD operations
    var runTypeCopy = ["button"]..addAll(widget.images);
    return Container(
      height: 60,
      child: ListView.builder(
          itemCount: runTypeCopy.length,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) {
            if (index == 0 && runTypeCopy[index] == "button") {
              return getButton();
            }
            return DraggableDismisibleImage<int>(
              imageUrl: runTypeCopy[index],
              value: index,
              key: ValueKey(index),
              onDismissed: () {
                setState(() {
                  widget.images.removeAt(index - 1);
                });
              },
              onWillAccept: (int position) {
                if (position == index) {
                  return false;
                }
                return true;
              },
              onAccept: (data) {
                setState(() {
                  var tmp = widget.images[index - 1];
                  widget.images[index - 1] = widget.images[data - 1];
                  widget.images[data - 1] = tmp;
                });
              },
            );
          }),
    );
  }

  Widget getButton() {
    return AddPhotoButton(
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
    );
  }
}

class DraggableDismisibleImage<T> extends StatelessWidget {
  T value;
  String imageUrl;
  Function(T) onWillAccept;
  Function(T) onAccept;
  VoidCallback onDismissed;
  Key key;

  DraggableDismisibleImage(
      {@required this.imageUrl,
      @required this.onDismissed,
      @required this.onAccept,
      @required this.value,
      @required this.onWillAccept,
      @required this.key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DragTarget<T>(
        builder: (_1, _2, _3) {
          return Draggable<T>(
            data: value,
            childWhenDragging: Container(
              height: 60,
              width: 70,
              color: Colors.transparent,
            ),
            child: PickedImageCard(
                imageurl: imageUrl, key: key, onDismissed: onDismissed),
            feedback: PickedImageCard(
                imageurl: imageUrl, key: key, onDismissed: onDismissed),
          );
        },
        onWillAccept: onWillAccept,
        onAccept: onAccept);
  }
}
