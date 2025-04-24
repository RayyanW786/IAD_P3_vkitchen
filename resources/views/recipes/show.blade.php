@extends('layouts.app')

@section('content')
  <a href="{{ url()->previous() }}" class="btn btn-link">&laquo; back</a>

  <h1>{{ $recipe->name }}</h1>
  @if($recipe->image)
    <img src="{{ asset('storage/' . $recipe->image) }}" class="img-fluid mb-3">
  @endif

  <ul class="list-group mb-3">
    <li class="list-group-item"><strong>Type:</strong> {{ $recipe->type }}</li>
    <li class="list-group-item"><strong>Cooking time:</strong> {{ $recipe->cookingtime }} min</li>
    <li class="list-group-item"><strong>By:</strong> {{ $recipe->user->name ?? 'Unknown' }}</li>
  </ul>

  <h4>Description</h4>
  <p>{{ $recipe->description }}</p>

  <h4>Ingredients</h4>
  <p>{{ $recipe->ingredients }}</p>

  <h4>Instructions</h4>
  <p>{{ $recipe->instructions }}</p>

  @can('update', $recipe)
    <a class="btn btn-warning" href="{{ route('recipes.edit', $recipe) }}">Edit</a>
  @endcan
@endsection