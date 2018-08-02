package com.jzhu.flutterstudy;

import android.app.Activity;
import android.os.Bundle;
import android.widget.TextView;

public class TwoActivity extends Activity{

    private TextView mTextView;

    public static final String VALUE = "value";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_two);

        mTextView = findViewById(R.id.text);

        String text = getIntent().getStringExtra(VALUE);

        mTextView.setText(text);

    }

}
