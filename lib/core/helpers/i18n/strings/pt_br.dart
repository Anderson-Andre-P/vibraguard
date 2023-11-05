import './translation.dart';

class PtBr implements Translation {
  @override
  String get msgRequireField => 'mandatory filling';
  @override
  String get loading => 'loading...';
  @override
  String get toStart => 'start';
  @override
  String get titleOfApp => 'VibraGuard';
  @override
  String get subtitleOfApp => 'work orders manager';
  @override
  String get onboardingTitleOne => 'welcome to VibraGuard';
  @override
  String get onboardingTitleTwo => 'monitor your assets in real time';
  @override
  String get onboardingTitleThree => 'generate service orders';
  @override
  String get onboardingSubtitleOne => 'the best device manager';
  @override
  String get onboardingSubtitleTwo => 'monitor your assets wherever you are';
  @override
  String get onboardingSubtitleThree => 'easily generate new work orders';
  @override
  String get itemNotFound => 'Item not found';
  @override
  String get loginTitle => 'Access your account';
  @override
  String get signUpTitle => 'Create your account';
  @override
  String get loginSubTitle => 'Please login to access our application';
  @override
  String get signUpSubTitle =>
      'Please create account to access the application';
  @override
  String get emailTitle => 'Enter your e-mail';
  @override
  String get passwordTitle => 'Enter your password';
  @override
  String get forgotPassword => 'Forgot password?';
  @override
  String get dontHaveAccount => 'Don`t have an account? ';
  @override
  String get loginButton => 'Log in';
  @override
  String get signinButton => 'Sign in';
  @override
  String get signupButton => 'Sign up';
  @override
  String get invalidEmail => 'Please enter a valid e-mail';
  @override
  String get emptyEmail => 'Please enter your e-mail';
  @override
  String get invalidPassword => 'Please enter a valid password';
  @override
  String get emptyPassword => 'Please enter your password';
  @override
  String get invalidCredentials =>
      'Something went wrong. Please check your credentials and try again';
  @override
  String get validCredentials => 'Acepted credentials. Log in...';
  @override
  String get welcomeMessage => 'Welcome,';
  @override
  String get randomName => 'John Doe';
  @override
  String get sumaryOfAssets => "Summary of asset";
  @override
  String get modelOfAsset => "Model";
  @override
  String get sensorsOfAsset => "Sensors";
  @override
  String get metricsOfAsset => "Metrics";
  @override
  String get healthHistoryOfAsset => "Health history";
  @override
  String get lastUptimeOfAsset => "Last uptime:";
  @override
  String get totalCollectsUptimeOfAsset => "Total collects uptime:";
  @override
  String get totalUptimeOfAsset => "Total uptime:";
  @override
  String get assetDetails => "Asset details";
  @override
  String get workOrders => "Work orders";
  @override
  String get addWorkOrder => "Add work order";
  @override
  String get addWorkOrderInputTitle => "Title";
  @override
  String get addWorkOrderInputDescription => "Description";
  @override
  String get addWorkOrderLowPriority => "Add work order";
  @override
  String get addWorkOrderMediumPriority => "Add work order";
  @override
  String get addWorkOrderHighPriority => "High";
  @override
  String get addWorkOrderInputPriority => "Priority";
  @override
  String get save => "Save";
  @override
  String get workOrderDetails => "Work order details";
  @override
  String get workOrderStatus => "Status";
  @override
  String get workOrderAssignedTo => "Assigned To";
  @override
  String get workOrderUnknowUser => "Unknown User";
  @override
  String get workOrderChecklist => "Checklist";
  @override
  String get about => "About";
  @override
  String get aboutTitle => "About this app";
  @override
  String get aboutSubtitle =>
      'Discover more information about the application.';

  @override
  String get appVersion => "Version 1.0.0";
  @override
  String get appDescription =>
      "This is an application that I developed as a challenge for the Tractian selection process.";
  @override
  String get description => "Description";
  @override
  String get developedBy => "Developed by:";
  @override
  String get autor => "Anderson André";
  @override
  String get close => "Close";
}
