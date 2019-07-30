import 'package:common_utils/common_utils.dart';
class DateFormatUtil {
  static String formatDate(DateTime dateTime) {
    print(dateTime);
    return TimelineUtil.formatByDateTime(dateTime, locale: 'zh').toString();
  }

  static String formatDays(DateTime dateTime) {
    String dateNow = DateUtil.formatDate(DateTime.now(), format: 'yyyy:MM:dd:HH:mm:ss');
    String dateTarget = DateUtil.formatDate(dateTime, format: 'yyyy:MM:dd:HH:mm:ss');
    var dateNows = dateNow.split(":");
    var dateTargets = dateTarget.split(":");
    int yearNum = int.parse(dateNows[0])- int.parse(dateTargets[0]) -1;
    int monthNum = int.parse(dateNows[1]) - int.parse(dateTargets[1]) -1;
    int dayNum = int.parse(dateNows[2]) - int.parse(dateTargets[2]) -1;
    int hourNum = int.parse(dateNows[3]) - int.parse(dateTargets[3]) -1;
    int minNum = int.parse(dateNows[4]) - int.parse(dateTargets[4])-1;
    int secondNum = int.parse(dateNows[5]) - int.parse(dateTargets[5])-1;
    var sb = StringBuffer();
    if (yearNum > 0) {
      sb.write(yearNum);
      sb.write("年 ");
    }
    if (monthNum > 0) {
      sb.write(monthNum);
      sb.write("月 ");
    }
    if (dayNum > 0) {
      sb.write(dayNum);
      sb.write("天 ");
    }
    if (hourNum > 0) {
      sb.write(hourNum);
      sb.write("小时 ");
    }
    if (minNum > 0) {
      sb.write(minNum);
      sb.write("分钟 ");
    }
    if (secondNum > 0) {
      sb.write(secondNum);
      sb.write("秒");
    }
    print(sb.toString());

    return sb.toString();
  }
}