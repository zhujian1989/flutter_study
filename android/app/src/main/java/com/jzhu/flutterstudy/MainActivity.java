package com.jzhu.flutterstudy;

import android.content.Intent;
import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    jump();
    GeneratedPluginRegistrant.registerWith(this);
  }

  public void jump(){
      String CHANNEL = "com.jzhu.jumpPlugin";
      // 自定义插件
      new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(new MethodChannel.MethodCallHandler() {
          @Override
          public void onMethodCall(MethodCall call, MethodChannel.Result result) {
              if (call.method.equals("goAndroidActivity")) {
                  Intent intent = new Intent(MainActivity.this, AndroidActivity.class);
                  MainActivity.this.startActivity(intent);
                  result.success("success");
              } else {
                  result.notImplemented();
              }
          }
      });
  }

}




