<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        User::create([
            'email'=>'super_admin@example.com',
            'firstname'=>'Super',
            'lastname'=>'Admin',
            'phone'=>'0711222333',
            'location'=>'Nairobi',
            'address'=>'123 Example Street',
            'password'=>'Qwerty1.',
            'role_id'=>1,
        ]);

        User::create([
            'email'=>'test_user@example.com',
            'firstname'=>'Test',
            'lastname'=>'User',
            'phone'=>'0711222333',
            'location'=>'Nairobi',
            'address'=>'123 Example Street',
            'password'=>'Qwerty1.',
            'role_id'=>2,
        ]);
    }
}
