import 'package:ebeldi/common/widgets/custom_button.dart';
import 'package:ebeldi/common/widgets/custom_textfield.dart';
import 'package:ebeldi/constants/global_variables.dart';
import 'package:ebeldi/features/auth/services/auth_service.dart';
import 'package:ebeldi/features/cart/screens/cart_screen.dart';
import 'package:ebeldi/features/home/screens/home_screen.dart';
import 'package:ebeldi/features/order/screens/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pay/pay.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../../../common/widgets/bottom_bar.dart';
import '../../../constants/utils.dart';
import '../../../providers/user_provider.dart';
import '../../address/services/address_services.dart';
import 'dart:convert' show json, jsonDecode;
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:ebeldi/features/paiement/screens/mobile.dart'
    if (dart.library.html) 'package:ebeldi/features/paiement/screens/web.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

enum Auth {
  signin,
  signup,
}

class PayScreen extends StatefulWidget {
  static const String routeName = '/pay-screen';
  final String totalAmount;
  const PayScreen({
    Key? key,
    required this.totalAmount,
  }) : super(key: key);
  @override
  State<PayScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<PayScreen> {
  Auth _auth = Auth.signup;
  final _payFormKey = GlobalKey<FormState>();
  final TextEditingController nom = TextEditingController();
  final TextEditingController prenom = TextEditingController();
  final TextEditingController carte = TextEditingController();
  final TextEditingController mois = TextEditingController();
  final TextEditingController year = TextEditingController();
  final TextEditingController code = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  List<PaymentItem> paymentItems = [];
  final AddressServices addressServices = AddressServices();
  String total = "";
  @override
  void initState() {
    super.initState();
    paymentItems.add(
      PaymentItem(
        amount: widget.totalAmount,
        label: 'Total Amount',
        status: PaymentItemStatus.final_price,
      ),
    );
    total = widget.totalAmount;
  }

  @override
  void dispose() {
    super.dispose();
    nom.dispose();
    prenom.dispose();
    carte.dispose();
    mois.dispose();
    year.dispose();
    code.dispose();
  }

  void onApplePayResult(String addressToBeUsed) {
    addressServices.placeOrder(
      context: context,
      address: addressToBeUsed,
      totalSum: double.parse(widget.totalAmount),
    );
  }

  void navigateToOrders() {
    Navigator.pushNamed(
      context,
      Orderss.routeName,
    );
  }

  void navigateToCart() {
    Navigator.pushNamed(
      context,
      BottomBar.routeName,
    );
  }

  Future<void> _createPDF(String addressToBeUsed) async {
    //Create a new PDF document
    PdfDocument document = PdfDocument();

    //Add a new page and draw text
    final page = document.pages.add();
    page.graphics.drawString(
        'eBeldi >> Recus de paiement  \n \n Vous avez effectuer \n une commande chez eBeldi',
        PdfStandardFont(PdfFontFamily.timesRoman, 40));

    PdfGrid grid = PdfGrid();
    grid.style = PdfGridStyle(
        font: PdfStandardFont(PdfFontFamily.timesRoman, 40),
        cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2));

    grid.columns.add(count: 2);
    grid.headers.add(1);

    PdfGridRow header = grid.headers[0];
    header.cells[0].value = 'Total payé';
    header.cells[1].value = widget.totalAmount + ' Dhs';

    PdfGridRow row = grid.rows.add();
    row.cells[0].value = 'Nom';
    row.cells[1].value = nom.text;

    row = grid.rows.add();
    row.cells[0].value = 'Prénom';
    row.cells[1].value = prenom.text;

    row = grid.rows.add();
    row.cells[0].value = 'Adresse';
    row.cells[1].value = addressToBeUsed;

    grid.draw(
        page: document.pages.add(), bounds: const Rect.fromLTWH(0, 0, 0, 0));

    //Save the document
    List<int> bytes = await document.save();

    //Dispose the document
    document.dispose();
    saveAndLaunchFile(bytes, "Recu_Paiement.pdf");
  }

  void payPressed(String addressToBeUsed) {
    bool isForm = nom.text.isNotEmpty ||
        prenom.text.isNotEmpty ||
        carte.text.isNotEmpty ||
        code.text.isNotEmpty ||
        year.text.isNotEmpty ||
        mois.text.isNotEmpty;

    if (isForm) {
      if (_payFormKey.currentState!.validate()) {
        addressServices.placeOrder(
          context: context,
          address: addressToBeUsed,
          totalSum: double.parse(widget.totalAmount),
        );
        showSnackBar(context,
            'Le paiement de votre commande a été effectué avec succés, Votre recus de paiement a été généré');
        _createPDF(addressToBeUsed);
      } else {
        throw Exception('Please enter all the values!');
      }
    } else {
      showSnackBar(context, 'Entrer les informations de paiement');
    }
  }

  sendEmail() async {
    String username = 'saratlb63@gmail.com'; //Your Email;
    String password = 'AZERTYQSDF123?'; //Your Email's password;

    final smtpServer = gmail(username, password);
    // Creating the Gmail server

    // Create our email message.
    final message = Message()
      ..from = Address(username)
      ..recipients.add('saratlbazer1234@gmail.com') //recipent email
      ..ccRecipients.addAll(
          ['destCc1@example.com', 'destCc2@example.com']) //cc Recipents emails
      ..bccRecipients
          .add(Address('bccAddress@example.com')) //bcc Recipents emails
      ..subject =
          'Test Dart Mailer library :: 😀 :: ${DateTime.now()}' //subject of the email
      ..text =
          'This is the plain text.\nThis is line 2 of the text part.'; //body of the email

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' +
          sendReport.toString()); //print if the email is sent
    } on MailerException catch (e) {
      print('Message not sent. \n' +
          e.toString()); //print if the email is not sent
      // e.toString() will show why the email is not sending
    }
  }

  Future sendEmail2({
    required String email,
    required String sujet,
    required String message,
  }) async {
    final serviceId = 'service_9fnb6t2';
    final templateId = 'template_tb3v3pg';
    final userId = 'bqZ4UUF2HDQlGSii1';
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final resonse = await http.post(
      url,
      headers: {
        'Content_Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'email': email,
          'sujet': sujet,
          'message': message,
        }
      }),
    );
    print(resonse.body);
    showSnackBar(context, 'on vous a envoyé un email de validation');
  }

  @override
  Widget build(BuildContext context) {
    var address = context.watch<UserProvider>().user.address;
    var total = "h";
    var yearp = [2001];
    for (var i = 2002; i < 2024; i++) {
      yearp.add(i);
    }
    var moisp = [1];
    for (var i = 2; i < 13; i++) {
      moisp.add(i);
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 0, right: 15),
                child: Row(
                  children: [
                    RichText(
                      text: const TextSpan(
                        text: 'Paiement',
                        style: TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*const Text(
                'Total à payer : ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),*/
              const SizedBox(height: 10),
              const Text(
                'Comment voulez-vous payer votre commande?',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 10),
              ListTile(
                tileColor: _auth == Auth.signup
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: const Text(
                  'Paiement en ligne',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signup)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _payFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: nom,
                          hintText: 'Nom',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: prenom,
                          hintText: 'Prénom',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: carte,
                          hintText: 'Numéro de la carte de crédit',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: code,
                          hintText: 'Code de sécurité',
                        ),
                        const SizedBox(height: 10),
                        /* CustomTextField(
                          controller: mois,
                          hintText: 'Mois expiration',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: year,
                          hintText: 'Année expiration',
                        ),*/
                        const SizedBox(height: 10),
                        TextFormField(
                            controller: dateinput,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Entrer La Date d expiration de votre carte';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              icon: Icon(
                                  Icons.calendar_today), //icon of text field
                              labelText: "Date expiration",
                              //label text of field
                            ),
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(
                                      2000), //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2024));
                              if (pickedDate != null) {
                                //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate =
                                    DateFormat('yyyy-MM').format(pickedDate);
                                //formatted date output using intl package =>  2021-03-16
                                //you can implement different kind of Date Format here according to your requirement

                                setState(() {
                                  dateinput.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              }
                            }),
                        /* Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (var menu in yearp) Text(menu.toString())
                          ],
                        ),*/
                        const SizedBox(height: 10),
                        CustomButton(
                          text: 'Payer',
                          onTap: () {
                            payPressed(address);
                            navigateToCart();
                            sendEmail();
                            /*  sendEmail2(
                                email: 'saratlbazer1234@gmail.com',
                                message: 'hhhhhh',
                                sujet: 'helo'); */
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ListTile(
                tileColor: _auth == Auth.signin
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: const Text(
                  'Paiement à la livraison',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signin)
                Container(
                    padding: const EdgeInsets.all(8),
                    color: GlobalVariables.backgroundColor,
                    //child: const SizedBox(height: 10),
                    child: CustomButton(
                      text: 'Valider',
                      onTap: () {
                        onApplePayResult(address);
                        navigateToCart();
                      },
                    )),
            ],
          ),
        ),
      ),
    );
  }
}

Future<Uint8List> _readImageData(String name) async {
  final data = await rootBundle.load('images/$name');
  return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
}
