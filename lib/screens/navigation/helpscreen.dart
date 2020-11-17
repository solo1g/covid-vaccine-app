import 'package:flutter/material.dart';

import '../../models/faqlist.dart';
import '../../widgets/faq.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: faqlist.length,
        itemBuilder: (ctx, i) => Padding(
          padding: const EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
          child: FaqItem(faqlist[i]),
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Text(
                              'Privacy Policy',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                TextBox(
                                    "Your privacy is important to us. It is Phi group's policy to respect your privacy regarding any information we may collect from you through our app, Covify."),
                                TextBox(
                                    "We only ask for personal information when we truly need it to provide a service to you. We collect it by fair and lawful means, with your knowledge and consent. We also let you know why we’re collecting it and how it will be used."),
                                TextBox(
                                    "We only retain collected information for as long as necessary to provide you with your requested service. What data we store, we’ll protect within commercially acceptable means to prevent loss and theft, as well as unauthorized access, disclosure, copying, use or modification."),
                                TextBox(
                                    "We don’t share any personally identifying information publicly or with third-parties, except when required to by law."),
                                TextBox(
                                    "Our app may link to external sites that are not operated by us. Please be aware that we have no control over the content and practices of these sites, and cannot accept responsibility or liability for their respective privacy policies."),
                                TextBox(
                                    "You are free to refuse our request for your personal information, with the understanding that we may be unable to provide you with some of your desired services."),
                                TextBox(
                                    "Your continued use of our app will be regarded as acceptance of our practices around privacy and personal information. If you have any questions about how we handle user data and personal information, feel free to contact us."),
                                TextBox(
                                    "This policy is effective as of 18 November 2020."),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )),
              );
            },
            child: Text(
              'Privacy Policy',
              style: TextStyle(
                color: Colors.grey,
                decoration: TextDecoration.underline,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextBox extends StatelessWidget {
  final String text;

  TextBox(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12,
      ),
    );
  }
}
