package com.dexos.gamespace;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.provider.Settings;
import android.widget.LinearLayout;
import android.widget.TextView;

public class MainActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(48, 48, 48, 48);

        TextView title = new TextView(this);
        title.setText("DexOS Game Space");
        title.setTextSize(24f);

        TextView hint = new TextView(this);
        hint.setText("Tap to open installed games from launcher list.");
        hint.setOnClickListener(v -> startActivity(new Intent(Intent.ACTION_MAIN)
                .addCategory(Intent.CATEGORY_APP_GAME)));

        TextView perf = new TextView(this);
        perf.setText("Enable high-performance mode");
        perf.setOnClickListener(v -> Settings.System.putInt(getContentResolver(), "dexos_game_mode", 1));

        root.addView(title);
        root.addView(hint);
        root.addView(perf);
        setContentView(root);
    }
}
