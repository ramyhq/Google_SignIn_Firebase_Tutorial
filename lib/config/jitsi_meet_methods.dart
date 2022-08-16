import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';

String username = 'ramy_wahid';
String imageUrl = 'https://lh3.googleusercontent.com/a/AItbvmm0BB-D3syY8ykPYWP6lbOHrFSWZcfHBjG-LEds=s96-c';


class JitsiMeetMethods {

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


      var options = JitsiMeetingOptions(room: roomName)
        ..userDisplayName = username
        ..userAvatarURL = imageUrl
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;

      await JitsiMeet.joinMeeting(options);
    } catch (e) {
      print("error: $e");
    }

  }

}