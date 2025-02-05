import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/global_components/buttons/pop_ups/sucess_pop_up/sucess_pop_up_widget.dart';
import '/global_components/jarbas_confirmation_dialog/jarbas_confirmation_dialog_widget.dart';
import '/pages/crud_estado/components/widget_crud_edit_and_create_estado/widget_crud_edit_and_create_estado_widget.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pop_up_edit_delete_estados_model.dart';
export 'pop_up_edit_delete_estados_model.dart';

class PopUpEditDeleteEstadosWidget extends StatefulWidget {
  const PopUpEditDeleteEstadosWidget({
    super.key,
    this.estadoID,
  });

  final DocumentReference? estadoID;

  @override
  State<PopUpEditDeleteEstadosWidget> createState() =>
      _PopUpEditDeleteEstadosWidgetState();
}

class _PopUpEditDeleteEstadosWidgetState
    extends State<PopUpEditDeleteEstadosWidget> {
  late PopUpEditDeleteEstadosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopUpEditDeleteEstadosModel());

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
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: WidgetCrudEditAndCreateEstadoWidget(
                          estadoID: widget!.estadoID,
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
                        '7xxzowlt' /* Editar */,
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
                            title: 'Deletar Estado!',
                            message:
                                'Tem certeza que deseja deletar esse estado?',
                            action: () async {
                              await widget!.estadoID!.delete();
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
                                          'O estado foi deletado com sucesso!',
                                      functionPopUp: () async {
                                        context.pushNamed('listCrudEstado');

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

                    Navigator.pop(context);
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
                          'sa16jhh6' /* Deletar */,
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
