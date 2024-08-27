import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 245, 240, 240),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 60.w,
                ),
                ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/pic.jpg'),
                  ),
                  title: const Text(
                    'Hello',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  subtitle: const Text(
                    'Huzaifa Ishfaq',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                    style: IconButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 230, 226, 226)),
                  ),
                ),
                Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0.r),
                    ),
                    elevation: 4,
                    margin: EdgeInsets.all(4.0),
                    color: Colors.blue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                            'Current Balance',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: Image.asset('assets/images/mastercard.png'),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 30.w,
                            ),
                            Icon(Icons.currency_rupee_outlined),
                            Text(
                              '700',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 60.h,
                              width: 30.w,
                            ),
                            Text(
                              '****  ****  ****  ****  4571',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                        ListTile(
                          title: Text(
                            'Huzaifah Ishfaq',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          trailing: Text(
                            'Ex.Date\n10/8',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        )
                      ],
                    )),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Services',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Column(children: [
                        Container(
                          width: 60.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromARGB(255, 230, 75, 70)),
                          child: Center(
                            child: Icon(
                              Icons.wallet,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text('Wallet',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ]),
                      SizedBox(
                        width: 30.w,
                      ),
                      Column(children: [
                        Container(
                          width: 60.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromARGB(255, 94, 159, 233)),
                          child: Center(
                            child: Icon(
                              Icons.currency_exchange,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text('Transfer',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ]),
                      SizedBox(
                        width: 30.w,
                      ),
                      Column(children: [
                        Container(
                          width: 60.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromARGB(255, 255, 226, 58)),
                          child: Center(
                            child: Icon(
                              Icons.payments,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text('Pay',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ]),
                      SizedBox(
                        width: 30.w,
                      ),
                      Column(children: [
                        Container(
                          width: 60.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromARGB(255, 46, 236, 56)),
                          child: Center(
                            child: Icon(
                              Icons.money,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text('Topup',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ]),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Recent Transactions',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 4,
                  margin: EdgeInsets.all(2.0),
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Container(
                          width: 50.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromARGB(255, 180, 0, 105)),
                          child: Center(
                            child: Icon(
                              Icons.sports_baseball,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dribble',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('Payment Received')
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.currency_pound),
                        Text('200')
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0.r),
                  ),
                  elevation: 4,
                  margin: EdgeInsets.all(2.0),
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Container(
                          width: 50.h,
                          height: 50.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: const Color.fromARGB(255, 78, 201, 54)),
                          child: Center(
                            child: Icon(
                              Icons.line_axis,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Google Wallet',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('Payment Received')
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.currency_pound),
                        Text('200')
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0).r,
                  ),
                  elevation: 4,
                  margin: EdgeInsets.all(2.0),
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Container(
                          width: 50.h,
                          height: 50.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: const Color.fromARGB(255, 78, 201, 54)),
                          child: Center(
                            child: Icon(
                              Icons.line_axis,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Google Wallet',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('Payment Received')
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.currency_pound),
                        Text('200')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
        ));
  }
}
