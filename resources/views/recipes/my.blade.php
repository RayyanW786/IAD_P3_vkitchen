@extends('layouts.app')

@section('content')
    <h1 class="mb-3">My Recipes</h1>

    <a class="btn btn-primary mb-4" href="{{ route('recipes.create') }}">+ Add new</a>

    {{-- --- grid / empty-state --- --}}
    <div class="row row-cols-1 row-cols-md-3 g-4">
        @forelse ($recipes as $r)
            <div class="col">
                <div class="card h-100 bg-body">
                    @if ($r->image)
                        <img src="{{ asset('storage/' . $r->image) }}" class="card-img-top" style="height:180px;object-fit:cover;">
                    @else
                        <div class="card-img-top d-flex align-items-center justify-content-center
                                                bg-body-tertiary text-body-secondary" style="background:#2a2a2c;">
                            <span>No image</span>
                        </div>
                    @endif
                    <div class="card-body">
                        <h5 class="card-title">{{ $r->name }}</h5>
                        <p class="card-text">
                            <span class="badge bg-secondary">{{ $r->type }}</span>
                        </p>
                        <p class="card-text">{{ Str::limit($r->description, 80) }}</p>

                        <a href="{{ route('recipes.show', $r) }}" class="btn btn-outline-primary btn-sm me-1">View</a>

                        @can('update', $r)
                            <a href="{{ route('recipes.edit', $r) }}" class="btn btn-warning btn-sm">Edit</a>
                        @endcan

                    </div>
                </div>
            </div>
        @empty
            <div class="alert alert-dark text-center">
                You haven’t added any recipes yet.<br>
                <a href="{{ route('recipes.create') }}" class="btn btn-primary mt-2">Add your first recipe</a>
            </div>
        @endforelse
    </div>

    <div class="mt-4">
        {{ $recipes->links('pagination::bootstrap-5') }}
    </div>
@endsection