package com.donggu.part4_10;

import android.app.Activity;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.ViewGroup;


import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.DividerItemDecoration;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.donggu.part4_10.databinding.ActivityDetailBinding;
import com.donggu.part4_10.databinding.ItemDetailBinding;

import java.util.ArrayList;
import java.util.List;

public class DetailActivity extends AppCompatActivity {
    ArrayList<String> datas;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        ActivityDetailBinding binding = ActivityDetailBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());

        Intent intent=getIntent();
        String category=intent.getStringExtra("category");

        DBHelper helper=new DBHelper(this);
        SQLiteDatabase db=helper.getWritableDatabase();
        Cursor cursor=db.rawQuery("select location from tb_data where category=?", new String[]{category});
        datas=new ArrayList<>();
        while (cursor.moveToNext()){
            datas.add(cursor.getString(0));
        }
        db.close();

        binding.detailRecyclerView.setLayoutManager(new LinearLayoutManager(this));
        binding.detailRecyclerView.addItemDecoration(new DividerItemDecoration(this, new LinearLayoutManager(this).getOrientation()));
        binding.detailRecyclerView.setAdapter(new MySubAdapter(datas));
    }
    private class MySubAdapter extends RecyclerView.Adapter<MySubViewHolder> {
        private List<String> list;

        public MySubAdapter(List<String> list) {
            this.list = list;
        }

        @Override
        public MySubViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
            ItemDetailBinding binding = ItemDetailBinding.inflate(LayoutInflater.from(viewGroup.getContext()), viewGroup, false);
            return new MySubViewHolder(binding);
        }

        @Override
        public void onBindViewHolder(MySubViewHolder viewHolder, int position) {
            String text = list.get(position);
            viewHolder.binding.itemDetailView.setText(text);
        }

        @Override
        public int getItemCount() {
            return list.size();
        }
    }

    private class MySubViewHolder extends RecyclerView.ViewHolder {
        ItemDetailBinding binding;

        public MySubViewHolder(ItemDetailBinding binding) {
            super(binding.getRoot());
            this.binding = binding;
            ////add..............................
            binding.getRoot().setOnClickListener(view -> {
                Intent intent = getIntent();
                intent.putExtra("result", binding.itemDetailView.getText().toString());
                setResult(Activity.RESULT_OK, intent);
                finish();
            });
        }
    }

}