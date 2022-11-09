package com.donggu.part2_3;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.Button;
import android.widget.LinearLayout;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        LinearLayout linearLayout = new LinearLayout(this);

        Button button = new Button(this);
        button.setText("Button 1");
        linearLayout.addView(button);

        Button button2 = new Button(this);
        button2.setText("Button 2");
        linearLayout.addView(button2);

        setContentView(linearLayout);

//        setContentView(R.layout.activity_main);
    }
}