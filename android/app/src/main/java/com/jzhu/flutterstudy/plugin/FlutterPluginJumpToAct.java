package com.jzhu.flutterstudy.plugin;

import android.app.Activity;
import android.content.Intent;
import com.jzhu.flutterstudy.OneActivity;
import com.jzhu.flutterstudy.TwoActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

public class FlutterPluginJumpToAct implements MethodChannel.MethodCallHandler {

    public static String CHANNEL = "com.jzhu.jump/plugin";

    static MethodChannel channel;

    private Activity activity;

    private FlutterPluginJumpToAct(Activity activity) {
        this.activity = activity;
    }

    public static void registerWith(PluginRegistry.Registrar registrar) {
        channel = new MethodChannel(registrar.messenger(), CHANNEL);
        FlutterPluginJumpToAct instance = new FlutterPluginJumpToAct(registrar.activity());
        //setMethodCallHandler在此通道上接收方法调用的回调
        channel.setMethodCallHandler(instance);
    }

    @Override
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {

        //通过MethodCall可以获取参数和方法名，然后再寻找对应的平台业务，本案例做了2个跳转的业务

        //接收来自flutter的指令oneAct
        if (call.method.equals("oneAct")) {

            //跳转到指定Activity
            Intent intent = new Intent(activity, OneActivity.class);
            activity.startActivity(intent);

            //返回给flutter的参数
            result.success("success");
        }
        //接收来自flutter的指令twoAct
        else if (call.method.equals("twoAct")) {

            //解析参数
            String text = call.argument("flutter");

            //带参数跳转到指定Activity
            Intent intent = new Intent(activity, TwoActivity.class);
            intent.putExtra(TwoActivity.VALUE, text);
            activity.startActivity(intent);

            //返回给flutter的参数
            result.success("success");
        }
        else {
            result.notImplemented();
        }
    }

}
