import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/global_components/buttons/more_button/more_button_widget.dart';
import '/pages/crud_bairros/components/pop_up_edit_delete_bairros/pop_up_edit_delete_bairros_widget.dart';
import 'dart:ui';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'card_bairro_model.dart';
export 'card_bairro_model.dart';

class CardBairroWidget extends StatefulWidget {
  const CardBairroWidget({
    super.key,
    required this.bairroDocument,
  });

  final BairrosRecord? bairroDocument;

  @override
  State<CardBairroWidget> createState() => _CardBairroWidgetState();
}

class _CardBairroWidgetState extends State<CardBairroWidget> {
  late CardBairroModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardBairroModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 0.13,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x333C6DF2),
            offset: Offset(
              3.0,
              5.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: Color(0x333C6DF2),
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.2,
                              height: MediaQuery.sizeOf(context).height * 0.1,
                              decoration: BoxDecoration(
                                color: Color(0x00DBE2E7),
                                shape: BoxShape.rectangle,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/rua-do-bairro.png',
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                widget!.bairroDocument?.nome,
                                'Nome do bairro',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lexend',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Expanded(
                              child: Text(
                                valueOrDefault<String>(
                                  '${widget!.bairroDocument?.municipio}-${widget!.bairroDocument?.stateCode}',
                                  'city-state',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lexend',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ].divide(SizedBox(height: 10.0)),
                        ),
                      ].divide(SizedBox(width: 10.0)),
                    ),
                  ),
                  Builder(
                    builder: (context) => wrapWithModel(
                      model: _model.moreButtonModel,
                      updateCallback: () => safeSetState(() {}),
                      child: MoreButtonWidget(
                        backFunction: () async {
                          await showAlignedDialog(
                            context: context,
                            isGlobal: false,
                            avoidOverflow: false,
                            targetAnchor: AlignmentDirectional(-1.0, 0.0)
                                .resolve(Directionality.of(context)),
                            followerAnchor: AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            builder: (dialogContext) {
                              return Material(
                                color: Colors.transparent,
                                child: PopUpEditDeleteBairrosWidget(
                                  bairroID: widget!.bairroDocument?.reference,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ].divide(SizedBox(width: 10.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
