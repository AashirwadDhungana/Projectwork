<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Mail\SentMail;
use App\Models\Category;
use App\Models\Notification;
use App\Models\Product;
use App\Models\Review;
use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;

use Illuminate\Support\Str;

class HomeController extends Controller
{
    public function index()
    {
        // $user = User::find(219);
        // $products = Product::whereBetween('id', [158, 160])->get();
        // $review = [];

        // foreach ($products as $product) {

        //     $review['product_id'] = $product->id;
        //     $review['user_id'] = $user->id;
        //     $review['rating'] = rand(1, 5);
        //     $review['date'] = Carbon::now()->format('Y-m-d');
        //     $review['views'] = 1;
        //     $review['description'] = 'Very Nice';
        //     Review::create($review);
        // }



        $product_imgs = Product::select('featured_image')->where('status', 3)->inRandomOrder()->take(4)->get();
        $reviewProducts = Review::pluck('product_id')->all();
        $newproducts = Product::whereNotIn('id', $reviewProducts)->inRandomOrder()->take(10)->get();

        return view('web.index', compact('product_imgs', 'newproducts'));
    }

    public function Notification($id)
    {
        $notify = Notification::find($id);
        $notify->status = 2;
        $notify->save();
        return redirect($notify->url);
    }

    public function changeNotify()
    {
        if (Auth::check()) {
            $allnotify = Notification::where('user_id', Auth::user()->id)->where('status', 1)->get();
            if (count($allnotify) != 0) {
                foreach ($allnotify as $noti) {
                    $noti->status = 3;
                    $noti->save();
                }
            }
        }
    }


    public function selectAddress(Request $request)
    {
        if ($request->type == 'region') {
            $cities = \App\Models\City::where('region_id', $request->region)->pluck('name', 'id')->toArray();
            return response()->json($cities);
        }
        if ($request->type == 'city') {
            $areas = \App\Models\Area::where('city_id', $request->city)->pluck('name', 'id')->toArray();
            return response()->json($areas);
        }
    }
}
