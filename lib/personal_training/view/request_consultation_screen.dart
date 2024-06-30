import 'package:cafe/common/component/default_button.dart';
import 'package:cafe/common/view/completion_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../component/main_calendar.dart';
import '../component/radio_card.dart';

class RequestConsultationScreen extends ConsumerStatefulWidget {
  static String get routeName => "request_consultation";

  const RequestConsultationScreen({super.key});

  @override
  ConsumerState<RequestConsultationScreen> createState() =>
      _RequestConsultationScreenState();
}

class _RequestConsultationScreenState
    extends ConsumerState<RequestConsultationScreen> {
  bool isLoading = false;
  DateTime selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
    // DateTime.now().hour,
    // DateTime.now().minute,
    // 1,
  );
  final List<String> times = [
    '10:00',
    '10:30',
    '11:00',
    '11:30',
    '12:00',
    '12:30',
    '13:00',
    '13:30',
    '14:00',
    '14:30',
    '15:00',
    '15:30',
    '16:00',
    '16:30',
    '17:00',
    '17:30'
  ];
  String selectedTime = '';

  bool isSelectedTime = false;
  bool? isOnlineConsulting;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      isLoading: isLoading,
      appbar: const DefaultAppBar(title: '상담 예약'),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    '상담 일정을 선택해 주세요',
                    style: MyTextStyle.bodyTitleMedium,
                  ),
                  const SizedBox(height: 12.0),
                  MainCalendar(
                    selectedDate: selectedDate,
                    onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                      setState(() {
                        selectedDate = selectedDay;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 43.0,
              child: ListView.separated(
                padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, idx) {
                  final isSelected = selectedTime == times[idx];

                  return InkWell(
                    onTap: () {
                      setState(() {
                        if (!isSelectedTime) {
                          isSelectedTime = true;
                        }
                        selectedTime = times[idx];
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected ? MyColor.primary : MyColor.white,
                        border: Border.all(
                          width: 1.0,
                          color: MyColor.middleGrey,
                        ),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Text(
                          times[idx],
                          style: MyTextStyle.bodyRegular.copyWith(
                            color: isSelected ? MyColor.white : MyColor.text,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, index) {
                  return const SizedBox(width: 8.0);
                },
                itemCount: times.length,
              ),
            ),
            if (isSelectedTime)
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      '상담 유형을 선택해 주세요',
                      style: MyTextStyle.bodyTitleMedium,
                    ),
                    const SizedBox(height: 8.0),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isOnlineConsulting = true;
                        });
                      },
                      child: RadioCard(
                        title: '온라인 상담',
                        description:
                            '온라인상담 진행 요청 시 진행방법에 대한 안내가 고객님께 문자로 발송됩니다. 확인해주세요!',
                        isSelected:
                            isOnlineConsulting != null && isOnlineConsulting!
                                ? true
                                : false,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isOnlineConsulting = false;
                        });
                      },
                      child: RadioCard(
                        title: '전화 상담',
                        description:
                            '전화상담 진행 요청 시 상담 하루전 안내 문자가 발송됩니다. 확인해주세요!',
                        isSelected:
                            isOnlineConsulting != null && !isOnlineConsulting!
                                ? true
                                : false,
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    PrimaryButton(
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        await Future.delayed(const Duration(seconds: 1));
                        setState(() {
                          isLoading = false;
                        });
                        context.goNamed(
                          CompletionScreen.routeName,
                          pathParameters: {'title': '상담 요청이\n정상적으로\n완료되었습니다.'},
                        );
                      },
                      child: const Text('상담 요청'),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
