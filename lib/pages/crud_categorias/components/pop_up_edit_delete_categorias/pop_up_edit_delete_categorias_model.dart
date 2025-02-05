import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/global_components/buttons/pop_ups/sucess_pop_up/sucess_pop_up_widget.dart';
import '/global_components/jarbas_confirmation_dialog/jarbas_confirmation_dialog_widget.dart';
import '/pages/crud_categorias/components/widget_crud_edit_and_create_categorias/widget_crud_edit_and_create_categorias_widget.dart';
import 'dart:ui';
import 'pop_up_edit_delete_categorias_widget.dart'
    show PopUpEditDeleteCategoriasWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PopUpEditDeleteCategoriasModel
    extends FlutterFlowModel<PopUpEditDeleteCategoriasWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  CategoriasRecord? categoriaByID;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
