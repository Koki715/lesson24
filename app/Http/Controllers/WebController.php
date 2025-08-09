<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\MajorCategory;
use App\Models\Product;

class WebController extends Controller
{
    public function index()
    {
        $categories = Category::all();
        $major_categories = MajorCategory::all();

        $recently_products = Product::with('reviews')->orderBy('created_at', 'desc')->take(4)->get();

        foreach($recently_products as $product) {
            $avg = $product->reviews->avg('score');
            $product->average_for_star = round($avg * 2) / 2;
            $product->average_for_text = round($avg, 1);
        }

        $recommend_products = Product::with('reviews')->where('recommend_flag', true)->take(3)->get();

        foreach ($recommend_products as $product) {
            $avg = $product->reviews->avg('score');
            $product->average_for_star = round($avg * 2) / 2;
            $product->average_for_text = round($avg, 1);
        }

        return view('web.index', compact('major_categories', 'categories', 'recently_products', 'recommend_products'));
    }
}
