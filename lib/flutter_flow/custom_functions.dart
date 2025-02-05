import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/supabase/supabase.dart';
import '/auth/firebase_auth/auth_util.dart';

String formatToBRLCurrency(String imput) {
  String cleanedInput = imput.replaceAll(RegExp(r'[^0-9]'), '');
  if (cleanedInput.isEmpty) {
    return 'R\$ 0,00';
  }

  double value = double.parse(cleanedInput) / 100;
  final NumberFormat currencyFormatter =
      NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  return currencyFormatter.format(value);
}

double currencyToDouble(String imput) {
  String cleanedInput =
      imput.replaceAll(RegExp(r'[^0-9,]'), '').replaceAll(',', '.');
  double value = double.tryParse(cleanedInput) ?? 0.0;
  return value;
}

String formatToPhoneNumber(String input) {
// Remove tudo que não for número
  String cleanedInput = input.replaceAll(RegExp(r'[^0-9]'), '');

  // Garante que não estamos tentando formatar um número vazio
  if (cleanedInput.isEmpty) {
    return "";
  }

  // Limita o número de dígitos a 13 (exemplo: +55 (11) 9 1234-5678)
  cleanedInput =
      cleanedInput.length > 13 ? cleanedInput.substring(0, 13) : cleanedInput;

  // Aplica a máscara
  String formatted = "+";
  if (cleanedInput.length > 0)
    formatted += cleanedInput.substring(0, 2); // Código do país
  if (cleanedInput.length > 2)
    formatted += " (" + cleanedInput.substring(2, 4) + ")"; // DDD
  if (cleanedInput.length > 4)
    formatted +=
        " " + cleanedInput.substring(4, 5); // Primeiro dígito do número
  if (cleanedInput.length > 5)
    formatted += " " + cleanedInput.substring(5, 9); // Meio do número
  if (cleanedInput.length > 9)
    formatted += "-" + cleanedInput.substring(9); // Final do número

  return formatted;
}

double getRendaTotal(List<EmpresasRecord> empresasCount) {
  double total = 0.0;

  for (EmpresasRecord empresa in empresasCount) {
    double result = 0.0;

    if (empresa.inDestaque) {
      result = currencyToDouble(empresa.taxaExistencia) +
          currencyToDouble(empresa.taxaDestaque);
      total += result;
    } else {
      result = currencyToDouble(empresa.taxaExistencia);
      total += result;
    }
  }

  return total;
}
