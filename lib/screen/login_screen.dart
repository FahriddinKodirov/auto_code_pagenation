import 'package:code_login/bloc/auto_fill_bloc.dart';
import 'package:code_login/bloc/auto_fill_event.dart';
import 'package:code_login/bloc/auto_fill_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagenation_app/utils/my_utils.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:telephony/telephony.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _code = "";
  final Telephony telephony = Telephony.instance;

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AutoFillBloc()..add(FetchAutoFill(code: _code)),
      child: BlocBuilder<AutoFillBloc, AutoFillState>(
        builder: (context, state) {
          if (state is InitialAutoFillState) {
            return const Text('code kelmadi');
          }
          if (state is LoadAutoFillInSuccess) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                home: Scaffold(
                  backgroundColor: const Color(0xFFFFFFFF),
                  appBar: AppBar(
                    title: const Text('Code Auto Fill'),
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        
                        Image.network(
                            'https://img.lovepik.com/photo/45010/2674.jpg_wh300.jpg'),
                        SizedBox(
                          height: height(context) * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: width(context) * 0.12),
                          child: PinFieldAutoFill(
                            decoration: const UnderlineDecoration(
                              lineStrokeCap: StrokeCap.round,
                              textStyle:
                                  TextStyle(fontSize: 20, color: Colors.black),
                              colorBuilder: FixedColorBuilder(Colors.black),
                            ),
                            currentCode: state.codeAutoFill,
                            onCodeSubmitted: (code) {},
                            onCodeChanged: (code) {
                              if (code! == '478510') {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                navigator(context);
                              }
                            },
                          ),
                        ),
                        SizedBox(height: width(context)*0.04,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: width(context)*0.02),
                          child: const Text('raqamli code kiriting',style: TextStyle(fontSize: 18,color: Colors.black38),),
                        ),
                        SizedBox(height: height(context)*0.03,),
                        Image.network('https://static.vecteezy.com/ti/gratis-vector/t2/349969-checklist-pictogram-gratis-vector.jpg'),
                        buttom(state.codeAutoFill)
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return Container(
            color: Colors.amber,
          );
        },
      ),
    );
  }

  buttom(code) {
    return InkWell(
      onTap: () {
        final SmsSendStatusListener listener = (SendStatus status) {
	// Handle the status
	};
        telephony.sendSms(
	      to: "+998917956860",
	      message: "<#> Confimation Code: 478510 t0pCJ4woXOH",
	      statusListener: listener
	     );
      },
      child: Container(
        height: height(context) * 0.08,
        width: width(context) * 0.85,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(height(context) * 0.06),
            color: Colors.blue),
        child: const Center(
            child: Text(
          'Send me Link',
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
