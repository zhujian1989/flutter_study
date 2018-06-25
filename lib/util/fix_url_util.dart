//苹果不支持http的网页浏览，这个修改只针对本api，让服务器都改成https才是最终解决方案
class FixUrlUtil {
  static getFixUrl(String url) {
    String fixUrl = url;

    if (url.startsWith('http')) {
      fixUrl = url.replaceAll('http', 'https');
    }

    return fixUrl;
  }
}
