package com.jzhu.flutterstudy.plugin;

import android.app.Activity;
import android.util.Log;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.StringCodec;
import io.reactivex.Observable;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;

import java.util.concurrent.TimeUnit;

public class FlutterPluginCounter implements EventChannel.StreamHandler {

    public static String CHANNEL = "com.jzhu.counter/plugin";

    static EventChannel channel;

    private Activity activity;

//    static BasicMessageChannel basicMessageChannel;

    private FlutterPluginCounter(Activity activity) {
        this.activity = activity;
    }

    public static void registerWith(PluginRegistry.Registrar registrar) {
        channel = new EventChannel(registrar.messenger(), CHANNEL);
        FlutterPluginCounter instance = new FlutterPluginCounter(registrar.activity());
        channel.setStreamHandler(instance);
       // basicMessageChannel = new BasicMessageChannel<String> ("foo", StringCodec.INSTANCE);
    }

    @Override
    public void onListen(Object o, final EventChannel.EventSink eventSink) {

        Observable.interval(1000, TimeUnit.MILLISECONDS).subscribe(new Observer<Long>() {
            @Override
            public void onSubscribe(Disposable d) {

            }

            @Override
            public void onNext(Long aLong) {
                eventSink.success(aLong.intValue());
            }

            @Override
            public void onError(Throwable e) {
                eventSink.error("计时器异常", "异常", e.getMessage());
            }

            @Override
            public void onComplete() {
            }
        });

    }

    @Override
    public void onCancel(Object o) {
        Log.i("FlutterPluginCounter", "FlutterPluginCounter:onCancel");
    }

}
