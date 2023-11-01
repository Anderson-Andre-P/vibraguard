import './translation.dart';

class PtBr implements Translation {
  @override
  String get msgRequireField => 'preenchimento obrigatório.';
  @override
  String get loading => 'carregando...';
  @override
  String get toStart => 'começar';
  @override
  String get titleOfApp => 'vibraguard';
  @override
  String get subtitleOfApp => 'gerenciador de ordens de serviço';
  @override
  String get onboardingTitleOne => 'bem-vindo ao VibraGuard';
  @override
  String get onboardingTitleTwo => 'monitore em tempo real seus ativos';
  @override
  String get onboardingTitleThree => 'gere ordens de serviço';
  @override
  String get onboardingSubtitleOne => 'o melhor gerenciador de dispositivos';
  @override
  String get onboardingSubtitleTwo => 'monitore seus ativos de onde estiver';
  @override
  String get onboardingSubtitleThree =>
      'gere novas ordens de serviço facilmente';
  @override
  String get itemNotFound => 'Item não encontrado';
}
