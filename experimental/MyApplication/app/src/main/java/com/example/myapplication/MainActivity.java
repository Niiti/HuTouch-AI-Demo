package com.example.myapplication;

import androidx.annotation.NonNull;
import androidx.appcompat.app.ActionBarDrawerToggle;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.view.GravityCompat;
import androidx.drawerlayout.widget.DrawerLayout;

import android.content.Intent;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.Toast;

import com.google.android.material.navigation.NavigationView;

import com.example.myapplication.Society;
import com.example.myapplication.ApiService;

import java.util.ArrayList;
import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class MainActivity extends AppCompatActivity implements NavigationView.OnNavigationItemSelectedListener{

    private DrawerLayout mDrawerLayout;
    private ActionBarDrawerToggle mToggle;
    private LinearLayout buttonsContainer;
    private EditText searchBar;
    private ApiService apiService;
    private List<Society> allSocieties; // Store all societies for filtering

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mDrawerLayout=findViewById(R.id.drawer);
        mToggle= new ActionBarDrawerToggle(MainActivity.this, mDrawerLayout,R.string.open, R.string.close);
        mDrawerLayout.addDrawerListener(mToggle);
        mToggle.syncState();
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        NavigationView navigationView=findViewById(R.id.navigview);
        navigationView.setNavigationItemSelectedListener(this);

        buttonsContainer = findViewById(R.id.buttons_container);
        searchBar = findViewById(R.id.search_bar);

        // Initialize Retrofit
        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl("https://6803759d-2bfb-4aa4-8ab1-ddc2ace685e8.mock.pstmn.io/")
                .addConverterFactory(GsonConverterFactory.create())
                .build();

        apiService = retrofit.create(ApiService.class);

        // Set up search functionality
        setupSearchBar();

        // Fetch societies from API
        fetchSocieties();
    }

    private void setupSearchBar() {
        searchBar.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
                // Not needed
            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
                // Filter societies as user types
                filterSocieties(s.toString());
            }

            @Override
            public void afterTextChanged(Editable s) {
                // Not needed
            }
        });
    }

    private void filterSocieties(String query) {
        if (allSocieties == null) return;
        
        List<Society> filteredSocieties = new ArrayList<>();
        String lowerCaseQuery = query.toLowerCase().trim();
        
        for (Society society : allSocieties) {
            if (society.getSociety().toLowerCase().contains(lowerCaseQuery)) {
                filteredSocieties.add(society);
            }
        }
        
        createSocietyButtons(filteredSocieties);
    }

    private void fetchSocieties() {
        Call<List<Society>> call = apiService.getSocieties();
        call.enqueue(new Callback<List<Society>>() {
            @Override
            public void onResponse(Call<List<Society>> call, Response<List<Society>> response) {
                if (response.isSuccessful() && response.body() != null) {
                    allSocieties = response.body(); // Store all societies
                    createSocietyButtons(allSocieties);
                } else {
                    Toast.makeText(MainActivity.this, "Failed to load societies", Toast.LENGTH_SHORT).show();
                }
            }

            @Override
            public void onFailure(Call<List<Society>> call, Throwable t) {
                Toast.makeText(MainActivity.this, "Network error: " + t.getMessage(), Toast.LENGTH_SHORT).show();
            }
        });
    }

    private void createSocietyButtons(List<Society> societies) {
        buttonsContainer.removeAllViews();
        
        for (int i = 0; i < societies.size(); i += 2) {
            LinearLayout rowLayout = new LinearLayout(this);
            rowLayout.setLayoutParams(new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT,
                    LinearLayout.LayoutParams.WRAP_CONTENT));
            rowLayout.setOrientation(LinearLayout.HORIZONTAL);

            // Create first button in the row
            Society society1 = societies.get(i);
            Button button1 = createSocietyButton(society1);
            rowLayout.addView(button1);

            // Create second button in the row if available
            if (i + 1 < societies.size()) {
                Society society2 = societies.get(i + 1);
                Button button2 = createSocietyButton(society2);
                rowLayout.addView(button2);
            }

            buttonsContainer.addView(rowLayout);
        }
    }

    private Button createSocietyButton(Society society) {
        Button button = new Button(this);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                0,
                LinearLayout.LayoutParams.WRAP_CONTENT,
                0.5f);
        params.setMargins(8, 30, 8, 8);
        button.setLayoutParams(params);
        button.setHeight(170);
        button.setBackground(getDrawable(R.drawable.buttonshape));
        button.setGravity(android.view.Gravity.CENTER);
        button.setText(society.getSociety().toUpperCase());
        button.setTag(society.getId());
        
        // Add more vertical padding to the button text
        button.setPadding(button.getPaddingLeft(), 20, button.getPaddingRight(), 20);

        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, tech.class);
                intent.putExtra("value", society.getId());
                startActivity(intent);
            }
        });

        return button;
    }

    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        if(mToggle.onOptionsItemSelected(item))
        {
            return  true;
        }
        else
        {
            return super.onOptionsItemSelected(item);
        }
    }

    @Override
    public boolean onNavigationItemSelected(@NonNull MenuItem menuItem) {
        int id = menuItem.getItemId();

        if (id == R.id.home) {
            getSupportFragmentManager()
                    .beginTransaction()
                    .replace(R.id.fragment_container, new SocietyFragment())
                    .commit();
            Toast.makeText(this, "Welcome To Society Page", Toast.LENGTH_SHORT).show();
        } else if (id == R.id.setting) {
            Toast.makeText(this, "Events Page", Toast.LENGTH_SHORT).show();
            Intent i = new Intent(MainActivity.this, Events.class);
            startActivity(i);
        } else if (id == R.id.logout) {
            Toast.makeText(this, "About Us!!", Toast.LENGTH_SHORT).show();
            getSupportFragmentManager()
                    .beginTransaction()
                    .replace(R.id.fragment_container, new aboutus())
                    .commit();
        }

        mDrawerLayout.closeDrawer(GravityCompat.START);
        return true;
    }

    @Override
    public void onBackPressed() {
        if (mDrawerLayout.isDrawerOpen(GravityCompat.START)) {
            mDrawerLayout.closeDrawer(GravityCompat.START);
        } else {
            super.onBackPressed();
        }
    }
}
