import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContratacoesRecord extends FirestoreRecord {
  ContratacoesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nomeDaVaga" field.
  String? _nomeDaVaga;
  String get nomeDaVaga => _nomeDaVaga ?? '';
  bool hasNomeDaVaga() => _nomeDaVaga != null;

  // "empresaID" field.
  String? _empresaID;
  String get empresaID => _empresaID ?? '';
  bool hasEmpresaID() => _empresaID != null;

  // "descricaoDaVaga" field.
  String? _descricaoDaVaga;
  String get descricaoDaVaga => _descricaoDaVaga ?? '';
  bool hasDescricaoDaVaga() => _descricaoDaVaga != null;

  // "cidadeDaVaga" field.
  String? _cidadeDaVaga;
  String get cidadeDaVaga => _cidadeDaVaga ?? '';
  bool hasCidadeDaVaga() => _cidadeDaVaga != null;

  // "contratacaoID" field.
  String? _contratacaoID;
  String get contratacaoID => _contratacaoID ?? '';
  bool hasContratacaoID() => _contratacaoID != null;

  // "tipoDaVaga" field.
  String? _tipoDaVaga;
  String get tipoDaVaga => _tipoDaVaga ?? '';
  bool hasTipoDaVaga() => _tipoDaVaga != null;

  // "fotoUrl" field.
  String? _fotoUrl;
  String get fotoUrl => _fotoUrl ?? '';
  bool hasFotoUrl() => _fotoUrl != null;

  // "bannerUrl" field.
  String? _bannerUrl;
  String get bannerUrl => _bannerUrl ?? '';
  bool hasBannerUrl() => _bannerUrl != null;

  void _initializeFields() {
    _nomeDaVaga = snapshotData['nomeDaVaga'] as String?;
    _empresaID = snapshotData['empresaID'] as String?;
    _descricaoDaVaga = snapshotData['descricaoDaVaga'] as String?;
    _cidadeDaVaga = snapshotData['cidadeDaVaga'] as String?;
    _contratacaoID = snapshotData['contratacaoID'] as String?;
    _tipoDaVaga = snapshotData['tipoDaVaga'] as String?;
    _fotoUrl = snapshotData['fotoUrl'] as String?;
    _bannerUrl = snapshotData['bannerUrl'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('contratacoes');

  static Stream<ContratacoesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ContratacoesRecord.fromSnapshot(s));

  static Future<ContratacoesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ContratacoesRecord.fromSnapshot(s));

  static ContratacoesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ContratacoesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ContratacoesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ContratacoesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ContratacoesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ContratacoesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createContratacoesRecordData({
  String? nomeDaVaga,
  String? empresaID,
  String? descricaoDaVaga,
  String? cidadeDaVaga,
  String? contratacaoID,
  String? tipoDaVaga,
  String? fotoUrl,
  String? bannerUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nomeDaVaga': nomeDaVaga,
      'empresaID': empresaID,
      'descricaoDaVaga': descricaoDaVaga,
      'cidadeDaVaga': cidadeDaVaga,
      'contratacaoID': contratacaoID,
      'tipoDaVaga': tipoDaVaga,
      'fotoUrl': fotoUrl,
      'bannerUrl': bannerUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class ContratacoesRecordDocumentEquality
    implements Equality<ContratacoesRecord> {
  const ContratacoesRecordDocumentEquality();

  @override
  bool equals(ContratacoesRecord? e1, ContratacoesRecord? e2) {
    return e1?.nomeDaVaga == e2?.nomeDaVaga &&
        e1?.empresaID == e2?.empresaID &&
        e1?.descricaoDaVaga == e2?.descricaoDaVaga &&
        e1?.cidadeDaVaga == e2?.cidadeDaVaga &&
        e1?.contratacaoID == e2?.contratacaoID &&
        e1?.tipoDaVaga == e2?.tipoDaVaga &&
        e1?.fotoUrl == e2?.fotoUrl &&
        e1?.bannerUrl == e2?.bannerUrl;
  }

  @override
  int hash(ContratacoesRecord? e) => const ListEquality().hash([
        e?.nomeDaVaga,
        e?.empresaID,
        e?.descricaoDaVaga,
        e?.cidadeDaVaga,
        e?.contratacaoID,
        e?.tipoDaVaga,
        e?.fotoUrl,
        e?.bannerUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is ContratacoesRecord;
}
