import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/global_components/buttons/back_button/back_button_widget.dart';
import '/global_components/buttons/pop_ups/normal_button/normal_button_widget.dart';
import '/global_components/buttons/pop_ups/title/title_widget.dart';
import '/global_components/inputs/input_multiline/input_multiline_widget.dart';
import '/global_components/inputs/input_selection/input_selection_widget.dart';
import '/pages/crud_storys/components/add_story_item/add_story_item_widget.dart';
import 'dart:ui';
import 'criar_storys_widget.dart' show CriarStorysWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CriarStorysModel extends FlutterFlowModel<CriarStorysWidget> {
  ///  Local state fields for this page.

  FFUploadedFile? uploadFile;

  List<String> labelList = ['Foto', 'Video'];
  void addToLabelList(String item) => labelList.add(item);
  void removeFromLabelList(String item) => labelList.remove(item);
  void removeAtIndexFromLabelList(int index) => labelList.removeAt(index);
  void insertAtIndexInLabelList(int index, String item) =>
      labelList.insert(index, item);
  void updateLabelListAtIndex(int index, Function(String) updateFn) =>
      labelList[index] = updateFn(labelList[index]);

  List<String> valueList = ['IMAGE', 'VIDEO'];
  void addToValueList(String item) => valueList.add(item);
  void removeFromValueList(String item) => valueList.remove(item);
  void removeAtIndexFromValueList(int index) => valueList.removeAt(index);
  void insertAtIndexInValueList(int index, String item) =>
      valueList.insert(index, item);
  void updateValueListAtIndex(int index, Function(String) updateFn) =>
      valueList[index] = updateFn(valueList[index]);

  bool reload = false;

  String? emptyList;

  ///  State fields for stateful widgets in this page.

  // Model for backButton component.
  late BackButtonModel backButtonModel;
  // Model for Title component.
  late TitleModel titleModel;
  // Model for inputSelection component.
  late InputSelectionModel inputSelectionModel;
  // Model for addStoryItem component.
  late AddStoryItemModel addStoryItemModel;
  // Model for inputMultiline component.
  late InputMultilineModel inputMultilineModel;
  // Model for normalButton component.
  late NormalButtonModel normalButtonModel;
  // Stores action output result for [Backend Call - Create Document] action in normalButton widget.
  StorysRecord? storyCreate;

  @override
  void initState(BuildContext context) {
    backButtonModel = createModel(context, () => BackButtonModel());
    titleModel = createModel(context, () => TitleModel());
    inputSelectionModel = createModel(context, () => InputSelectionModel());
    addStoryItemModel = createModel(context, () => AddStoryItemModel());
    inputMultilineModel = createModel(context, () => InputMultilineModel());
    normalButtonModel = createModel(context, () => NormalButtonModel());
  }

  @override
  void dispose() {
    backButtonModel.dispose();
    titleModel.dispose();
    inputSelectionModel.dispose();
    addStoryItemModel.dispose();
    inputMultilineModel.dispose();
    normalButtonModel.dispose();
  }
}
