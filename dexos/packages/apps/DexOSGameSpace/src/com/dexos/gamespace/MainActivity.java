package com.dexos.gamespace;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.provider.Settings;
import android.widget.TextView;

public class MainActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        TextView openGames = findViewById(R.id.open_games);
        TextView enableBoost = findViewById(R.id.enable_boost);

        openGames.setOnClickListener(v -> {
            Intent intent = new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_APP_GAME);
            intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            startActivity(intent);
        });

        enableBoost.setOnClickListener(v ->
                Settings.System.putInt(getContentResolver(), "dexos_game_mode", 1));
    }
}
