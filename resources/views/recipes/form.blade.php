@extends('layouts.app')

@section('content')
  <h1>{{ $recipe->exists ? 'Edit' : 'Add' }} Recipe</h1>

  <form action="{{ $recipe->exists ? route('recipes.update', $recipe) : route('recipes.store') }}" method="POST"
    enctype="multipart/form-data">
    @csrf
    @if($recipe->exists) @method('PUT') @endif

    <div class="mb-3">
    <label class="form-label">Name</label>
    <input name="name" value="{{ old('name', $recipe->name) }}" class="form-control" required>
    </div>

    <div class="mb-3">
    <label class="form-label">Description</label>
    <textarea name="description" class="form-control" rows="2"
      required>{{ old('description', $recipe->description) }}</textarea>
    </div>

    <div class="row mb-3">
    <div class="col-md-6">
      <label class="form-label">Type</label>
      <select name="type" class="form-select" required>
      @foreach(['French', 'Italian', 'Chinese', 'Indian', 'Mexican', 'Others'] as $t)
      <option @selected($t == old('type', $recipe->type))>{{ $t }}</option>
    @endforeach
      </select>
    </div>
    <div class="col-md-6">
      <label class="form-label">Cooking time (min)</label>
      <input type="number" name="cookingtime" class="form-control"
      value="{{ old('cookingtime', $recipe->cookingtime) }}" min="1" required>
    </div>
    </div>

    <div class="mb-3">
    <label class="form-label">Ingredients</label>
    <textarea name="ingredients" class="form-control" rows="3"
      required>{{ old('ingredients', $recipe->ingredients) }}</textarea>
    </div>

    <div class="mb-3">
    <label class="form-label">Instructions</label>
    <textarea name="instructions" class="form-control" rows="4"
      required>{{ old('instructions', $recipe->instructions) }}</textarea>
    </div>

    <div class="mb-3">
    <label class="form-label">Image (optional)</label>
    <input type="file" name="image" class="form-control">
    </div>

    <button class="btn btn-success">{{ $recipe->exists ? 'Update' : 'Create' }}</button>
    <a href="{{ url()->previous() }}" class="btn btn-secondary ms-2">Cancel</a>
  </form>
@endsection