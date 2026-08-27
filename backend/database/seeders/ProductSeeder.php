<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use App\Models\Product;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Product::create([
            'name'=>'tomato',
            'price'=>150,
            'category_id'=>2,
            'image'=>'products/tomatoes.jpg',
            'availability'=>1,
            'description'=>'Juicy and Fresh'
        ]);

        Product::create([
            'name'=>'banana',
            'price'=>100,
            'category_id'=>1,
            'image'=>'products/banana.jpg',
            'availability'=>1,
            'description'=>'Sweet and Ripe'
        ]);

        Product::create([
            'name'=>'carrot',
            'price'=>120,
            'category_id'=>2,
            'image'=>'products/carrot.jpg',
            'availability'=>1,
            'description'=>'Crunchy and Healthy'
        ]);

        Product::create([
            'name'=>'mango',
            'price'=>200,
            'category_id'=>1,
            'image'=>'products/mango.jpg',
            'availability'=>1,
            'description'=>'Tropical and Delicious'
        ]);

        Product::create([
            'name'=>'cabbage',
            'price'=>80,
            'category_id'=>2,
            'image'=>'products/cabbage.jpg',
            'availability'=>1,
            'description'=>'Fresh and Green'
        ]);

        Product::create([
            'name'=>'pineapple',
            'price'=>250,
            'category_id'=>1,
            'image'=>'products/pineapple.jpg',
            'availability'=>1,
            'description'=>'Juicy and Sweet'
        ]);

        Product::create([
            'name'=>'spinach',
            'price'=>90,
            'category_id'=>2,
            'image'=>'products/spinach.jpg',
            'availability'=>1,
            'description'=>'Fresh and Nutritious'
        ]);

        Product::create([
            'name'=>'grapes',
            'price'=>180,
            'category_id'=>1,
            'image'=>'products/grapes.jpg',
            'availability'=>1,
            'description'=>'Sweet and Juicy'
        ]);

        Product::create([
            'name'=>'onion',
            'price'=>70,
            'category_id'=>2,
            'image'=>'products/onion.jpg',
            'availability'=>1,
            'description'=>'Fresh and Flavorful'
        ]);

        Product::create([
            'name'=>'watermelon',
            'price'=>300,
            'category_id'=>1,
            'image'=>'products/watermelon.jpg',
            'availability'=>1,
            'description'=>'Refreshing and Sweet'
        ]);
    }
}