<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Category;
use App\Models\MajorCategory;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $keyword = $request->keyword;

        if ($request->category !== null) {
            $products = Product::where('category_id', $request->category)->sortable()->paginate(15);
            $total_count = Product::where('category_id', $request->category)->count();
            $category = Category::find($request->category);
            $major_category = MajorCategory::find($category->major_category_id);
        } elseif ($keyword !== null) {
            $products = Product::where('name', 'like', "%{$keyword}%")->sortable()->paginate(15);
            $total_count = $products->total();
            $category = null;
            $major_category = null;
        } else {
            $products = Product::sortable()->paginate(15);
            $total_count = "";
            $category = null;
            $major_category = null;
        }

        foreach ($products as $product) {
            $avg = $product->reviews->avg('score');
            $product->average_for_star = round($avg *2) / 2;
            $product->average_for_text = round($avg, 1);
        }

        $categories = Category::all();
        $major_categories = MajorCategory::all();

    
        return view('products.index', compact('products', 'category', 'major_category', 'categories', 'total_count', 'keyword'));
    }
     
    /**
     * Search products by keyword.
     */
    public function search(Request $request)
    {
        $query = $request->input('query');

        // キーワードで商品名に部分一致する商品を検索
        $products = Product::where('name', 'like', "%{$query}%")->get();

        // 検索結果を一覧ページに渡す
        return view('products.index', compact('products'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $categories = Category::all();

        return view('products.create', compact('categories'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // バリデーション
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'required|string',
            'price' => 'required|integer',
            'category_id' => 'required|integer|exists:categories,id',
            'images.*' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        // 商品登録
        $product = new Product();
        $product->name = $validated['name'];
        $product->description = $validated['description'];
        $product->price = $validated['price'];
        $product->category_id = $validated['category_id'];
        $product->save();

        // 画像がある場合に保存
        if ($request->hasFile('images')) {
            foreach ($request->file('images') as $index => $image) {
                $path = $image->store('products', 'public');
                $product->images()->create([
                    'image_path' => $path,
                    'sort_order' => $index,
                ]);
            }
        }

        return to_route('products.index')->with('success', '商品を登録しました');
    }

    /**
     * Display the specified resource.
     * 
     * @param \App\Models\Product $product
     * @return \Illuminate\Http\Response
     */
    public function show(Product $product)
    {
        $product->load('reviews');

        $avg = $product->reviews->avg('score');
        $product->average_for_star = round($avg * 2) / 2;
        $product->average_for_text = round($avg, 1);

        $reviews = $product->reviews;
 
        return view('products.show', compact('product', 'reviews'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Product $product)
    {
        $categories = Category::all();

        return view('products.edit', compact('product', 'categories'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Product $product)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'required|string',
            'price' => 'required|integer',
            'category_id' => 'required|integer|exists:categories,id',
            // 画像の更新も対応する場合はここに追加
        ]);

        $product->name = $validated['name'];
        $product->description = $validated['description'];
        $product->price = $validated['price'];
        $product->category_id = $validated['category_id'];
        $product->save();

        return to_route('products.index')->with('success', '商品を更新しました');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Product $product)
    {
        $product->delete();

        return to_route('products.index')->with('success', '商品を削除しました');
    }
}
