package com.donggu.part4_10;

import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import android.widget.Toast;

import androidx.activity.result.ActivityResult;
import androidx.activity.result.ActivityResultCallback;
import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.contract.ActivityResultContracts;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.DividerItemDecoration;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.donggu.part4_10.databinding.ActivityMainBinding;
import com.donggu.part4_10.databinding.ItemMainBinding;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {
    ArrayList<String> datas;
    ActivityResultLauncher<Intent> resultLauncher;
    String category;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        ActivityMainBinding binding = ActivityMainBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        //add..............................
        resultLauncher = registerForActivityResult(
                new ActivityResultContracts.StartActivityForResult(),
                new ActivityResultCallback<ActivityResult>(){
                    @Override
                    public void onActivityResult(ActivityResult result) {
                        Intent intent = result.getData();
                        String txt = category + " " +intent.getStringExtra("result");
                        Toast.makeText(MainActivity.this, txt, Toast.LENGTH_SHORT).show();
                    }
                }
        );

        DBHelper helper=new DBHelper(this);
        SQLiteDatabase db=helper.getWritableDatabase();
        Cursor cursor=db.rawQuery("select location from tb_data where category='0'", null);

        datas=new ArrayList<>();
        while (cursor.moveToNext()){
            datas.add(cursor.getString(0));
        }
        db.close();

        binding.mainRecyclerView.setLayoutManager(new LinearLayoutManager(this));
        binding.mainRecyclerView.addItemDecoration(new DividerItemDecoration(this, new LinearLayoutManager(this).getOrientation()));
        binding.mainRecyclerView.setAdapter(new MyMainAdapter(datas));
    }

    private class MyMainAdapter extends RecyclerView.Adapter<MyMainViewHolder> {
        private List<String> list;

        public MyMainAdapter(List<String> list) {
            this.list = list;
        }

        @Override
        public MyMainViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
            ItemMainBinding binding = ItemMainBinding.inflate(LayoutInflater.from(viewGroup.getContext()), viewGroup, false);
            return new MyMainViewHolder(binding);
        }

        @Override
        public void onBindViewHolder(MyMainViewHolder viewHolder, int position) {
            String text = list.get(position);
            viewHolder.binding.itemMainView.setText(text);
        }

        @Override
        public int getItemCount() {
            return list.size();
        }
    }

    private class MyMainViewHolder extends RecyclerView.ViewHolder {
        ItemMainBinding binding;

        public MyMainViewHolder(ItemMainBinding binding) {
            super(binding.getRoot());
            this.binding = binding;
            //add..............................
            binding.getRoot().setOnClickListener(view -> {
                category = binding.itemMainView.getText().toString();
                Intent intent = new Intent(MainActivity.this, DetailActivity.class);
                intent.putExtra("category", category);
                resultLauncher.launch(intent);
            });
        }
    }
}