package com.jzhu.flutterstudy.plugin;

import android.app.Activity;
import android.util.Log;
import com.amap.api.location.AMapLocation;
import com.amap.api.location.AMapLocationClient;
import com.amap.api.location.AMapLocationClientOption;
import com.amap.api.location.AMapLocationListener;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.PluginRegistry;

import java.util.HashMap;

public class FlutterPluginAMap implements EventChannel.StreamHandler {

    public static String EVENT_CHANNEL = "com.jzhu.amap.loc/plugin";

    public static String METHOD_CHANNEL = "com.jzhu.amap.fun/plugin";

    private static EventChannel mEventChannel;

    private Activity mActivity;

    private AMapLocationClient mlocationClient;

    private AMapLocationClientOption mLocationOption = null;

    private EventChannel.EventSink mEventSink;

    private HashMap<String, Object> mLocation = new HashMap<>();

    private static FlutterPluginAMap instance;

    private FlutterPluginAMap(Activity activity) {
        this.mActivity = activity;
        initAMap();
    }

    public static void registerWith(PluginRegistry.Registrar registrar) {

        if (null == instance) {
            instance = new FlutterPluginAMap(registrar.activity());
        }

        mEventChannel = new EventChannel(registrar.messenger(), EVENT_CHANNEL);
        mEventChannel.setStreamHandler(instance);

    }


    private void initAMap() {
        mlocationClient = new AMapLocationClient(mActivity);
        mLocationOption = new AMapLocationClientOption();
        mlocationClient.setLocationListener(new AMapLocationListener() {
            @Override
            public void onLocationChanged(AMapLocation aMapLocation) {
                if (aMapLocation != null) {
                    if (aMapLocation.getErrorCode() == 0) {
                        //定位成功回调信息，设置相关消息
//                        aMapLocation.getLocationType();//获取当前定位结果来源，如网络定位结果，详见定位类型表
//                        aMapLocation.getLatitude();//获取纬度
//                        aMapLocation.getLongitude();//获取经度
//                        aMapLocation.getAccuracy();//获取精度信息
//                        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//                        Date date = new Date(aMapLocation.getTime());
//                        df.format(date);//定位时间

                        mLocation.put("province", aMapLocation.getProvince());
                        mLocation.put("city", aMapLocation.getCity());
                        mLocation.put("latitude", aMapLocation.getLatitude());
                        mLocation.put("longitude", aMapLocation.getLongitude());
                        mLocation.put("address", aMapLocation.getAddress());

                        if (null != mEventSink) {
                            mEventSink.success(mLocation);
                        }
                    }
                    else {
                        //显示错误信息ErrCode是错误码，errInfo是错误信息，详见错误码表。
                        Log.e("zj", "location Error, ErrCode:"
                                    + aMapLocation.getErrorCode() + ", errInfo:"
                                    + aMapLocation.getErrorInfo());
                    }
                }
            }
        });
        mLocationOption.setLocationMode(AMapLocationClientOption.AMapLocationMode.Hight_Accuracy);
        mLocationOption.setInterval(10 * 1000);
        mlocationClient.setLocationOption(mLocationOption);
        mlocationClient.startLocation();

    }

    @Override
    public void onListen(Object o, final EventChannel.EventSink eventSink) {

        mEventSink = eventSink;

    }

    @Override
    public void onCancel(Object o) {

    }

}
