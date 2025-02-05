import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/global_components/buttons/pop_ups/normal_button/normal_button_widget.dart';
import '/global_components/buttons/pop_ups/sucess_pop_up/sucess_pop_up_widget.dart';
import '/global_components/inputs/input_normal/input_normal_widget.dart';
import '/global_components/inputs/input_selection/input_selection_widget.dart';
import 'dart:ui';
import 'widget_crud_edit_and_create_bairros_widget.dart'
    show WidgetCrudEditAndCreateBairrosWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WidgetCrudEditAndCreateBairrosModel
    extends FlutterFlowModel<WidgetCrudEditAndCreateBairrosWidget> {
  ///  Local state fields for this component.

  bool reload = false;

  bool muncipioSelected = false;

  List<String> emptyList = [];
  void addToEmptyList(String item) => emptyList.add(item);
  void removeFromEmptyList(String item) => emptyList.remove(item);
  void removeAtIndexFromEmptyList(int index) => emptyList.removeAt(index);
  void insertAtIndexInEmptyList(int index, String item) =>
      emptyList.insert(index, item);
  void updateEmptyListAtIndex(int index, Function(String) updateFn) =>
      emptyList[index] = updateFn(emptyList[index]);

  MunicipiosRecord? municipioObject;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Read Document] action in widgetCrudEditAndCreateBairros widget.
  BairrosRecord? resultRequestBairroByID;
  // Model for cityName.
  late InputNormalModel cityNameModel;
  // Model for municipioName.
  late InputSelectionModel municipioNameModel;
  // Stores action output result for [Firestore Query - Query a collection] action in municipioName widget.
  MunicipiosRecord? resultDropdwonRequest;
  // Model for stateCode.
  late InputSelectionModel stateCodeModel;
  // Model for normalButton component.
  late NormalButtonModel normalButtonModel1;
  // Stores action output result for [Validate Form] action in normalButton widget.
  bool? reslutValidate;
  // Model for normalButton component.
  late NormalButtonModel normalButtonModel2;

  @override
  void initState(BuildContext context) {
    cityNameModel = createModel(context, () => InputNormalModel());
    municipioNameModel = createModel(context, () => InputSelectionModel());
    stateCodeModel = createModel(context, () => InputSelectionModel());
    normalButtonModel1 = createModel(context, () => NormalButtonModel());
    normalButtonModel2 = createModel(context, () => NormalButtonModel());
    cityNameModel.textControllerValidator = _formTextFieldValidator;
  }

  @override
  void dispose() {
    cityNameModel.dispose();
    municipioNameModel.dispose();
    stateCodeModel.dispose();
    normalButtonModel1.dispose();
    normalButtonModel2.dispose();
  }

  /// Additional helper methods.

  String? _formTextFieldValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '5g0oohev' /* Digite o nome do municipio par... */,
      );
    }

    return null;
  }
}
