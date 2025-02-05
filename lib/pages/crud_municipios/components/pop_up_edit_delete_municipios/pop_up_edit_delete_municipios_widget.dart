import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/global_components/buttons/pop_ups/sucess_pop_up/sucess_pop_up_widget.dart';
import '/global_components/jarbas_confirmation_dialog/jarbas_confirmation_dialog_widget.dart';
import '/pages/crud_municipios/components/widget_crud_edit_and_create_municipios/widget_crud_edit_and_create_municipios_widget.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pop_up_edit_delete_municipios_model.dart';
export 'pop_up_edit_delete_municipios_model.dart';

class PopUpEditDeleteMunicipiosWidget extends StatefulWidget {
  const PopUpEditDeleteMunicipiosWidget({
    super.key,
    this.municipioID,
  });

  final DocumentReference? municipioID;

  @override
  State<PopUpEditDeleteMunicipiosWidget> createState() =>
      _PopUpEditDeleteMunicipiosWidgetState();
}

class _PopUpEditDeleteMunicipiosWidgetState
    extends State<PopUpEditDeleteMunicipiosWidget> {
  late PopUpEditDeleteMunicipiosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopUpEditDeleteMunicipiosModel());

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
                        child: WidgetCrudEditAndCreateMunicipiosWidget(
                          muncipioID: widget!.municipioID,
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
                        'byp4602o' /* Editar */,
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
                            title: 'Deletar Municipio!',
                            message:
                                'Tem certeza que deseja deletar esse muncipio?',
                            action: () async {
                              await widget!.municipioID!.delete();
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
                                          'O muncipio foi deletado com sucesso!',
                                      functionPopUp: () async {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  );
                                },
                              );

                              Navigator.pop(context);

                              context.pushNamed('listCrudMunicipios');
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
                          'z9umvuic' /* Deletar */,
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
