package com.jzhu.flutterstudy;

import android.os.Bundle;
import com.jzhu.flutterstudy.plugin.FlutterPluginAMap;
import com.jzhu.flutterstudy.plugin.FlutterPluginCounter;
import com.jzhu.flutterstudy.plugin.FlutterPluginJumpToAct;
import com.jzhu.flutterstudy.plugin.FlutterPluginPermissions;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        GeneratedPluginRegistrant.registerWith(this);
        registerCustomPlugin(this);
    }

    private static void registerCustomPlugin(PluginRegistry registrar) {

        FlutterPluginJumpToAct.registerWith(registrar.registrarFor(FlutterPluginJumpToAct.CHANNEL));

        FlutterPluginCounter.registerWith(registrar.registrarFor(FlutterPluginCounter.CHANNEL));

        FlutterPluginPermissions.registerWith(registrar.registrarFor(FlutterPluginPermissions.CHANNEL));

        FlutterPluginAMap.registerWithEventChannel(registrar.registrarFor(FlutterPluginAMap.EVENT_CHANNEL));

        FlutterPluginAMap.registerWithMethodChannel(registrar.registrarFor(FlutterPluginAMap.METHOD_CHANNEL));

    }




}




