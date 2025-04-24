<?php

namespace Database\Factories;

use App\Models\Recipe;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Recipe>
 */
class RecipeFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $images = [
            'Chinese_1.jpg', 'Chinese_2.jpg',
            'english_1.jpg',
            'french_1.jpg', 'french_2.jpg', 'french_3.jpg', 'french_4.jpg',
            'Indian_1.jpg', 'Indian_2.jpg', 'Indian_3.jpg',
            'Italian_1.jpg', 'Italian_2.jpg', 'Italian_3.jpg',
            'Mexican_1.jpg', 'Mexican_2.jpg', 'Mexican_3.jpg'
        ];

        return [
            'name'         => $this->faker->words(3, true),
            'description'  => $this->faker->sentence(10),
            'type'         => $this->faker->randomElement([
                               'French','Italian','Chinese','Indian','Mexican','Others'
                             ]),
            'cookingtime'  => $this->faker->numberBetween(10, 120),
            'ingredients'  => $this->faker->paragraph(2),
            'instructions' => $this->faker->paragraph(4),
            'image'        => $this->faker->boolean(50)
                            ? 'recipes/'.$this->faker->randomElement($images)
                            : null,              
            'user_id'      => 1,                
        ];
    }
}
