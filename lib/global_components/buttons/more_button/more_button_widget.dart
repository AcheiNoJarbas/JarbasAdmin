import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'more_button_model.dart';
export 'more_button_model.dart';

class MoreButtonWidget extends StatefulWidget {
  const MoreButtonWidget({
    super.key,
    required this.backFunction,
  });

  final Future Function()? backFunction;

  @override
  State<MoreButtonWidget> createState() => _MoreButtonWidgetState();
}

class _MoreButtonWidgetState extends State<MoreButtonWidget> {
  late MoreButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoreButtonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowIconButton(
      borderRadius: 100.0,
      buttonSize: 50.0,
      fillColor: Color(0xFF3C00FF),
      icon: Icon(
        Icons.more_vert,
        color: Colors.white,
        size: 35.0,
      ),
      onPressed: () async {
        await widget.backFunction?.call();
      },
    );
  }
}
