import 'package:get/get.dart';
import 'package:vibraguard/core/helpers/images/image_paths.dart';
import 'package:vibraguard/views/screens/auth/sign_in_screen.dart';
import 'package:vibraguard/views/shared/components/button_primary.dart';
import '../../core/helpers/resources.dart';
import '../../model/onboarding/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late OnboardingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    _model = OnboardingModel();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    // FlutterNativeSplash.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // context.watch<AppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.black,
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Stack(
                      children: [
                        PageView(
                          controller: _model.pageViewController ??=
                              PageController(initialPage: 0),
                          scrollDirection: Axis.horizontal,
                          children: [
                            CustomPageOnboardingWidget(
                              imagePath: ImagePaths.imageTorno01,
                              title:
                                  (R.string.onboardingTitleOne).toUpperCase(),
                              subtitle:
                                  (R.string.onboardingSubtitleOne).capitalize!,
                            ),
                            CustomPageOnboardingWidget(
                              imagePath: ImagePaths.imageTorno02,
                              title:
                                  (R.string.onboardingTitleTwo).toUpperCase(),
                              subtitle:
                                  (R.string.onboardingSubtitleTwo).capitalize!,
                            ),
                            CustomPageOnboardingWidget(
                              imagePath: ImagePaths.imageTorno03,
                              title:
                                  (R.string.onboardingTitleThree).toUpperCase(),
                              subtitle: (R.string.onboardingSubtitleThree)
                                  .capitalize!,
                            ),
                          ],
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.00, 1.00),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 24),
                            child: smooth_page_indicator.SmoothPageIndicator(
                              controller: _model.pageViewController ??=
                                  PageController(initialPage: 0),
                              count: 3,
                              axisDirection: Axis.horizontal,
                              onDotClicked: (i) async {
                                await _model.pageViewController!.animateToPage(
                                  i,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                              effect: smooth_page_indicator.ExpandingDotsEffect(
                                expansionFactor: 4,
                                spacing: 6,
                                radius: 8,
                                dotWidth: 8,
                                dotHeight: 8,
                                dotColor:
                                    const Color.fromARGB(167, 255, 255, 255),
                                activeDotColor: R.colors.darkPrimaryButtonColor,
                                paintStyle: PaintingStyle.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 36),
                  child: ButtonPrimary(
                    onPressed: () async {
                      if (Navigator.of(context).canPop()) {
                        Navigator.pop(context);
                      }
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (c) {
                            return const SignInScreen();
                          },
                        ),
                      );
                    },
                    title: (R.string.toStart).capitalize!,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomPageOnboardingWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;

  const CustomPageOnboardingWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          imagePath,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black],
              stops: [0, 1],
              begin: AlignmentDirectional(0, -1),
              end: AlignmentDirectional(0, 1),
            ),
            shape: BoxShape.rectangle,
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(50, 50, 50, 50),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: R.colors.darkTitleTextColor,
                      fontSize: R.fontSize.fs33,
                      fontFamily: R.fontFamily.primaryFont,
                      fontWeight: R.fontWeight.normal,
                      height: 1,
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 24, 16, 0),
                  child: Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: R.colors.darkTitleTextColor,
                      fontSize: R.fontSize.fs19,
                      fontFamily: R.fontFamily.primaryFont,
                      fontWeight: R.fontWeight.medium,
                      height: 1.25,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
