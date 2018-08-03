package com.jzhu.flutterstudy.plugin;

import android.Manifest;
import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.provider.Settings;
import com.tbruyelle.rxpermissions2.RxPermissions;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;
import io.reactivex.functions.Consumer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class FlutterPluginPermissions implements MethodChannel.MethodCallHandler {

    public static String CHANNEL = "com.jzhu.permisstions/plugin";

    static MethodChannel channel;

    private Activity activity;

    private HashMap<String, String> permissionsMap = new HashMap<>();

    private RxPermissions rxPermissions;

    private FlutterPluginPermissions(Activity activity) {
        this.activity = activity;
        rxPermissions = new RxPermissions(activity);
        initPermissions();
    }

    public static void registerWith(PluginRegistry.Registrar registrar) {
        channel = new MethodChannel(registrar.messenger(), CHANNEL);
        FlutterPluginPermissions instance = new FlutterPluginPermissions(registrar.activity());
        channel.setMethodCallHandler(instance);
    }

    @Override
    public void onMethodCall(MethodCall call, final MethodChannel.Result result) {

        if (call.method.equals("askPermissions")) {

            List<String> list = (List<String>) call.arguments;

            List<String> permissionslist = new ArrayList<>();

            for (String per : list) {
                permissionslist.add(permissionsMap.get(per));
            }

            String[] permissions = new String[list.size()];

            permissionslist.toArray(permissions);

            rxPermissions
                    .request(permissions)
                    .subscribe(new Consumer<Boolean>() {
                        @Override
                        public void accept(Boolean aBoolean) throws Exception {
                            result.success(aBoolean);
                        }
                    });

        }else if(call.method.equals("openSetting")){
            openSettings();
        }
        else {
            result.notImplemented();
        }
    }

    private void openSettings() {
        Intent intent = new Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS,
                                   Uri.parse("package:" + activity.getPackageName()));
        intent.addCategory(Intent.CATEGORY_DEFAULT);
        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        activity.startActivity(intent);
    }


    /**
     * 权限
     */

    private void initPermissions() {
        permissionsMap.put("ACCESS_COARSE_LOCATION", Manifest.permission.ACCESS_COARSE_LOCATION);
        permissionsMap.put("ACCESS_FINE_LOCATION", Manifest.permission.ACCESS_FINE_LOCATION);
        permissionsMap.put("ACCESS_NETWORK_STATE", Manifest.permission.ACCESS_NETWORK_STATE);
        permissionsMap.put("Permissions.ACCESS_WIFI_STATE", Manifest.permission.ACCESS_WIFI_STATE);
        permissionsMap.put("CHANGE_WIFI_STATE", Manifest.permission.CHANGE_WIFI_STATE);
        permissionsMap.put("INTERNET", Manifest.permission.INTERNET);
        permissionsMap.put("READ_PHONE_STATE", Manifest.permission.READ_PHONE_STATE);
        permissionsMap.put("WRITE_EXTERNAL_STORAGE", Manifest.permission.WRITE_EXTERNAL_STORAGE);
        permissionsMap.put("ACCESS_LOCATION_EXTRA_COMMANDS", Manifest.permission.ACCESS_LOCATION_EXTRA_COMMANDS);
        permissionsMap.put("BLUETOOTH", Manifest.permission.BLUETOOTH);
        permissionsMap.put("BLUETOOTH_ADMIN", Manifest.permission.BLUETOOTH_ADMIN);
    }

}
