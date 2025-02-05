import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'de', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
    String? deText = '',
    String? arText = '',
  }) =>
      [enText, esText, deText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Home-Admin
  {
    'xn2so8km': {
      'en': 'Admin',
      'ar': 'بطاقتي',
      'de': 'Meine Karte',
      'es': 'Mi tarjeta',
    },
    '6t7n9ugd': {
      'en': 'Renda',
      'ar': 'الرصيد',
      'de': 'Gleichgewicht',
      'es': 'Equilibrio',
    },
    '9b0j67se': {
      'en': 'Bairros ',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'mggh8wu7': {
      'en': 'Municipios',
      'ar': 'الإنفاق',
      'de': 'Ausgaben',
      'es': 'Gasto',
    },
    'ttwysayo': {
      'en': 'Empresas',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'vkg9k868': {
      'en': 'Contratações',
      'ar': 'الإنفاق',
      'de': 'Ausgaben',
      'es': 'Gasto',
    },
    'sup1j0ay': {
      'en': 'Empresas em destaque',
      'ar': 'الإنفاق',
      'de': 'Ausgaben',
      'es': 'Gasto',
    },
    'yet7zk5d': {
      'en': 'Acesso rapido',
      'ar': 'خدمة سريعة',
      'de': 'Schneller Service',
      'es': 'Servicio rapido',
    },
    '8bnd6lco': {
      'en': 'Storys',
      'ar': 'تحويل',
      'de': 'Transfer',
      'es': 'Transferir',
    },
    '1xb1xkj2': {
      'en': 'Muncipios',
      'ar': 'تحويل',
      'de': 'Transfer',
      'es': 'Transferir',
    },
    '34ozern4': {
      'en': 'Estados',
      'ar': 'تحويل',
      'de': 'Transfer',
      'es': 'Transferir',
    },
    'c73joyp1': {
      'en': 'Bairros',
      'ar': 'تحويل',
      'de': 'Transfer',
      'es': 'Transferir',
    },
    'bgo4epo2': {
      'en': 'Categorias',
      'ar': 'تحويل',
      'de': 'Transfer',
      'es': 'Transferir',
    },
    'aji8hc7x': {
      'en': 'Contratações',
      'ar': 'تحويل',
      'de': 'Transfer',
      'es': 'Transferir',
    },
    'roobc02h': {
      'en': 'Empresas ',
      'ar': 'بطاقة وقفة',
      'de': 'Pausenkarte',
      'es': 'Tarjeta de pausa',
    },
    'm8rhanhc': {
      'en': 'Home',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // transferComplete
  {
    'xf8d4sm8': {
      'en': 'Transfer Complete',
      'ar': 'نقل كامل',
      'de': 'Übertragung vollständig',
      'es': 'transferencia completa',
    },
    'iq9jjji8': {
      'en':
          'Great work, you successfully transferred funds. It may take a few days for the funds to leave your account.',
      'ar':
          'عمل رائع ، لقد قمت بتحويل الأموال بنجاح. قد يستغرق خروج الأموال من حسابك بضعة أيام.',
      'de':
          'Großartige Arbeit, Sie haben erfolgreich Geld überwiesen. Es kann einige Tage dauern, bis das Geld von Ihrem Konto abgebucht wird.',
      'es':
          'Buen trabajo, transfirió fondos con éxito. Los fondos pueden tardar unos días en salir de su cuenta.',
    },
    'wrbg19ed': {
      'en': 'Okay',
      'ar': 'تمام',
      'de': 'Okay',
      'es': 'Okey',
    },
    'ndkybnrt': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // DetalhesDaEmpresa
  {
    'izgc0c6r': {
      'en': 'Empresa nome',
      'ar': 'أندرو',
      'de': 'Andreas',
      'es': 'Andrés',
    },
    '30kx6e5v': {
      'en': 'Email',
      'ar': 'آخر التحديثات الخاصة بك أدناه.',
      'de': 'Ihre neuesten Updates sind unten.',
      'es': 'Sus últimas actualizaciones se encuentran a continuación.',
    },
    'wknu2tm4': {
      'en': 'Balance',
      'ar': 'الرصيد',
      'de': 'Gleichgewicht',
      'es': 'Equilibrio',
    },
    'syy689nt': {
      'en': '\$7,630',
      'ar': '7630 دولارًا',
      'de': '\$7.630',
      'es': '\$7,630',
    },
    'hhyb9x4x': {
      'en': '**** 0149',
      'ar': '**** 0149',
      'de': '**** 0149',
      'es': '**** 0149',
    },
    'kg2tmby7': {
      'en': '05/25',
      'ar': '05/25',
      'de': '25.05',
      'es': '25/05',
    },
    'y7zomzzp': {
      'en': 'Opções rapidas',
      'ar': 'خدمة سريعة',
      'de': 'Schneller Service',
      'es': 'Servicio rapido',
    },
    'rfozud9v': {
      'en': 'Criar story',
      'ar': 'تحويل',
      'de': 'Transfer',
      'es': 'Transferir',
    },
    'pcrarg0a': {
      'en': 'Add public',
      'ar': 'نشاط',
      'de': 'Aktivität',
      'es': 'Actividad',
    },
    'zmjsfzgg': {
      'en': 'Anunciar vaga',
      'ar': 'بنكي',
      'de': 'Meine Bank',
      'es': 'Mi banco',
    },
    'dfjtbkbo': {
      'en': 'Histórico',
      'ar': 'عملية',
      'de': 'Transaktion',
      'es': 'Transacción',
    },
    'g7t9krj7': {
      'en': 'Publicou um story',
      'ar': 'احصل على مكافآت بعيدة',
      'de': 'Go-Far-Prämien',
      'es': 'Recompensas Ve Lejos',
    },
    'vupu5y5p': {
      'en': 'titulo',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'bj5qnrj5': {
      'en': 'data',
      'ar': '50.00 دولارًا أمريكيًا',
      'de': '\$50,00',
      'es': '\$50.00',
    },
    '2thn73jc': {
      'en': 'Fez uma publicação',
      'ar': 'احصل على مكافآت بعيدة',
      'de': 'Go-Far-Prämien',
      'es': 'Recompensas Ve Lejos',
    },
    '1fjdiibo': {
      'en': 'titulo',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'ld7s2fpn': {
      'en': 'data',
      'ar': '50.00 دولارًا أمريكيًا',
      'de': '\$50,00',
      'es': '\$50.00',
    },
    '8t6ddwco': {
      'en': 'Anunciou uma vaga',
      'ar': 'احصل على مكافآت بعيدة',
      'de': 'Go-Far-Prämien',
      'es': 'Recompensas Ve Lejos',
    },
    'td15kjsa': {
      'en': 'titulo',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'qmjqp9a6': {
      'en': 'data',
      'ar': '50.00 دولارًا أمريكيًا',
      'de': '\$50,00',
      'es': '\$50.00',
    },
    'f3hxl69y': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // EditAndCreateCrudEmpresas
  {
    'faskzbu2': {
      'en': 'Campo obrigatório!',
      'ar': '',
      'de': '',
      'es': '',
    },
    'z7148g2h': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    'npomzf4y': {
      'en': 'Campo obrigatório!',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4ui4damj': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2cyphxyd': {
      'en': 'Campo obrigatório!',
      'ar': '',
      'de': '',
      'es': '',
    },
    'g6zu8yk2': {
      'en': 'Formato do numero inválido!',
      'ar': '',
      'de': '',
      'es': '',
    },
    'bkzqx90v': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qutznszf': {
      'en': 'Campo obrigatório!',
      'ar': '',
      'de': '',
      'es': '',
    },
    'c4be26oj': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    'p8g3fz6v': {
      'en': 'Campo é obrigatório!',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kbi6f9d4': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    'gfi8kjj7': {
      'en': 'Indentidade visual',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mrlj0co7': {
      'en': 'Click aqui para adicionar/alterar o banner e foto da empresa',
      'ar': '',
      'de': '',
      'es': '',
    },
    'cdklucw7': {
      'en': 'Foto de perfil da empresa',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vj2r2bjd': {
      'en': 'Banner da empresa',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8dcc38hp': {
      'en': 'Taxas de usabilidade',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7bzxv34p': {
      'en':
          'Click para adicionar /alterar as taxas de usabilidade e adicionar ou remover a empresa dos destaques.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'buk707m2': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // listCrudCategorias
  {
    'hi0p3isb': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // ListCrudBairros
  {
    '813esgbp': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // listCrudContratos
  {
    '2gvvs3jh': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // listCrudMunicipios
  {
    'ub8kz0mt': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // listCrudEstado
  {
    'v9ib628m': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // CrudEditAndCreateContrato
  {
    'cy5iq189': {
      'en': 'O nome da vaga é obrigatorio!',
      'ar': '',
      'de': '',
      'es': '',
    },
    'uns0wjmh': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    '27najjpm': {
      'en': 'A descrição da vaga é obrigatória!',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zaodtgb9': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vzrlzgad': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // empresasLisCrud
  {
    'h0fcf3qf': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // criarStorys
  {
    'rb87ayea': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // listEmpresasWithStorys
  {
    'xpqyyes3': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // viewStory
  {
    'f02wwjlt': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // storysByEmpresa
  {
    'knwgxcsv': {
      'en': 'Todos',
      'ar': '',
      'de': '',
      'es': '',
    },
    'al7695w6': {
      'en': 'Recentes',
      'ar': '',
      'de': '',
      'es': '',
    },
    'gzt6aph7': {
      'en': 'Antigos',
      'ar': '',
      'de': '',
      'es': '',
    },
    'g013z65g': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // empresasListDestaque
  {
    'kfxhn37y': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // inputNormal
  {
    'o8tialao': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // inputCelular
  {
    'fefojxdu': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // popUpEditDeleteEmpresa
  {
    'b44u3udc': {
      'en': 'Editar',
      'ar': '',
      'de': '',
      'es': '',
    },
    'lczjmr24': {
      'en': 'Deletar',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // inputMultiline
  {
    'biv7gjtm': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // inputMultiSelection
  {
    '84metwy8': {
      'en': 'Busque',
      'ar': '',
      'de': '',
      'es': '',
    },
    'merrtstt': {
      'en': 'Option 1',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2jbzrr6o': {
      'en': 'Option 2',
      'ar': '',
      'de': '',
      'es': '',
    },
    'bdgx1co5': {
      'en': 'Option 3',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // popUpEditDeleteBairros
  {
    'pmqg1zeq': {
      'en': 'Editar',
      'ar': '',
      'de': '',
      'es': '',
    },
    'bufgnqhr': {
      'en': 'Deletar',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // popUpEditDeleteCategorias
  {
    'yswyddnb': {
      'en': 'Editar',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ns08dg9a': {
      'en': 'Deletar',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // popUpEditDeleteMunicipios
  {
    'byp4602o': {
      'en': 'Editar',
      'ar': '',
      'de': '',
      'es': '',
    },
    'z9umvuic': {
      'en': 'Deletar',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // popUpEditDeleteEstados
  {
    '7xxzowlt': {
      'en': 'Editar',
      'ar': '',
      'de': '',
      'es': '',
    },
    'sa16jhh6': {
      'en': 'Deletar',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // popUpEditDeleteContratacoes
  {
    'na4lwatr': {
      'en': 'Editar',
      'ar': '',
      'de': '',
      'es': '',
    },
    'gw5yg70p': {
      'en': 'Deletar',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // widgetCrudEditAndCreateMunicipios
  {
    'awre70en': {
      'en': 'Digite o nome do municipio para executar essa ação!',
      'ar': '',
      'de': '',
      'es': '',
    },
    'khg958vi': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // widgetCrudEditAndCreateBairros
  {
    '5g0oohev': {
      'en': 'Digite o nome do municipio para executar essa ação!',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2utvvm43': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // widgetCrudEditAndCreateEstado
  {
    'j9dg3xkt': {
      'en': 'Digite o nome do estado para executar essa ação!',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1t7zpu1f': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    'nzhd0ee5': {
      'en': 'Digite o codigo do estado para executar essa ação!',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8pb4kuh9': {
      'en': 'O codigo do estado possui apenas 2 characters!',
      'ar': '',
      'de': '',
      'es': '',
    },
    'dto9vl9x': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // widgetCrudEditAndCreateCategorias
  {
    'e5fxlkhz': {
      'en': 'Digite o nome da categoria para executar essa ação!',
      'ar': '',
      'de': '',
      'es': '',
    },
    'e650f6c0': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // inputSelection
  {
    '7r4if1qu': {
      'en': 'Busque',
      'ar': '',
      'de': '',
      'es': '',
    },
    'rhcl8z0f': {
      'en': 'Option 1',
      'ar': '',
      'de': '',
      'es': '',
    },
    'iubhj1fx': {
      'en': 'Option 2',
      'ar': '',
      'de': '',
      'es': '',
    },
    'd58jxp5b': {
      'en': 'Option 3',
      'ar': '',
      'de': '',
      'es': '',
    },
    'eisl7npg': {
      'en': 'Sem dados no momento, adicione dados ao banco !',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // listVisualization
  {
    'gestk3ac': {
      'en': 'Visualizações',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // searchBar
  {
    'i5dm43i9': {
      'en': 'Pesquise pelo nome de um estabelecimento',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // JarbasEditTaxas
  {
    'jiyltmg4': {
      'en': 'Taxa de existência:',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mxmla7u6': {
      'en': 'R\$ 0,00',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ibi171w6': {
      'en': 'Taxa de destaque:',
      'ar': '',
      'de': '',
      'es': '',
    },
    '418o93p6': {
      'en': 'R\$ 0,00',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // inputNumber
  {
    'pl7wh9ji': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // JarbasConfirmationDialog
  {
    '8oov1nba': {
      'en': 'Cancelar',
      'ar': '',
      'de': '',
      'es': '',
    },
    '842s9os6': {
      'en': 'Continuar',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // Miscellaneous
  {
    'lzyb73wy': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kx9cdks4': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1xh0q0w2': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'efvtwj7k': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ec5hfa1e': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'q5ljwvfo': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'j4rmwb3h': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6ah1b18f': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2kos1hen': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'v5gi1kzg': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tcaeqgd2': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'okkyqg0a': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0s9ae69n': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3r25t3hn': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'aox3s4fb': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'l8hv5a7z': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4pjwb70a': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0xlokf4y': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8twlwiwt': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'q08nvnfw': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qszyopyr': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'efidkylm': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3rqgxkuh': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zr3q66i7': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'syz55y9l': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    't4xzlq9q': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '513nj4m0': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'a1jxfgju': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
