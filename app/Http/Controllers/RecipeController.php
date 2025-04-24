<?php

namespace App\Http\Controllers;

use App\Models\Recipe;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class RecipeController extends Controller
{
    /* ---------- PUBLIC ---------- */

    /** GET /            */
    public function index()
    {
        $recipes = Recipe::latest()->paginate(9);
        return view('recipes.index', compact('recipes'));
    }

    /** GET /recipes/{recipe} */
    public function show(Recipe $recipe)
    {
        return view('recipes.show', compact('recipe'));
    }

    /** GET /search?q=&type= */
    public function search(Request $r)
    {
        $recipes = Recipe::query()
            ->when($r->q,    fn($q) => $q->where('name','like',"%{$r->q}%"))
            ->when($r->type, fn($q) => $q->where('type',$r->type))
            ->latest()
            ->paginate(9)
            ->withQueryString();

        return view('recipes.index', compact('recipes'));
    }

    /* ---------- AUTH ---------- */

    public function create()
    {
        return view('recipes.form', ['recipe'=>new Recipe()]);
    }

    public function store(Request $r)
    {
        $data = $this->validated($r);
        $data['user_id'] = auth()->id();

        if ($r->file('image')) {
            $data['image'] = $r->file('image')
                                ->store('recipes','public');
        }

        Recipe::create($data);
        return redirect()->route('recipes.my')
                         ->with('status','Recipe added!');
    }

    public function edit(Recipe $recipe)
    {
        $this->authorize('update',$recipe);
        return view('recipes.form', compact('recipe'));
    }

    public function update(Request $r, Recipe $recipe)
    {
        $this->authorize('update',$recipe);
        $data = $this->validated($r);

        if ($r->file('image')) {
            Storage::disk('public')->delete($recipe->image);
            $data['image'] = $r->file('image')
                                ->store('recipes','public');
        }

        $recipe->update($data);
        return back()->with('status','Updated!');
    }

    public function my()
    {
        $recipes = auth()->user()
                         ->recipes()
                         ->latest()
                         ->paginate(9);
        return view('recipes.my', compact('recipes'));
    }

    /* ---------- helpers ---------- */
    private function validated(Request $r): array
    {
        return $r->validate([
            'name'         => 'required|string|max:255',
            'description'  => 'required|string|max:500',
            'type'         => 'required|in:French,Italian,Chinese,Indian,Mexican,Others',
            'cookingtime'  => 'required|integer|min:1',
            'ingredients'  => 'required|string',
            'instructions' => 'required|string',
            'image'        => 'nullable|image|max:2048',
        ]);
    }
}
