import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/global_components/buttons/medium_button/medium_button_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sucess_pop_up_model.dart';
export 'sucess_pop_up_model.dart';

class SucessPopUpWidget extends StatefulWidget {
  const SucessPopUpWidget({
    super.key,
    String? message,
    required this.functionPopUp,
  }) : this.message = message ?? 'Suscess';

  final String message;
  final Future Function()? functionPopUp;

  @override
  State<SucessPopUpWidget> createState() => _SucessPopUpWidgetState();
}

class _SucessPopUpWidgetState extends State<SucessPopUpWidget> {
  late SucessPopUpModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SucessPopUpModel());

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
      padding: EdgeInsets.all(20.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_sharp,
                color: Color(0xFF02FF2C),
                size: 150.0,
              ),
              Text(
                widget!.message,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Lexend',
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              wrapWithModel(
                model: _model.mediumButtonModel,
                updateCallback: () => safeSetState(() {}),
                child: MediumButtonWidget(
                  text: 'Continuar',
                  function: () async {
                    await widget.functionPopUp?.call();
                  },
                ),
              ),
            ].divide(SizedBox(height: 20.0)),
          ),
        ),
      ),
    );
  }
}
