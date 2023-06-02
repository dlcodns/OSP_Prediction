import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyPage());
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mypage',
      home: Scaffold(
        backgroundColor: const Color(0xffE3DCFF),
        appBar: AppBar(
          toolbarHeight: 60,
          elevation: 4,
          shadowColor: Color(0xffE6E6E6),
          backgroundColor: Color(0xffE3DCFF),
          title: Padding(
            padding: EdgeInsets.only(right:12.0),
            child: Row(
              children: const [
                Icon(Icons.menu, color: Color(0xff404040), size: 30),
                Text('  마이페이지',
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(0xff404040),
                      fontWeight: FontWeight.bold
                  ),)
              ],
            ),
          ),
        ),
        body: My(),
      ),
    );
  }
}


class My extends StatefulWidget {
  @override
  _MyPage createState() => _MyPage();
}

class _MyPage extends State<My> {
  String? selectedMyImagePath = null;

  Future<String?> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      return pickedFile.path;
    }
  }

  String getFileName(String? path) {
    if (path == null) {
      return '';
    }
    return path.split('/').last;
  }

  @override
  Widget build(BuildContext context){
    return ListView(
      children: [
        Expanded(
          child: SizedBox(
            height: 330,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffE3DCFF),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, right:40),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Container(
                            width: 70,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.transparent,
                              border: Border.all(
                                color: Color(0xffD3CCEC),
                                width: 2,
                              ),
                            ),
                            child:  Icon(
                              Icons.settings,
                              color: Color(0xffB2ADC6),
                              size: 35,
                            ),
                          ),
                        )
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child:Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffF1EEFF),
                        ),
                        child: Icon(
                          Icons.person,
                          color: Color(0xffB2ADC6),
                          size: 90,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex:4,
                    child :Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        '김두루미님',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff404040),
                        ),
                      ),
                    )
                  ),
                  Expanded(
                    flex: 9,
                    child: Padding(
                      padding: EdgeInsets.only(right:30, left:30, bottom: 10),
                      child: Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () async {
                            final imagePath = await pickImage();
                            setState(() {
                              selectedMyImagePath = imagePath!;
                            });
                          },
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xffCCC6E6),
                                  blurRadius: 3.0,
                                  spreadRadius: 0.0,
                                  offset: const Offset(0,3),
                                )
                              ],
                              color: Color(0xffF1EEFF),
                            ),
                            child: Row(
                              children: [
                                Padding(padding: EdgeInsets.only(right:10, left:10)),
                                Image.asset(
                                  'assets/bodypic.png',
                                  width: 50,
                                  height: 50,
                                ),
                                Align(
                                  child: Text(
                                    '     신체 이미지 저장 및 변경',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xff404040),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(height: 40),
        ),

        Expanded(
          child: SizedBox(
            height: 45,

            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Flexible(
                    flex: 17,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('    도움말',
                            style: TextStyle(
                                color: Color(0xff918E9F),
                                fontWeight: FontWeight.bold,
                                fontSize: 13
                            )
                        ),
                        Align(
                            child: Icon(Icons.arrow_forward_ios,
                              color: Color(0xffE3DCFF),)
                        )
                      ],
                    ),
                  )
                ]
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
              height: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffD3CCEC)
                ),
              )
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 45,
            child: ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffE3DCFF),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Flexible(
                      flex: 17,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('공지사항',
                              style: TextStyle(
                                  color: Color(0xff404040),
                                  fontSize: 15
                              )
                          ),
                          Align(
                              child: Icon(Icons.arrow_forward_ios, color: Color(
                                  0xff726F7A),)
                          )
                        ],
                      ),
                    )
                  ]
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(height: 1,
              child: Container(
                decoration: BoxDecoration(color: Color(0xffD3CCEC)),)),
        ),

        Expanded(
          child: SizedBox(
            height: 45,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Perinfo()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffE3DCFF),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Flexible(
                      flex: 17,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('개인정보 처리방침',
                              style: TextStyle(
                                  color: Color(0xff404040),
                                  fontSize: 15
                              )
                          ),
                          Align(
                              child: Icon(Icons.arrow_forward_ios, color: Color(
                                  0xff726F7A),)
                          )
                        ],
                      ),
                    )
                  ]
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
              height: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffD3CCEC)
                ),
              )
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 45,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Service()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffE3DCFF),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Flexible(
                      flex: 17,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('서비스 이용 약관',
                              style: TextStyle(
                                  color: Color(0xff404040),
                                  fontSize: 15
                              )
                          ),
                          Align(
                              child: Icon(Icons.arrow_forward_ios, color: Color(
                                  0xff726F7A),)
                          )
                        ],
                      ),
                    )
                  ]
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
              height: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffD3CCEC)
                ),
              )
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 45,
            child: ElevatedButton(
              onPressed: () {
                //알림 설정
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffE3DCFF),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Flexible(
                      flex: 17,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('오픈소스 라이선스',
                              style: TextStyle(
                                  color: Color(0xff404040),
                                  fontSize: 15
                              )
                          ),
                          Align(
                              child: Icon(Icons.arrow_forward_ios, color: Color(
                                  0xff726F7A),)
                          )
                        ],
                      ),
                    )
                  ]
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
              height: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffD3CCEC)
                ),
              )
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 45,
            child: ElevatedButton(
              onPressed: () {
                //알림 설정
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffE3DCFF),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Flexible(
                      flex: 17,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('버전정보 v1.0',
                              style: TextStyle(
                                  color: Color(0xff404040),
                                  fontSize: 15
                              )
                          ),
                          Align(
                              child: Icon(Icons.arrow_forward_ios, color: Color(
                                  0xff726F7A),)
                          )
                        ],
                      ),
                    )
                  ]
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
              height: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffD3CCEC)
                ),
              )
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 45,
            child: ElevatedButton(
              onPressed: () {
                //알림 설정
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffE3DCFF),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Flexible(
                      flex: 17,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('실험실',
                              style: TextStyle(
                                  color: Color(0xff404040),
                                  fontSize: 15
                              )
                          ),
                          Align(
                              child: Icon(Icons.arrow_forward_ios, color: Color(
                                  0xff726F7A),)
                          )
                        ],
                      ),
                    )
                  ]
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
              height: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffD3CCEC)
                ),
              )
          ),
        ),
      ],
    );
  }
}

class Perinfo extends StatelessWidget {
  const Perinfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'perinfo',
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 60,
          elevation: 4,
          shadowColor: Color(0xffE6E6E6),
          backgroundColor: Color(0xffE3DCFF),
          title: Padding(
            padding: EdgeInsets.only(right:12.0),
            child: Row(
              children: const [
                Icon(Icons.arrow_back_ios, color: Color(0xff404040), size: 30),
                Text('  개인정보 처리방침',
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(0xff404040),
                      fontWeight: FontWeight.bold
                  ),)
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 5.0, right: 5.0),
            child:  Text(
                'Fitting Room 개인정보처리방침\n㈜피팅룸코퍼레이션(이하 /피팅룸/이라 합니다)은 서비스의 제공에 있어 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 개인정보보호법 등 관련 개인정보보호 규정을 철저히 준수하며, 관련법령에 따라 본 개인정보 처리방침을 정하여 이용자의 권익 보호에 최선을 다하고 있습니다.\n피팅룸은 본 개인정보 처리방침을 통하여 피팅룸이 어떤 정보를 수집하고, 수집한 정보를 어떻게 사용하며, 필요에 따라 누구와 이를 공유(위탁 또는 제공)하며, 이용목적을 달성한 정보를 어떻게 파기하는지 등에 관한 정보를 알려 드립니다. 본 개인정보 처리방침은 피팅룸이 제공하는 서비스에 적용됩니다.\n\n\n1. 수집하는 개인정보 항목\n회원가입 시점에 피팅룸이 이용자로부터 수집하는 개인정보는 아래와 같습니다.\n이메일 가입 시\n• 필수항목: 이메일 주소, 비밀번호, 닉네임\n\n\n2. 개인정보 수집 및 이용목적\n피팅룸은 서비스의 회원관리, 서비스 제공, 서비스 개선 및 개발, 안전한 서비스 이용환경 구축 등 아래의 목적으로만 이용자의 개인정보를 수집하여 이용합니다.\n• 회원제 서비스 이용에 따른 회원가입 의사의 확인, 이용자 식별 및 본인여부 확인, 회원자격 유지 및 관리, 회원탈퇴 의사의 확인 등 회원관리\n• 관련법령, 이용약관 등 위반행위에 대한 제재, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 질의 및 민원처리 등 이용자 보호 및 서비스 운영\n• 이용자가 안심하고 이용할 수 있는 안전한 서비스 이용환경 구축\n\n\n3. 개인정보의 제 3 자 제공\n피팅룸은 원칙적으로 이용자 동의 없이 개인정보를 제 3 자에게 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.\n• 이용자들이 사전에 동의한 경우\n• 통계작성, 학술연구, 시장조사를 위하여 특정개인을 식별할 수 없는 형태로 가공하여 제공하는 경우\n• 이용자의 생명이나 안전에 급박한 위험이 확인되어 이를 해소하기 위한 경우\n• 기타 관련법령에 의해 개인정보 제출의무가 발생한 경우\n\n\n5. 개인정보의 파기\n피팅룸은 원칙적으로 이용자의 회원 탈퇴(이용계약 해지)시 해당 이용자의 개인정보를 지체없이 파기합니다. 단, 이용자로부터 별도 동의를 얻은 경우나 관련법령에서 일정기간 보관의무를 부과하는 경우에는 해당 기간동안 이를 보관합니다.\n\n이용자로부터 개인정보의 보관기관에 대해 회원가입시 동의를 얻는 경우는 다음과 같습니다.\n• 회원의 이메일 주소, 닉네임 : 탈퇴일로부터 30 일간 보관(재가입, 부정가입 방지, 민원 등 처리 목적)\n\n회원탈퇴, 서비스 종료, 이용자에게 동의받은 개인정보 보유기간의 도래와 같이 개인정보의 수집 및 이용목적이 달성된 개인정보는 재생이 불가능한 방법으로 파기하고 있습니다. 법령에서 보존의무를 부과한 정보에 대해서도 해당 기간 경과 후 지체없이 재생이 불가능한 방법으로 파기합니다.\n개인정보를 파기할 경우, 파기사유가 발생한 개인정보를 선정하고 개인정보보호책임자의 승인을 받아 개인정보를 파기합니다. 출력물 등은 분쇄하거나 소각하는 방법으로, 전자적 파일형태의 경우 복구 및 재생이 되지 않도록 하는 기술적 방법 또는 물리적 방법을 사용하여 파기합니다.\n\n\n6. 개인정보의 안전성 확보조치\n피팅룸은 이용자의 개인정보를 처리함에 있어 안전성을 확보하기 위하여 다음과 같은 대책을 강구하고 있습니다.\n• 이용자의 비밀번호와 같은 중요정보는 암호화하여 저장 및 관리되고 있으며, 개인정보의 확인 및 변경은 비밀번호를 알고 있는 본인에 의해서만 가능합니다.\n• 암호화 통신을 통하여 네트워크상에서 개인정보를 안전하게 송수신하고 있습니다.\n• 내부 관리계획 수립, 운영현황 점검 및 전문인력 확충 등 보안성 확보를 위해 지속적으로 노력하고 있습니다.\n• 개인정보를 처리하는 직원을 최소한으로 관리하고 있으며, 개인정보를 취급하는 직원을 대상으로 주기적인 교육을 실시하며, 전사 임직원에 대한 교육 및 캠페인을 통하여 이용자의 개인정보 보호의 중요성을 인식시키고 있습니다.\n\n단, 피팅룸이 개인정보보호 의무를 다하였음에도 불구하고 이용자 본인의 부주의나 에이블리가 관리하지 않는 영역에서의 사고 등 피팅룸의 귀책에 기인하지 않은 손해에 대해서는 피팅룸이 책임을 지지 않습니다.\n\n\n7. 개인정보 보호책임자 안내\n피팅룸은 개인정보에 대한 의견수렴 및 불만처리, 열람청구에의 대응 등을 위하여 다음과 같이 개인정보보호책임자를 지정하고 있습니다. 이용자는 아래의 연락처로 서비스를 이용하며 발생하는 개인정보에 관한 제반사항에 대한 문의, 개인정보 열람청구 등을 할 수 있고, 피팅룸은 그에 대해 신속하게 답변 및 처리합니다.\n\n• 이름 : 김두루미\n• 직책 : 새\n• 이메일 : dodorumi@gmail.com\n• 전화번호 : 1234-1234\n\n기타 개인정보 침해에 대한 신고나 상담이 필요한 경우에 아래 기관에 문의 가능합니다.\n개인정보침해신고센터 (privacy.kisa.or.kr / 국번없이 118)\n대검찰청 사이버수사과 (www.spo.go.kr / 국번없이 1301)\n경찰청 사이버안전국 (cyberbureau.police.go.kr / 국번없이 182)\n\n\n8. 고지의 의무\n이 개인정보 처리방침은 시행일로부터 적용됩니다. 개인정보 처리방침의 내용은 관련법령, 정부의 정책 또는 보안기술의 변경 등에 따라 변경될 수 있고, 피팅룸은 그 경우 변경된 개인정보 처리방침의 시행일로부터 최소 7 일전에 공지사항을 통해 고지합니다.'
            ),
          )
        ),
      ),
    );
  }
}
