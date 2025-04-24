<?php

namespace Database\Seeders;

use App\Models\Recipe;
use App\Models\User;
use Illuminate\Database\Seeder;

class RecipeSeeder extends Seeder
{
    public function run(): void
    {
        $user = User::first() ?? User::factory()->create([
            'name'=>'Demo User',
            'email'=>'demo@example.com',
            'password'=>bcrypt('password'),
        ]);

        Recipe::factory()->count(15)->create(['user_id'=>$user->id]);
    }
}
