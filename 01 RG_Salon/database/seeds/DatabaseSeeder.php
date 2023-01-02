<?php

use App\Models\Area;
use App\Models\City;
use App\Models\Product;
use App\Models\Region;
use App\Models\Review;
use App\User;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // $this->call(UsersTableSeeder::class);
        // factory(Region::class, 20)->create();
        // factory(City::class, 35)->create();
        // factory(Area::class, 60)->create();
        factory(Review::class, 20)->create();
    }
}
