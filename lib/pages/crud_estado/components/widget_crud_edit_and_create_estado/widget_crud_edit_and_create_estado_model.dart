import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/global_components/buttons/pop_ups/normal_button/normal_button_widget.dart';
import '/global_components/buttons/pop_ups/sucess_pop_up/sucess_pop_up_widget.dart';
import '/global_components/inputs/input_normal/input_normal_widget.dart';
import 'dart:ui';
import 'widget_crud_edit_and_create_estado_widget.dart'
    show WidgetCrudEditAndCreateEstadoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WidgetCrudEditAndCreateEstadoModel
    extends FlutterFlowModel<WidgetCrudEditAndCreateEstadoWidget> {
  ///  Local state fields for this component.

  bool reload = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Read Document] action in widgetCrudEditAndCreateEstado widget.
  EstadosRecord? resutlRequestEstadoById;
  // Model for stateName.
  late InputNormalModel stateNameModel;
  // Model for stateCode.
  late InputNormalModel stateCodeModel;
  // Model for normalButton component.
  late NormalButtonModel normalButtonModel1;
  // Stores action output result for [Validate Form] action in normalButton widget.
  bool? reslutValidate;
  // Model for normalButton component.
  late NormalButtonModel normalButtonModel2;
  // Stores action output result for [Backend Call - Create Document] action in normalButton widget.
  EstadosRecord? createEstado;

  @override
  void initState(BuildContext context) {
    stateNameModel = createModel(context, () => InputNormalModel());
    stateCodeModel = createModel(context, () => InputNormalModel());
    normalButtonModel1 = createModel(context, () => NormalButtonModel());
    normalButtonModel2 = createModel(context, () => NormalButtonModel());
    stateNameModel.textControllerValidator = _formTextFieldValidator1;
    stateCodeModel.textControllerValidator = _formTextFieldValidator2;
  }

  @override
  void dispose() {
    stateNameModel.dispose();
    stateCodeModel.dispose();
    normalButtonModel1.dispose();
    normalButtonModel2.dispose();
  }

  /// Additional helper methods.

  String? _formTextFieldValidator1(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'j9dg3xkt' /* Digite o nome do estado para e... */,
      );
    }

    return null;
  }

  String? _formTextFieldValidator2(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'nzhd0ee5' /* Digite o codigo do estado para... */,
      );
    }

    return null;
  }
}
