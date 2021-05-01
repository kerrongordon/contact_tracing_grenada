import 'package:contact_tracing_grenada/data/questions.data.dart';
import 'package:contact_tracing_grenada/screens/question.screen.dart';
// import 'package:contact_tracing_grenada/screens/screen.four.dart';
// import 'package:contact_tracing_grenada/screens/screen.one.dart';
// import 'package:contact_tracing_grenada/screens/screen.three.dart';
// import 'package:contact_tracing_grenada/screens/screen.two.dart';
// import 'package:contact_tracing_grenada/services/page.count.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loop_page_view/loop_page_view.dart';

class BasePage extends HookWidget {
  final loopPage = LoopPageController();

  @override
  Widget build(BuildContext context) {
    // final _pageIndex = useProvider(pageCount);
    final pageCount = useState(0);
    // final _pageController = usePageController(initialPage: 0);
    // void onPageChange(int index) => _pageIndex.changePages(index);
    //

    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19 Survey App'),
        centerTitle: true,
      ),
      body: LoopPageView.builder(
        controller: loopPage,
        onPageChanged: (value) => pageCount.value = value,
        itemCount: questionsList.questions.length,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: QuestionScreen(
                pageIndex: pageCount.value,
                page: loopPage,
              ),
            ),
          );
        },
      ),
    );

    // return PageView(
    //   controller: _pageController,
    //   onPageChanged: onPageChange,
    //   physics: const NeverScrollableScrollPhysics(),
    //   children: [
    //     ScreenOne(pageController: _pageController),
    //     ScreenTwo(pageController: _pageController),
    //     ScreenThree(pageController: _pageController),
    //     ScreenFour(pageController: _pageController),
    //   ],
    // );
  }
}
