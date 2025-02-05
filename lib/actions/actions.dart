import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';

Future<String> uploadFileToSupabaseBlock(
  BuildContext context, {
  required String? bucketName,
  required String? folderName,
  required FFUploadedFile? uploadFile,
  required bool? hasUpload,
}) async {
  String? urlFile;

  if (hasUpload!) {
    urlFile = await actions.uploadFileToSupabase(
      bucketName!,
      folderName!,
      uploadFile!,
    );
    return urlFile!;
  } else {
    return '';
  }
}
