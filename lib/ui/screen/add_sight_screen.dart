import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/domain/sight_type.dart';
import 'package:places/ui/screen/sight_categories_screen.dart';
import 'package:places/ui/screen/widgets/text_field_with_clear_btn.dart';
import '../../mocks.dart' as mockdata;

///
/// Screen for adding sight
///
class AddSightScreen extends StatefulWidget {
  @override
  _AddSightScreenState createState() => _AddSightScreenState();
}

class _AddSightScreenState extends State<AddSightScreen> {
  //
  //  !todo ask initialization in initState ?
  //
  TextEditingController _nameController = TextEditingController();
  FocusNode _nameFocusNode = FocusNode();

  TextEditingController _latController = TextEditingController();
  FocusNode _latFocusNode = FocusNode();

  TextEditingController _longController = TextEditingController();
  FocusNode _longFocusNode = FocusNode();

  TextEditingController _descriptionController = TextEditingController();
  FocusNode _descriptionFocus = FocusNode();

  SightType _type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///
      /// AppBar
      ///
      appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Close",
                  style: Theme.of(context).textTheme.subtitle2.copyWith(
                      color: Theme.of(context).textTheme.bodyText2.color),
                ),
              ),
              Text(
                "Add new place",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(
                width: 60,
              )
            ],
          )),

      body: Padding(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                ///
                /// Category pick
                ///
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Category",
                      style: Theme.of(context).textTheme.bodyText2,
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _categoryText(this._type),
                          ///
                          /// navigate btn to pick type screen
                          ///
                          Container(
                              child: TextButton(
                                  onPressed: _awaitCategory,
                                  child: SvgPicture.asset(
                                    "res/assets/view.svg",
                                    color: Theme.of(context).primaryColor,
                                    height: 30,
                                    width: 30,
                                  )))
                        ])),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 0.1, width: double.infinity, color: Colors.grey),
                SizedBox(
                  height: 20,
                ),
                ///
                /// Name input field
                ///
                TextInputWithClearButton(
                  controller: _nameController,
                  focusNode: _nameFocusNode,
                  title: "Name",
                  onSubmit: () {
                    FocusScope.of(context).requestFocus(_latFocusNode);
                  },
                )
              ]),
              SizedBox(height: 30),
              Row(children: [
                ///
                /// lat input field
                ///
                Expanded(
                    child: TextInputWithClearButton(
                  controller: _latController,
                  focusNode: _latFocusNode,
                  title: "Lat",
                  onSubmit: () {
                    FocusScope.of(context).requestFocus(_longFocusNode);
                  },
                )),
                SizedBox(width: 20),
                ///
                /// long input field
                ///
                Expanded(
                    child: TextInputWithClearButton(
                  controller: _longController,
                  focusNode: _longFocusNode,
                  title: "Long",
                  onSubmit: () {
                    FocusScope.of(context).requestFocus(_descriptionFocus);
                  },
                )),
              ]),
              SizedBox(
                height: 10,
              ),
              ///
              /// pick on map button
              ///
              Container(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateColor.resolveWith((states) =>
                        Theme.of(context).buttonColor.withOpacity(0.2)),
                  ),
                  onPressed: () {
                    print("pick on map callback");
                  },
                  child: Text(
                    "Pick on map",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(color: Theme.of(context).buttonColor),
                  ),
                ),
              ),
              SizedBox(height: 30),
              ///
              /// description text input
              ///
              ConstrainedBox(
                constraints: BoxConstraints(minHeight: 150, maxHeight: 200),
                child: TextInputWithClearButton(
                  controller: _descriptionController,
                  focusNode: _descriptionFocus,
                  title: "Description",
                  isMultiLine: true,
                  onSubmit: () {
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
              SizedBox(
                height: 50,
              ),

              ///
              /// Create sight  button
              ///
              Align(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                  onPressed: _addCreatedSight,
                  height: 50,
                  minWidth: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Create",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .copyWith(color: Colors.white, fontSize: 18))
                    ],
                  ),
                  color: Theme.of(context).buttonColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  elevation: 0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ///
  /// display sight type if is not null
  ///
  Widget _categoryText(SightType type) {
    return type == null
        ? Text(
            "Not Selected",
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(color: Theme.of(context).textTheme.bodyText2.color),
          )
        : Text(this._type.toUiString(),
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(color: Theme.of(context).primaryColor));
  }

  ///
  ///  will display screen with categories
  ///  and will wait until user will pick one
  ///
  void _awaitCategory() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SightTypesScreen(
                type: _type,
              )),
    );

    setState(() {
      this._type = result;
    });
  }

  ///
  /// should create a new sight add it list
  /// and navigate to previous page
  ///
  //  todo add input validation
  //
  void _addCreatedSight() {
    print('adding sight');
    Sight sight = Sight(
        type: _type,
        name: _nameController.text,
        lat: double.tryParse(_latController.text),
        lon: double.tryParse(_longController.text),
        details: _descriptionController.text,
        // random photo for now
        url: "https://source.unsplash.com/random");

    mockdata.mocks.add(sight);

    Navigator.of(context).pop();
  }
}

