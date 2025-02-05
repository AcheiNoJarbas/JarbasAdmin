import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/global_components/buttons/pop_ups/sucess_pop_up/sucess_pop_up_widget.dart';
import '/global_components/jarbas_confirmation_dialog/jarbas_confirmation_dialog_widget.dart';
import '/pages/crud_categorias/components/widget_crud_edit_and_create_categorias/widget_crud_edit_and_create_categorias_widget.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pop_up_edit_delete_categorias_model.dart';
export 'pop_up_edit_delete_categorias_model.dart';

class PopUpEditDeleteCategoriasWidget extends StatefulWidget {
  const PopUpEditDeleteCategoriasWidget({
    super.key,
    this.categoriaID,
  });

  final DocumentReference? categoriaID;

  @override
  State<PopUpEditDeleteCategoriasWidget> createState() =>
      _PopUpEditDeleteCategoriasWidgetState();
}

class _PopUpEditDeleteCategoriasWidgetState
    extends State<PopUpEditDeleteCategoriasWidget> {
  late PopUpEditDeleteCategoriasModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopUpEditDeleteCategoriasModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 25.0, 0.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.4,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
            width: 1.0,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(5.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  Navigator.pop(context);
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: WidgetCrudEditAndCreateCategoriasWidget(
                          categoryID: widget!.categoriaID,
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/editar.png',
                        width: MediaQuery.sizeOf(context).width * 0.09,
                        height: MediaQuery.sizeOf(context).height * 0.04,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'yswyddnb' /* Editar */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Lexend',
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ].divide(SizedBox(width: 15.0)),
                ),
              ),
            ),
            Divider(
              height: 3.0,
              thickness: 1.0,
              color: FlutterFlowTheme.of(context).alternate,
            ),
            Builder(
              builder: (context) => Padding(
                padding: EdgeInsets.all(5.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await showDialog(
                      context: context,
                      builder: (dialogContext) {
                        return Dialog(
                          elevation: 0,
                          insetPadding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          alignment: AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          child: JarbasConfirmationDialogWidget(
                            title: 'Deletar Categoria!',
                            message:
                                'Tem certeza que deseja deletar essa categoria?',
                            action: () async {
                              _model.categoriaByID =
                                  await queryCategoriasRecordOnce(
                                queryBuilder: (categoriasRecord) =>
                                    categoriasRecord.where(
                                  'categoriaID',
                                  isEqualTo: widget!.categoriaID?.id,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              await widget!.categoriaID!.delete();
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: SucessPopUpWidget(
                                      message:
                                          'A categoria foi deletada com sucesso!',
                                      functionPopUp: () async {
                                        context.goNamed('listCrudCategorias');

                                        Navigator.pop(context);
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        );
                      },
                    );

                    safeSetState(() {});
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.delete_outline,
                        color: FlutterFlowTheme.of(context).secondary,
                        size: 30.0,
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'ns08dg9a' /* Deletar */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Lexend',
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ].divide(SizedBox(width: 15.0)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
