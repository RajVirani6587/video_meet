import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:sizer/sizer.dart';

class Terms_Screen extends StatefulWidget {
  const Terms_Screen({Key? key}) : super(key: key);

  @override
  State<Terms_Screen> createState() => _Terms_ScreenState();
}

class _Terms_ScreenState extends State<Terms_Screen> {
  bool value = false;
  bool value1 = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          leading: Container(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 6.h,
                  width: 6.h,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.pink),
                  child: ClipRRect(borderRadius: BorderRadius.circular(10.sp),),
                ),
                Icon(Icons.edit_note,size: 40,),
              ],
            ),
          ),
          title: Text("Terms of use",style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold),),
        ),
        body: Column(
          children: [
            SizedBox(height: 1.h,),
            Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                  height:65.h,
                  width: 95.w,

                  child: const SelectableText(
                      """Here there’s no place for: 
                                         
Harassment 

Don't publish or send messages, videos or photos with damaging, threatening, misleading, defamatory, rancorous, aggressive, racist, vulgar, denigrating, indecent, insulting, violent, obscene or pornographic content.
Spam 
Don't spam, don't try to recruit votes, don't send unsolicited commercials or chain letters and don't flood or write excessively long texts.
Illegal activities 

Don't share content for which you don't hold the necessary ownership rights. You are solely responsible for the content you publish and share. This app cannot be held liable if you share content for which you don't hold the rights.

Don't post racist, sexist or hateful remarks, videos or photos. We feel bad for you if you feel the need to do this in your life and this app is definitely not the place to do it.

Don't try to hack someone else's account. By committing such offences, you risk a prison sentence and/or monetary fine.

Don't offer prostitution or escort services.

Do not engage in child pornography. Don’t do this anywhere else either.

Failure to follow these guidelines will result either in a warning or blocking from the platform. Please be aware that we are not obliged to warn you before we do this. In case of serious breaches or if we notice you're under the age of 18, we will immediately block you from the site without leaving you an option to get your account back.
These guidelines are meant to keep this platform safe place for everyone. If you don't agree with them, please join another platform. And maybe do some soul-searching.

1. Please respect other users. While using our app, It is forbidden to: 

Use profanity of any kind, behave in an anappropriate manner, and offend other users through either actions or words;
Threaten other users in any way
No flirting
No pushing to send pics or contact details
No racism, bullying or violence
No sexual/abusive behaviour
No spam

2. Vulgar or adult behaviour in chat is unacceptable.

Users may not Display themselves in chat while naked or wearing underwear only;
Users may not Show their naked torso without also displaying their face;
Users may not Move their webcam below their chest area;
Users may not Display or flash their genitals or other intimate parts of their body;
Users may not Touch their genitals in sexual manner, even through their clothes
Users may not Suggest or ask other users for virtual- or cyber-sex;
Users may not Use words or phrases that may have obscene, vulgar, or sexual context;
Users may not Make gestures or take any actions that might be considered obscene.

3. Users of this app would like to see who they are talking to. Using irrelevant images or pre-recorded videos instead of showing yourself is forbidden:

Do not turn your webcam to face the screen of your computer, mobile phone, tablet, or television;
Do not face your webcam towards still pictures or any irrelevant images;
Do not face your webcam towards any text messages, books, or other forms of written text;
Do not use any webcam emulator or othe software which helps you to broadcast irrelevant images and/or video instead of yourself.

4. All forms of spam are forbidden from the chat. You may not, at any time:

Broadcast or display advertising images or messages;
Request other users to take part in perform any actions on app out side Video Chat app.

5. Should another user violate the Chat Rules in your presence, you may:

Complain about the ations of another user along with an image and message. Based on the evidence, our moderators will make a decision on whether or not to ban the offender. Moderators are available to consider and react to complaints 24 hours a day, 7 days a week, including weekends and holidays;
Should a user receive numerous complaints about the violations of Chat Ruls, system bans are in place to automatically ban offenders. System bans take into account numerous factors to avoids unfair bans or banning users by mistake;
It isessential that if another user violates the Chat Rules or offends you any way the issue is reolved by official complaint only. Do not attempt to resolve the issue by offending the other user in response or violating the Chat Rules your self. If you do, you become violator also and are eligible to get banned.

Please Note: We are continually working hard and putting a high focus on preventing any violation of our Chat Rules and punish users who continue to breach them. However, we cannot be held responsible for the actions of all users and cannot guarantee that all violators will be banned. When you complain and report against violators, you are helping us make this app safer chat environment and helping us to find and remove all violators.
By using our chat service, you accept and agree to the Chat Rules mentioned above. We reserve the right to change or amend these rules from time to time. We will attempt to notify users of such changes, howewer, it is the responsibility of all users on This App to track these changes themselves."""
                 ,style: TextStyle(color: Colors.black), ),

                ),
              ),
            ),
            SizedBox(height: 1.h,),
            Row(
              children: <Widget>[
                Checkbox(
                  side: MaterialStateBorderSide.resolveWith(
                        (states) => BorderSide(width: 2.0, color: Colors.pink),
                  ),
                  checkColor: Colors.white,
                  activeColor: Colors.pink,
                  focusColor: Colors.white,
                  value: this.value,
                  onChanged: (bool? value) {
                    setState(() {
                      this.value = value!;
                    });
                  },
                ),
                SizedBox(
                  width: 10,
                ), //SizedBox
                Flexible(
                  child: Text(
                    'I understand that sharing of inappropriate conntent wil not be tolerated.',
                    style: TextStyle(fontSize: 10.sp,color: Colors.white),
                  ),
                ), //Text
                SizedBox(width: 10.w), //SizedBox//Checkbox
              ], //<Widget>[]
            ),
            SizedBox(height: 1.h,),
            Row(
              children: <Widget>[
                Checkbox(
                  side: MaterialStateBorderSide.resolveWith(
                        (states) => BorderSide(width: 2.0, color: Colors.pink),
                  ),
                  checkColor: Colors.white,
                  activeColor: Colors.pink,
                  focusColor: Colors.white,
                  value: this.value1,
                  onChanged: (bool? value) {
                    setState(() {
                      this.value1 = value!;
                    });
                  },
                ),
                SizedBox(
                  width: 10,
                ), //SizedBox
                Flexible(
                  child: Text(
                    'I Confirm that I\'m 18 years old or above.',
                    style: TextStyle(fontSize: 10.sp,color: Colors.white),
                  ),
                ), //Text
                SizedBox(width: 10.w), //SizedBox//Checkbox
              ], //<Widget>[]
            ),
            SizedBox(height: 1.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    if(this.value == true && this.value1 ==true)
                    {
                      Navigator.pushNamed(context, 'first');
                    }
                  },
                  child: Container(height: 7.h,width: 90.w,
                      decoration: BoxDecoration(color: Colors.white,
                          borderRadius: BorderRadius.circular(20.sp)),
                      child: Center(child: Text('Confirm',style: TextStyle(color: Colors.black,fontSize: 23.sp,fontWeight: FontWeight.bold),))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
