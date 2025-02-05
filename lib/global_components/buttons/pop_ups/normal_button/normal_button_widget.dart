import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'normal_button_model.dart';
export 'normal_button_model.dart';

class NormalButtonWidget extends StatefulWidget {
  const NormalButtonWidget({
    super.key,
    String? text,
    required this.function,
  }) : this.text = text ?? 'Text';

  final String text;
  final Future Function()? function;

  @override
  State<NormalButtonWidget> createState() => _NormalButtonWidgetState();
}

class _NormalButtonWidgetState extends State<NormalButtonWidget> {
  late NormalButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NormalButtonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () async {
        await widget.function?.call();
      },
      text: widget!.text,
      options: FFButtonOptions(
        width: MediaQuery.sizeOf(context).width * 0.9,
        height: 45.0,
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: Color(0xFF3C00FF),
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Lexend',
              color: Colors.white,
              fontSize: 20.0,
              letterSpacing: 0.0,
            ),
        elevation: 0.0,
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
