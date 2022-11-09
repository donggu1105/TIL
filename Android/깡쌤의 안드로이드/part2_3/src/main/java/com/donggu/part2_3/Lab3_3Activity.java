package com.donggu.part2_3;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class Lab3_3Activity extends AppCompatActivity implements View.OnClickListener {

    Button trueBtn;
    TextView targetTextView;
    Button falseBtn;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_lab33);

        trueBtn = (Button) findViewById(R.id.btn_visible_true);
        targetTextView = (TextView) findViewById(R.id.text_visible_target);
        falseBtn = (Button) findViewById(R.id.btn_visible_false);

        trueBtn.setOnClickListener(this);
        falseBtn.setOnClickListener(this);

    }

    @Override
    public void onClick(View view) {

        if (view == trueBtn) {
            targetTextView.setVisibility(View.VISIBLE);

        } else if (view == falseBtn) {
            targetTextView.setVisibility(View.INVISIBLE);

        }
    }
}