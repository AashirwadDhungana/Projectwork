<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Models\Area;
use App\Models\Category;
use App\Models\City;
use App\Models\Product;
use App\Models\Region;
use App\Models\Review;
use App\Models\SubCategory;
use App\User;
use Carbon\Carbon;
use Faker\Generator as Faker;
use Illuminate\Support\Str;

/*
|--------------------------------------------------------------------------
| Model Factories
|--------------------------------------------------------------------------
|
| This directory should contain each of the model factory definitions for
| your application. Factories provide a convenient way to generate new
| model instances for testing / seeding your application's database.
|
*/

// $factory->define(Region::class, function (Faker $faker) {
//     return [
//         'name' => $faker->city,
//     ];
// });
// $factory->define(City::class, function (Faker $faker) {
//     $regions = Region::pluck('id')->toArray();
//     return [
//         'name' => $faker->streetName,
//         'region_id'
//         => $faker->randomElement($regions),
//     ];
// });
// $factory->define(Area::class, function (Faker $faker) {
//     $cities = City::pluck('id')->toArray();
//     return [
//         'name' => $faker->streetAddress,
//         'city_id'
//         => $faker->randomElement($cities),
//     ];
// });

// $factory->define(User::class, function (Faker $faker) {
//     return [
//         'name' => $faker->name,
//         'email' => $faker->unique()->safeEmail,
//         'email_verified_at' => now(),
//         'password' => bcrypt('rudim123'),
//         'phone' => $faker->numberBetween($min = 1111111111, $max = 9999999999),
//         'area_id' => $faker->randomElement(Area::pluck('id')->toArray()),

//     ];
// });

// $factory->define(Product::class, function (Faker $faker) {
//     return [
//         'title' => $faker->sentence(2),
//         'slug' => $faker->sentence(2),
//         'product_code' => $faker->sentence(2),
//         'description' => $faker->sentence(100),
//         'featured_image' => 'products/2nXYpWM6FmTbMQUx9ke56QSztg4OClVMpAm9Lnoj.png',
//         'expiry_time' => $faker->numberBetween($min = 1, $max = 12),
//         'price' => $faker->numberBetween($min = 100, $max = 50000),
//         'condition' => $faker->randomElement(['New(not used)', 'Used Few times', 'Excellent', 'Good', 'Not working']),
//         'delivery' => $faker->randomElement([0, 1]),
//         'warranty_period' => $faker->numberBetween($min = 1, $max = 5) . ' year',
//         'user_id' => $faker->randomElement(User::pluck('id')->toArray()),
//         'status' => $faker->numberBetween($min = 0, $max = 3),
//         'quantity' => $faker->numberBetween($min = 1, $max = 5),

//     ];
// });


// $factory->define(Review::class, function (Faker $faker) {
//     return [
//         'product_id' => $faker->randomElement(Product::pluck('id')->toArray()),
//         'user_id' => $faker->randomElement(User::pluck('id')->toArray()),
//         'rating' => $faker->numberBetween($min = 1, $max = 5),
//         'date' => $faker->dateTimeThisMonth()->format('Y-m-d'),
//         'views' => 1

//     ];
// });
