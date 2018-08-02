package com.jzhu.flutterstudy.plugin;

import android.app.Activity;
import android.content.Intent;
import com.jzhu.flutterstudy.OneActivity;
import com.jzhu.flutterstudy.TwoActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

public class FlutterPluginJumpToAct implements MethodChannel.MethodCallHandler{

    public static String CHANNEL = "com.jzhu.jumpPlugin";

    static MethodChannel channel;

    private Activity activity;

    private FlutterPluginJumpToAct(Activity activity) {
        this.activity = activity;
    }


    public static void registerWith(PluginRegistry.Registrar registrar) {
        channel = new MethodChannel(registrar.messenger(), CHANNEL);
        FlutterPluginJumpToAct instance = new FlutterPluginJumpToAct(registrar.activity());
        channel.setMethodCallHandler(instance);
    }

    @Override
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {

        // 自定义插件
        if (call.method.equals("oneAct")) {
            Intent intent = new Intent(activity, OneActivity.class);
            activity.startActivity(intent);
            result.success("success");
        }
        if (call.method.equals("twoAct")) {
            String text = call.argument("flutter");
            Intent intent = new Intent(activity, TwoActivity.class);
            intent.putExtra(TwoActivity.VALUE, text);
            activity.startActivity(intent);
            result.success("success");
        }
        else {
            result.notImplemented();
        }
    }

}
