import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/styles.dart';

class NotificationDetailPage extends StatefulWidget {
  const NotificationDetailPage({Key? key}) : super(key: key);

  @override
  State<NotificationDetailPage> createState() => _NotificationDetailPageState();
}

class _NotificationDetailPageState extends State<NotificationDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 60, 16, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: const CircleAvatar(
                  backgroundColor: kSilver,
                  radius: 18,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: kBlack,
                    size: 16,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Upload room clearing pictures.',
                style: ktsTitleText,
              ),
              const SizedBox(height: 8),
              Text(
                'This is not sure by uploading the pictures , you\'ll claim the cleaning services fees. It\'ll take up-to 14 days to confirm the claim.',
                style: ktsBodyRegular,
              ),
              const SizedBox(height: 16),
              DottedBorder(
                strokeWidth: 0.6,
                dashPattern: const [8, 10],
                radius: const Radius.circular(12),
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 24,
                ),
                borderType: BorderType.RRect,
                child: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      DottedBorder(
                        strokeWidth: 0.6,
                        dashPattern: const [4, 5],
                        borderType: BorderType.Circle,
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.add,
                            size: 26,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Add Images',
                        style: ktsBodyExtraLarge,
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          text: 'Browse Files ',
                          style: ktsBodyRegular.copyWith(color: kBlue),
                          children: [
                            TextSpan(
                              text: 'from gallery or camera',
                              style: ktsBodyRegular.copyWith(
                                color: kBlack.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.maxFinite,
                height: 150,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/image1.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Positioned(
                      right: 10,
                      top: 10,
                      child: CircleAvatar(
                        backgroundColor: kWhite,
                        radius: 24,
                        child: Icon(
                          Icons.clear,
                          color: kBlack,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.maxFinite,
                height: 190,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/image2.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Positioned(
                      right: 10,
                      top: 10,
                      child: CircleAvatar(
                        backgroundColor: kWhite,
                        radius: 24,
                        child: Icon(
                          Icons.clear,
                          color: kBlack,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 36),
              Row(
                children: [
                  Expanded(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: kSilver,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: Text(
                          'Back',
                          textAlign: TextAlign.center,
                          style: ktsBodyRegular.copyWith(
                            color: kBlack,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: kBlue,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: Text(
                          'Submit',
                          textAlign: TextAlign.center,
                          style: ktsBodyRegular.copyWith(
                            color: kWhite,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
