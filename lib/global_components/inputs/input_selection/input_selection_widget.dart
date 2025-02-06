import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'input_selection_model.dart';
export 'input_selection_model.dart';

class InputSelectionWidget extends StatefulWidget {
  const InputSelectionWidget({
    super.key,
    required this.label,
    required this.labelsList,
    required this.valueList,
    required this.itemSelected,
    this.hintText,
    this.functionOnselected,
  });

  final String? label;
  final List<String>? labelsList;
  final List<String>? valueList;
  final String? itemSelected;
  final String? hintText;
  final Future Function()? functionOnselected;

  @override
  State<InputSelectionWidget> createState() => _InputSelectionWidgetState();
}

class _InputSelectionWidgetState extends State<InputSelectionWidget> {
  late InputSelectionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InputSelectionModel());

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
      decoration: BoxDecoration(
        color: Color(0x00FFFFFF),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            valueOrDefault<String>(
              widget!.label,
              'Label',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Lexend',
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
          Builder(
            builder: (context) {
              if ((widget!.labelsList != null &&
                      (widget!.labelsList)!.isNotEmpty) ||
                  (widget!.itemSelected != null &&
                      widget!.itemSelected != '') ||
                  (widget!.hintText != null && widget!.hintText != '')) {
                return FlutterFlowDropDown<String>(
                  controller: _model.listIsEmptyTrueValueController ??=
                      FormFieldController<String>(
                    _model.listIsEmptyTrueValue ??= widget!.itemSelected,
                  ),
                  options: List<String>.from(widget!.valueList!),
                  optionLabels: widget!.labelsList!,
                  onChanged: (val) async {
                    safeSetState(() => _model.listIsEmptyTrueValue = val);
                    await widget.functionOnselected?.call();
                  },
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 50.0,
                  searchHintTextStyle:
                      FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Poppins',
                            letterSpacing: 0.0,
                          ),
                  searchTextStyle:
                      FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Lexend',
                            letterSpacing: 0.0,
                          ),
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lexend',
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                      ),
                  hintText: widget!.hintText,
                  searchHintText: FFLocalizations.of(context).getText(
                    '7r4if1qu' /* Busque */,
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Color(0xFF3C00FF),
                    size: 30.0,
                  ),
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  elevation: 2.0,
                  borderColor: Color(0xFF3C00FF),
                  borderWidth: 1.0,
                  borderRadius: 10.0,
                  margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  hidesUnderline: true,
                  isOverButton: false,
                  isSearchable: true,
                  isMultiSelect: false,
                );
              } else {
                return Text(
                  FFLocalizations.of(context).getText(
                    'eisl7npg' /* Sem dados no momento, adicione... */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lexend',
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                      ),
                );
              }
            },
          ),
        ].divide(SizedBox(height: 15.0)),
      ),
    );
  }
}
