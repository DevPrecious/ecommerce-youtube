<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $validated = $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
        ]);


        $user = User::create($validated);

        $token = $user->createToken('authToken')->plainTextToken;

        return response([
            'status' => 'success',
            'user' => $user,
            'token' => $token,
        ]);
    }


    public function login(Request $request)
    {
        $validated = $request->validate([
            'email' => ['required', 'string', 'email'],
            'password' => ['required', 'string'],
        ]);


        $user = User::where('email', $validated['email'])->first();

        if (! $user || ! Hash::check($validated['password'], $user->password)) {
            return response([
                'status' => 'error',
                'message' => 'Invalid email or password',
            ], 401);
        }

        $token = $user->createToken('authToken')->plainTextToken;

        return response([
            'status' => 'success',
            'user' => $user,
            'token' => $token,
        ]);
    }
}
