import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/global_components/buttons/back_button/back_button_widget.dart';
import '/global_components/buttons/pop_ups/normal_button/normal_button_widget.dart';
import '/global_components/buttons/pop_ups/title/title_widget.dart';
import '/pages/crud_estado/components/card_estado/card_estado_widget.dart';
import '/pages/crud_estado/components/widget_crud_edit_and_create_estado/widget_crud_edit_and_create_estado_widget.dart';
import 'dart:ui';
import 'list_crud_estado_widget.dart' show ListCrudEstadoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListCrudEstadoModel extends FlutterFlowModel<ListCrudEstadoWidget> {
  ///  Local state fields for this page.

  bool reload = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in listCrudEstado widget.
  List<EstadosRecord>? listOfEstados;
  // Model for backButton component.
  late BackButtonModel backButtonModel;
  // Model for Title component.
  late TitleModel titleModel;
  // Model for normalButton component.
  late NormalButtonModel normalButtonModel;

  @override
  void initState(BuildContext context) {
    backButtonModel = createModel(context, () => BackButtonModel());
    titleModel = createModel(context, () => TitleModel());
    normalButtonModel = createModel(context, () => NormalButtonModel());
  }

  @override
  void dispose() {
    backButtonModel.dispose();
    titleModel.dispose();
    normalButtonModel.dispose();
  }
}
