import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:first_app/style/colours.dart';

notification(String title, String body) {
  AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 10,
          channelKey: 'basic_channel',
          title: title,
          body: body,
          wakeUpScreen: true,
          autoDismissible: false,
          backgroundColor: AppColors.lightBr));
}


//  await AwesomeNotifications().createNotification(
//       content: NotificationContent(
//           id: id,
//           channelKey: 'basic_channel',
//           title: 'Emojis are awesome too! '+ Emojis.smille_face_with_tongue + Emojis.smille_rolling_on_the_floor_laughing + Emojis.emotion_red_heart,
//           body: 'Simple body with a bunch of Emojis! ${Emojis.transport_police_car} ${Emojis.animals_dog} ${Emojis.flag_UnitedStates} ${Emojis.person_baby}',
//           bigPicture: 'https://tecnoblog.net/wp-content/uploads/2019/09/emoji.jpg',
//           notificationLayout: NotificationLayout.BigPicture,
//   ));

