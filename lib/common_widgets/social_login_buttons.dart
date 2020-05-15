import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final double radius;
  final double yukseklik;
  final Widget buttonIcon;
  final VoidCallback onPressed;

  const SocialLoginButton(
      {Key key,
      @required this.buttonText,
      this.buttonColor,
      this.textColor:Colors.white,
      this.radius:16,
      this.yukseklik:50,
      this.buttonIcon,
      @required this.onPressed})
      :assert(buttonText!=null,onPressed!=null),
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: yukseklik,
        child: RaisedButton(
          onPressed: onPressed,
          color: buttonColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius))),
          child: Row(mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: <Widget>[
              if(buttonIcon!=null)...[
                buttonIcon,
                Text(
                  buttonText,textAlign: TextAlign.center,
                  style: TextStyle(color: textColor),
                ),
                Opacity(opacity: 0,
                    child: buttonIcon)
              ],
              if(buttonIcon==null)...[
                Container(),
                Text(
                  buttonText,textAlign: TextAlign.center,
                  style: TextStyle(color: textColor),
                ),
                Container()
              ]
            ],
          ),
        ),
      ),
    );
  }
}
