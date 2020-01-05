import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Navigation with Routes',
    theme: ThemeData(fontFamily: 'NotoSansCJK'),

    routes: <String, WidgetBuilder>{
      '/': (_) => new Splash(),
      '/login': (_) => new Login(),
      '/home': (_) => new Home(),
      '/detail': (_) => new Detail(),
    },
  ));
}


// --------------
// スプラッシュ画面
// --------------
class Splash extends StatefulWidget {
  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    new Future.delayed(const Duration(seconds: 3))
        .then((value) => handleTimeout());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // バックグラウンドカラーの設定
      backgroundColor: Color(0xff6d69a4),

      body: Center(
        child: Container(
          // ロゴのサイズ
          width: 150.0,
          height: 150.0,

          // ロゴの画像
          child: Image.asset('images/logo-white_noname.png'),
        ),
      ),
    );
  }

  void handleTimeout() {
    // 2つめの画面へ遷移する
    /*Navigator.of(context).pushReplacementNamed("/login");*/

    // フェードのアニメーション
    Navigator.of(context).pushReplacement(
      _FadeAnimationCustomRoute(
        settings: RouteSettings(name: "/login"),
        builder: (BuildContext context) => Login(),
      ),
    );

  }
}


// ---------
// ログイン画面
// ---------
class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // バックグラウンドカラーの設定
      /*backgroundColor: Color(0xffF5F9FC),*/
      backgroundColor: Color(0xfff5f5f5),

      // AppBar
      /*
      appBar: new AppBar(
        title: const Text("Login"),
      ),
      */

      body: new Container(

        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

              // Spaceを設ける
              /*SpaceBox.height(136),*/

              // アプリロゴ
              Center(
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  // ロゴの画像
                  child: Image.asset('images/logo-color_noname.png'),
                )
              ),

              // Spaceを設ける
              SpaceBox.height(24),

              // Emailのタイトル
              Container(
                margin:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 24.0),
                child: Text(
                  "Email",
                  style: TextStyle(color: Colors.grey, fontSize: 16.0),
                ),
              ),

              // Spaceを設ける
              SpaceBox.height(8),

              // Emailのフォーム
              Container(
                // フォームの全体の枠をBoxDecorationで準備
                decoration: BoxDecoration(
                  // backgroundcolorを白に設定
                  color: Colors.white,
                  // Borderで全体を覆う
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.5),
                    width: 1.0,
                  ),
                  // フォームのRadius
                  borderRadius: BorderRadius.circular(8.0),
                ),

                // フォームの周辺からのマージン＝画面の端からのマージン
                margin:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 24.0),

                child: Row(
                  children: <Widget>[
                    new Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                      child: Icon(
                        Icons.person_outline,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      height: 30.0,
                      width: 1.0,
                      color: Colors.grey.withOpacity(0.5),
                      margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                    ),
                    new Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your email',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              // Spaceを設ける
              SpaceBox.height(16),

              // Passwordのタイトル
              Container(
                margin:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 24.0),
                child: Text(
                  "Password",
                  style: TextStyle(color: Colors.grey, fontSize: 16.0),
                ),
              ),

              // Spaceを設ける
              SpaceBox.height(8),

              // Passwordのフォーム
              Container(
                decoration: BoxDecoration(
                  // backgroundcolorを白に設定
                  color: Colors.white,
                  // Borderで全体を覆う
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.5),
                    width: 1.0,
                  ),
                  // フォームのRadius
                  borderRadius: BorderRadius.circular(8.0),
                ),

                // フォームの周辺からのマージン＝画面の端からのマージン
                margin:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 24.0),

                child: Row(
                  children: <Widget>[
                    new Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                      child: Icon(
                        Icons.lock_open,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      height: 30.0,
                      width: 1.0,
                      color: Colors.grey.withOpacity(0.5),
                      margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                    ),
                    new Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your password',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              // Spaceを設ける
              SpaceBox.height(16),

              // パスワードを忘れた場合
              Container(
                child: Center(
                  child: Text(
                      "Forgot Password?",
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                ),
              ),

              // Spaceを設ける
              SpaceBox.height(16),

              // SignInボタン
              Container(
                // フォームの周辺からのマージン＝画面の端からのマージン
                margin:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 24.0),

                padding: EdgeInsets.only(top: 20),
                child: new MaterialButton(
                  onPressed: (){
                    // 3つめの画面へ遷移する
                    Navigator.of(context).pushReplacementNamed("/home");

                    // フェードのアニメーション
                    /*
                    Navigator.of(context).pushReplacement(
                      _FadeAnimationCustomRoute(
                        settings: RouteSettings(name: "/home"),
                        builder: (BuildContext context) => Home(),
                      ),
                    );
                    */
                  },
                  child: Text('Sign In',
                    style: TextStyle(
                      fontSize: 16,
                      /*fontFamily: 'SFUIDisplay',*/
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  color: Color(0xff6d69a4),
                  elevation: 0,
                  minWidth: 400,
                  height: 50,
                  textColor: Colors.white,

                  // borderRadiusの設定
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                  ),

                ),
              ),

              // Spaceを設ける
              SpaceBox.height(32),

              // 既にアカウントを持っている場合
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    Text(
                      "Don't Have an Account?  ",
                      style: TextStyle(color: Colors.grey, fontSize: 14.0),
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.black, fontSize: 14.0),
                    ),
                  ],
                ),
              ),

              // Spaceを設ける
              SpaceBox.height(40),

            ],
          ),
        ),
      ),
    );
  }
}


// ---------
// ホーム画面
// ---------
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // バックグラウンドカラーの設定
      /*backgroundColor: Color(0xffF5F9FC),*/
      backgroundColor: Color(0xfff5f5f5),

      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[

            // Spaceを設ける
            SpaceBox.height(88),

            // タイトルの文字
            Container(
              margin:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 24.0),

              child: Text(
                "My Policies",
                style: TextStyle(color: Color(0xff000000), fontSize: 28.0, fontWeight: FontWeight.bold),
              ),
            ),

            // Spaceを設ける
            SpaceBox.height(16),

            // 契約証券
            Container(
              color: Colors.white,

              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),

                child: Column(
                  children: <Widget>[
                    // 自動車保険契約
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),

                      // アイコン
                      leading: Container(
                        margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                        /*padding: EdgeInsets.only(right: 0.0),*/
                        /*padding: EdgeInsets.only(left: 8.0),*/
                        /*
                        decoration: new BoxDecoration(
                            color: Colors.green,
                        ),
                        */
                        child: Icon(Icons.directions_car, color: Colors.black, size: 40.0),
                      ),

                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: <Widget>[
                              Text(
                                "Automotive",
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Nippon Hoken",
                                style: TextStyle(color: Colors.black, fontSize: 14.0,),
                              ),
                            ],
                          ),
                          Text(
                            "\$42.0 / mo",
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                      /*
                      subtitle: Row(
                        children: <Widget>[
                          Icon(Icons.linear_scale, color: Colors.yellowAccent),
                          Text("\$56.23 / mo", style: TextStyle(color: Colors.black))
                        ],
                      ),
                      */

                      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30.0),

                      onTap: () {
                        Navigator.of(context).pushNamed("/detail");
                      },
                    ),

                    Divider(),

                    // 自転車保険契約
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),

                      // アイコン
                      leading: Container(
                        margin:
                        const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                        /*padding: EdgeInsets.only(right: 0.0),*/
                        /*padding: EdgeInsets.only(left: 8.0),*/
                        /*
                        decoration: new BoxDecoration(
                            color: Colors.green,
                        ),
                        */
                        child: Icon(Icons.directions_bike, color: Colors.black, size: 40.0),
                      ),

                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: <Widget>[
                              Text(
                                "Bike",
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Nippon Hoken",
                                style: TextStyle(color: Colors.black, fontSize: 14.0,),
                              ),
                            ],
                          ),
                          Text(
                            "\$2.5 / mo",
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                      /*
                      subtitle: Row(
                        children: <Widget>[
                          Icon(Icons.linear_scale, color: Colors.yellowAccent),
                          Text("\$56.23 / mo", style: TextStyle(color: Colors.black))
                        ],
                      ),
                      */

                      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30.0),

                      onTap: () {
                        Navigator.of(context).pushNamed("/detail");
                      },
                    ),

                    /*Divider(),*/

                  ],
                ),
              ),
            ),

            // Spaceを設ける
            SpaceBox.height(80),

          ],
      ),
    );
  }
}


// -----------
// 契約詳細画面
// -----------
class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // バックグラウンドカラーの設定
      backgroundColor: Color(0xfff5f5f5),

      appBar: new AppBar(
        title: const Text("Automotive"),
        elevation: 0.0,
        backgroundColor: Color(0xff6d69a4),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // PolicyDetail
            PolicyDetail(),

            // Coverage
            Coverage(),
          ],
        ),
      ),

    );
  }
}


// ----------------
// 契約詳細の契約概要
// ----------------
class PolicyDetail extends StatelessWidget {
  const PolicyDetail({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        // Spaceを設ける
        SpaceBox.height(8),

        // 補償内容の中身
        Container(
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),

          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[
                // Premium
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: <Widget>[
                      Text(
                        "Premium",
                        style: H1TextStyle(),
                        /*style: TextStyle(color: Colors.black, fontSize: 16.0,),*/
                      ),

                      // Spaceを設ける
                      SpaceBox.height(4),

                      Text(
                        "\$42.0 / mo",
                        style: H3TextStyle(),
                      ),
                    ],
                  ),
                ),

                Divider(),

                // Policy Period
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: <Widget>[
                      Text(
                        "Policy Period",
                        style: H1TextStyle(),
                        /*style: TextStyle(color: Colors.black, fontSize: 16.0,),*/
                      ),

                      // Spaceを設ける
                      SpaceBox.height(4),

                      Text(
                        "From : Apr 06 2020",
                        style: H3TextStyle(),
                      ),
                      Text(
                        "To : Oct 06 2020",
                        style: H3TextStyle(),
                      ),
                    ],
                  ),
                ),

                Divider(),

                // What's Covered
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: <Widget>[
                      Text(
                        "What's covered",
                        style: H1TextStyle(),
                        /*style: TextStyle(color: Colors.black, fontSize: 16.0,),*/
                      ),

                      // Spaceを設ける
                      SpaceBox.height(4),

                      Center(
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 136.0,
                                height: 100,
                                // ロゴの画像
                                child: Image.asset('images/img_UX250h.png'),
                              ),

                              Text(
                                "TOYOTA LEXUS UX250h",
                                style: H3TextStyle(),
                              ),

                            ],
                          )
                      ),


                    ],
                  ),
                ),

                Divider(),

                // Who's Covered
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: <Widget>[
                      Text(
                        "Who's covered",
                        style: H1TextStyle(),
                        /*style: TextStyle(color: Colors.black, fontSize: 16.0,),*/
                      ),

                      // Spaceを設ける
                      SpaceBox.height(16),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              // ロゴの画像
                              Container(
                                width: 80.0,
                                height: 80.0,

                                child: ClipRRect(
                                  borderRadius: new BorderRadius.circular(40.0),
                                  child: Image.asset('images/man_face_1.jpg'),
                                ),
                              ),

                              Text(
                                "Tomi",
                                style: H3TextStyle(),
                              ),

                            ],
                          ),

                          // Spaceを設ける
                          SpaceBox.width(24),

                          Column(
                            children: <Widget>[
                              // ロゴの画像
                              Container(
                                width: 80.0,
                                height: 80.0,

                                child: ClipRRect(
                                  borderRadius: new BorderRadius.circular(40.0),
                                  child: Image.asset('images/man_face_2.jpg'),
                                ),
                              ),

                              Text(
                                "Zone",
                                style: H3TextStyle(),
                              ),

                            ],
                          ),


                        ],
                      ),


                    ],
                  ),
                ),


              ],
            ),
          ),
        ),


      ],
    );
  }
}


// ----------------
// 契約詳細の補償内容
// ----------------
class Coverage extends StatelessWidget {
  const Coverage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        // Spaceを設ける
        SpaceBox.height(24),

        // 補償内容のタイトル
        Container(
          margin:
          const EdgeInsets.symmetric(vertical: 0.0, horizontal: 24.0),

          child: Text(
            "Coverage",
            style: H1TextStyle(),
          ),
        ),

        // Spaceを設ける
        SpaceBox.height(8),

        // 補償内容の中身
        Container(
          color: Colors.white,

          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),

            // 賠償責任保険
            child: Column(
              children: <Widget>[

                // Liability Protection
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: <Widget>[
                      Text(
                        "Liability Protection",
                        style: H1TextStyle(),
                      ),

                      // Bodily Injury
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: <Widget>[
                                Text(
                                  "Bodily Injury",
                                  style: H2TextStyle(),
                                ),
                                Text(
                                  "\$20.2",
                                  style: H2TextStyle(),
                                ),
                              ],
                            ),

                            // 賠償責任のイメージ
                            Center(
                              child: Container(
                                width: 130.0,
                                height: 130.0,
                                child: Image.asset('images/insurance_icon/001-car_accident.png'),
                                /*child: Image.asset('images/logo-color_noname.png'),*/
                              ),
                            ),

                            Text(
                              "\$250,000/person",
                              style: H3TextStyle(),
                            ),

                            // Spaceを設ける
                            SpaceBox.height(4),

                            Text(
                              "\$500,000/accident",
                              style: H3TextStyle(),
                            ),
                          ],
                        ),
                      ),

                      Divider(),

                      // Property Damage
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: <Widget>[
                                Text(
                                  "Property Damage",
                                  style: H2TextStyle(),
                                ),
                                Text(
                                  "\$14.3",
                                  style: H2TextStyle(),
                                ),
                              ],
                            ),

                            // 賠償責任のイメージ
                            Center(
                              child: Container(
                                width: 130.0,
                                height: 130.0,
                                child: Image.asset('images/insurance_icon/012-car_accident.png'),
                              ),
                            ),

                            Text(
                              "\$50,000/accident",
                              style: H3TextStyle(),
                            ),

                            // Spaceを設ける
                            SpaceBox.height(4),

                            Text(
                              "Property damage liability helps cover the cost of repairs if you are at fault for a car accident that damages another vehicle or property such as a fence or building front.",
                              style: H3TextStyle(),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),

                ),

                Divider(),

                // First Party Benefits
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: <Widget>[
                      Text(
                        "Liability Protection",
                        style: H1TextStyle(),
                      ),

                      // Medical Expense
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: <Widget>[
                                Text(
                                  "Medical Expense",
                                  style: H2TextStyle(),
                                ),
                                Text(
                                  "\$7.5",
                                  style: H2TextStyle(),
                                ),
                              ],
                            ),

                            // イメージ
                            Center(
                              child: Container(
                                width: 130.0,
                                height: 130.0,
                                child: Image.asset('images/insurance_icon/027-hospital.png'),
                                /*child: Image.asset('images/logo-color_noname.png'),*/
                              ),
                            ),

                            Text(
                              "\$5,000/accident",
                              style: H3TextStyle(),
                            ),

                          ],
                        ),
                      ),

                    ],
                  ),

                ),

              ],
            ),
          ),
        ),

        // Spaceを設ける
        SpaceBox.height(48),

      ],
    );
  }
}


// テキストスタイル H1
class H1TextStyle extends TextStyle {
  final Color color;
  final FontWeight fontWeight;
  final double size;
  final String fontFamily;

  const H1TextStyle({
    this.color = Colors.black,
    this.fontWeight = FontWeight.bold,
    this.size = 20,
    this.fontFamily = 'NotoSansCJK',
  })  : assert(color != null && fontWeight != null),
        super(
        color: color,
        fontWeight: fontWeight,
        fontSize: size,
        fontFamily: fontFamily,
      );
}

// テキストスタイル H2
class H2TextStyle extends TextStyle {
  final Color color;
  final FontWeight fontWeight;
  final double size;
  final String fontFamily;

  const H2TextStyle({
    this.color = Colors.black,
    this.fontWeight = FontWeight.bold,
    this.size = 16,
    this.fontFamily = 'NotoSansCJK',
  })  : assert(color != null && fontWeight != null),
        super(
        color: color,
        fontWeight: fontWeight,
        fontSize: size,
        fontFamily: fontFamily,
      );
}

// テキストスタイル H3
class H3TextStyle extends TextStyle {
  final Color color;
  final FontWeight fontWeight;
  final double size;
  final String fontFamily;

  const H3TextStyle({
    this.color = Colors.grey,
    this.fontWeight = FontWeight.normal,
    this.size = 16,
    this.fontFamily = 'NotoSansCJK',
  })  : assert(color != null && fontWeight != null),
        super(
        color: color,
        fontWeight: fontWeight,
        fontSize: size,
        fontFamily: fontFamily,
      );
}


// ------------------------------
// SpaceをつくるためのカスタムWidget
// ------------------------------
class SpaceBox extends SizedBox {
  SpaceBox({double width = 8, double height = 8})
      : super(width: width, height: height);

  SpaceBox.width([double value = 8]) : super(width: value);
  SpaceBox.height([double value = 8]) : super(height: value);
}


// -------------------------
// 画面遷移のFadeアニメーション
// -------------------------
class _FadeAnimationCustomRoute<T> extends MaterialPageRoute<T> {
  _FadeAnimationCustomRoute(
      {WidgetBuilder builder, RouteSettings settings, bool fullscreenDialog = false})
      : super(
      builder: builder,
      settings: settings,
      fullscreenDialog: fullscreenDialog);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    return FadeTransition(opacity: animation, child: child);
  }
}