
class TimeUtils{
  static const double MILLIS_LIMIT = 1000.0;

  static const double SECONDS_LIMIT = 60 * MILLIS_LIMIT;

  static const double MINUTES_LIMIT = 60 * SECONDS_LIMIT;

  static const double HOURS_LIMIT = 24 * MINUTES_LIMIT;

  static const double DAYS_LIMIT = 2 * HOURS_LIMIT;
  /**
   * 将时间字符串转为时间戳
   * <p>time 格式为 format</p>
   *
   * @param time   时间字符串
   * @param format 时间格式
   * @return 毫秒时间戳
   */
  static int string2Millis(String time) {
    return DateTime.parse(time).millisecondsSinceEpoch;
  }

  /**
   * 获取友好型与当前时间的差
   * <p>time 格式为 format</p>
   *
   * @param time   时间字符串
   * @param format 时间格式
   * @return 友好型与当前时间的差
   * <ul>
   * <li>如果小于 1 秒钟内，显示刚刚</li>
   * <li>如果在 1 分钟内，显示 XXX秒前</li>
   * <li>如果在 1 小时内，显示 XXX分钟前</li>
   * <li>如果在 1 小时外的今天内，显示今天15:32</li>
   * <li>如果是昨天的，显示昨天15:32</li>
   * <li>其余显示，2016-10-15</li>
   * <li>时间不合法的情况全部日期和时间信息，如星期六 十月 27 14:21:20 CST 2007</li>
   * </ul>
   */
  static String getFriendlyTimeSpanByNowString(String time) {
    return getFriendlyTimeSpanByNow(string2Millis(time));
  }

  /**
   * 获取友好型与当前时间的差
   *
   * @param millis 毫秒时间戳
   * @return 友好型与当前时间的差
   * <ul>
   * <li>如果小于 1 秒钟内，显示刚刚</li>
   * <li>如果在 1 分钟内，显示 XXX秒前</li>
   * <li>如果在 1 小时内，显示 XXX分钟前</li>
   * <li>如果在 1 小时外的今天内，显示今天15:32</li>
   * <li>如果是昨天的，显示昨天15:32</li>
   * <li>其余显示，2016-10-15</li>
   * <li>时间不合法的情况全部日期和时间信息，如星期六 十月 27 14:21:20 CST 2007</li>
   * </ul>
   */
  static String getFriendlyTimeSpanByNow(final int millis) {
    int now = DateTime.now().millisecondsSinceEpoch;
    int span = now - millis;
    if(span<0){
      return "未知";
    }
    if (span < MILLIS_LIMIT) {
      return "刚刚";
    } else if (span < SECONDS_LIMIT) {
      return (span / MILLIS_LIMIT).round().toString() + " 秒前";
    } else if (span < MINUTES_LIMIT) {
      return (span / SECONDS_LIMIT).round().toString() + " 分钟前";
    } else if (span < HOURS_LIMIT) {
      return (span / MINUTES_LIMIT).round().toString() + " 小时前";
    } else if (span < DAYS_LIMIT) {
      return (span / HOURS_LIMIT).round().toString() + " 天前";
    } else {
      return getDateStr(DateTime.fromMillisecondsSinceEpoch(millis));
    }
  }

  static String getDateStr(DateTime date) {
    if (date == null || date.toString() == null) {
      return "";
    } else if (date.toString().length < 10) {
      return date.toString();
    }
    return date.toString().substring(0, 10);
  }
}