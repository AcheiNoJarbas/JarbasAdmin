// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:supabase_flutter/supabase_flutter.dart';

Future<String> uploadFileToSupabase(
  String bucketName,
  String folderName,
  FFUploadedFile file,
) async {
  // Add your function code here!
  final supabase = Supabase.instance.client;

  try {
    // Verifica se o arquivo é válido
    if (file.bytes == null || file.name == null) {
      throw Exception(
          "Arquivo inválido. Certifique-se de que o arquivo está selecionado corretamente.");
    }

    // Define o caminho completo do arquivo no bucket
    final filePath = '$folderName/${file.name}';

    // Faz o upload do arquivo para o Supabase Storage
    final response = await supabase.storage.from(bucketName).uploadBinary(
        filePath, file.bytes!,
        fileOptions: const FileOptions(upsert: true));

    // Verifica se o upload foi bem-sucedido
    if (response.isEmpty) {
      throw Exception("Erro ao fazer upload: ${response}");
    }

    // Gera a URL pública do arquivo
    final publicUrl = supabase.storage.from(bucketName).getPublicUrl(filePath);

    return publicUrl;
  } catch (e) {
    // Retorna nulo em caso de erro e imprime no console
    print("Erro ao enviar arquivo para o Supabase: $e");
    return "erro$e";
  }
}
