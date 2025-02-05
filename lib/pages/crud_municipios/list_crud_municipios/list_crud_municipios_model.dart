import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/global_components/buttons/back_button/back_button_widget.dart';
import '/global_components/buttons/pop_ups/normal_button/normal_button_widget.dart';
import '/global_components/buttons/pop_ups/title/title_widget.dart';
import '/pages/crud_municipios/components/card_municipio/card_municipio_widget.dart';
import '/pages/crud_municipios/components/widget_crud_edit_and_create_municipios/widget_crud_edit_and_create_municipios_widget.dart';
import 'dart:ui';
import 'list_crud_municipios_widget.dart' show ListCrudMunicipiosWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListCrudMunicipiosModel
    extends FlutterFlowModel<ListCrudMunicipiosWidget> {
  ///  Local state fields for this page.

  bool reload = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in listCrudMunicipios widget.
  List<MunicipiosRecord>? listOfMunicipios;
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
