import 'dart:math';
import 'package:flutter/material.dart';
import 'package:zoom_colne_with_jitsi/screens/video_call_creen.dart';
import '../config/jitsi_meet_methods.dart';
import '../witgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({Key? key}) : super(key: key);

  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  createNewMeeting() async {
    String roomName = (Random().nextInt(1000000) + 1000000).toString();
    _jitsiMeetMethods.createMeeting(roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, VideoCallScreen.id);
  }

  @override
  Widget build(BuildContext context) {
   return Column(
     children: [
       Container(
         margin: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
         height: 40,
         child: TextFormField(
           textAlignVertical: TextAlignVertical.bottom,
           obscureText: false,
           decoration: InputDecoration(
             hintText: 'Search',
             hintStyle: const TextStyle(
               fontFamily: 'Outfit',
               color: Colors.white70,
               fontSize: 16,
               fontWeight: FontWeight.normal,
             ),
             enabledBorder: OutlineInputBorder(
               borderSide: const BorderSide(
                 color: Color(0x00000000),
                 width: 1,
               ),
               borderRadius: BorderRadius.circular(8),
             ),
             focusedBorder: OutlineInputBorder(
               borderSide: const BorderSide(
                 color: Color(0x00000000),
                 width: 1,
               ),
               borderRadius: BorderRadius.circular(8),
             ),
             filled: true,
             fillColor: const Color.fromRGBO(65, 63, 63, 1.0),
             prefixIcon: const Icon(
               Icons.search_outlined,
               color: Colors.white70,
             ),
           ),
         ),
       ),
       const SizedBox(
         height: 23,
       ),
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
           HomeMeetingButton(
             onPressed: createNewMeeting,
             text: 'New Meeting',
             color: const Color.fromARGB(255,255, 112, 74),
             icon: Icons.videocam,
           ),
           HomeMeetingButton(
             onPressed: (){
               Navigator.of(context).pushNamed(VideoCallScreen.id);
             },
             text: 'Join Meeting',
             icon: Icons.add_box_rounded,
           ),
           HomeMeetingButton(
             onPressed: () {},
             text: 'Schedule',
             icon: Icons.calendar_today,
           ),
           HomeMeetingButton(
             onPressed: () {},
             text: 'Share Screen',
             icon: Icons.arrow_upward_rounded,
           ),
         ],
       ),
       const Expanded(
         child: Center(
           child: Text(
             'Create/Join Meetings with just a click!',
             style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 15,
                 color: Colors.white70),
           ),
         ),
       ),
     ],
   );
  }
}
