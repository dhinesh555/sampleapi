package com.example.blogview.Adapter;

import android.view.View;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import

public abstract class BaseViewHolder extends RecyclerView.ViewHolder {

    abstract  void setData(TimeLineItem item);

    public BaseViewHolder(@NonNull View itemView) {
        super( itemView );
    }
}
