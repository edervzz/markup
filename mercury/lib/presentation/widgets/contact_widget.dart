import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactWidget extends StatefulWidget {
  final phoneNumber = "55 1234 5678";
  const ContactWidget({super.key});
  @override
  State<StatefulWidget> createState() => ContactWidgetState();
}

class ContactWidgetState extends State<ContactWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              AppLocalizations.of(context)!.text01,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          const Icon(
            Icons.phone_outlined,
            color: Colors.red,
            size: 35,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.callus,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () => {},
                  child: TextButton(
                    onPressed: () async {
                      await FlutterPhoneDirectCaller.callNumber(
                          widget.phoneNumber.replaceAll(' ', ''));
                    },
                    child: Text(
                      widget.phoneNumber,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.mail_outline,
            color: Colors.red,
            size: 35,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.callus,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    // final Email email = Email(
                    //   body: 'Email body',
                    //   subject: 'Email subject',
                    //   recipients: ['example@example.com'],
                    //   cc: ['cc@example.com'],
                    //   bcc: ['bcc@example.com'],
                    //   isHTML: false,
                    // );

                    // await FlutterEmailSender.send(email);
                  },
                  child: const Text(
                    "info@markup.mx",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
