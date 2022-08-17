import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';

import '../firebase/auth.dart';
import '../firebase/firesotre.dart';



class JitsiMeetMethods {

  final AuthMethods _authMethods = AuthMethods();
  final FirestoreMethods _firestoreMethods = FirestoreMethods();


  void createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username = '',
  }) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.tileViewEnabled = true;
      featureFlag.resolution = FeatureFlagVideoResolution
          .LD_RESOLUTION; // Limit video resolution to 360p
      String name;
      if (username.isEmpty){
        name = _authMethods.user.displayName!;
      } else {
        name = username;
      }

      var options = JitsiMeetingOptions(room: roomName)
        ..userDisplayName = name
        ..userAvatarURL = _authMethods.user.photoURL
        ..userEmail = _authMethods.user.email
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;

      _firestoreMethods.addToMeetingHistory(roomName);
      await JitsiMeet.joinMeeting(options);
    } catch (e) {
      print("error: $e");
    }

  }

}