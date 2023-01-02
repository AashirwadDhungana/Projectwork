<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateProductRequest;
use App\Http\Requests\UpdateProductRequest;
use App\Models\Notification;
use App\Models\Product;
use App\Models\SubCategory;
use App\Repositories\ProductRepository;
use App\Http\Controllers\AppBaseController;
use App\Mail\SentMail;
use App\User;
use Illuminate\Http\Request;
use Flash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Response;
use Validator;

class ProductController extends AppBaseController
{
    /** @var  ProductRepository */
    private $productRepository;

    public function __construct(ProductRepository $productRepo)
    {
        $this->productRepository = $productRepo;
        $this->middleware('permission:Manage admin panel');
    }

    /**
     * Display a listing of the Product.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function newindex(Request $request)
    {
        $products = Product::where('status', 2)->orderBy('updated_at', 'desc')->paginate(9);

        return view('products.index')
            ->with('products', $products);
    }

    public function index(Request $request)
    {
        $search = $request->search;
        $products = Product::where('status', 3);
        if ($search != null) {
            $search_data = explode(' ', $search);
            $products = $products->where(function ($q) use ($search_data) {
                foreach ($search_data as $value) {
                    if (isset($search_data)) {
                        $q->where('title', 'like', "%{$value}%");
                    }
                }
            })->orderBy('created_at', 'desc')->paginate(9);
        } else {
            $products = $products->orderBy('created_at', 'desc')->paginate(9);
        }

        $sta = true;

        return view('products.approved', compact('sta', 'search'))
            ->with('products', $products);
    }
    public function soldout(Request $request)
    {
        $search = $request->search;
        $products = Product::where('status', 4);
        if ($search != null) {
            $search_data = explode(' ', $search);
            $products = $products->where(function ($q) use ($search_data) {
                foreach ($search_data as $value) {
                    if (isset($search_data)) {
                        $q->where('title', 'like', "%{$value}%");
                    }
                }
            })->orderBy('created_at', 'desc')->paginate(9);
        } else {
            $products = $products->orderBy('created_at', 'desc')->paginate(9);
        }

        $sta = false;

        return view('products.approved', compact('sta', 'search'))
            ->with('products', $products);
    }

    public function approval($product_id, $user_id, $status)
    {
        if ($status == 1) {
            $product = $this->productRepository->find($product_id);
            $product->status = 3;
            $product->save();
            $input['message'] = 'Your product "' . $product->title . '" is approved.';
            $input['user_id'] = $user_id;
            $input['url'] = url('/myproducts');
            $input['status'] = 1;
            Notification::create($input);
            $mail_data['sub'] = 'Approval of product';
            $mail_data['message'] = 'Your product "' . $product->title . '" is approved.';


            Flash::success('Product approved successfully');
        } elseif ($status == 0) {
            $product = $this->productRepository->find($product_id);
            $product->status = 5;
            $product->save();
            $input['message'] = 'Your product "' . $product->title . '" is not approved.';
            $input['user_id'] = $user_id;
            $input['url'] = url('/drafts');
            $input['status'] = 1;
            Notification::create($input);
            $mail_data['sub'] = 'Unapproval of product';
            $mail_data['message'] = 'Your product "' . $product->title . '" is not approved.';


            Flash::error('Product unapproved successfully');
        }

        $reciever = User::find($user_id);

        if ($reciever) {
            $sender = User::find(Auth::user()->id);
            $mail_data['email'] = 'hamroshop@gmail.com';
            $mail_data['name'] = 'Hamro Shop';
            $mail_data['reciever_name'] = $reciever->name;


            Mail::to($reciever->email)->send(new SentMail($mail_data));
        }


        return redirect(route('products.new'));
    }

    /**
     * Show the form for creating a new Product.
     *
     * @return Response
     */
    public function create()
    {
        $conditions = ['New(not used)', 'Used Few times', 'Excellent', 'Good', 'Not working'];
        $delivery_area = ['within my area', 'within my city', 'anywhere in Nepal'];
        $sub_categories = SubCategory::select('id', 'name')->pluck('name', 'id')->toArray();
        return view('products.create', compact('conditions', 'delivery_area', 'sub_categories'));
    }

    /**
     * Store a newly created Product in storage.
     *
     * @param CreateProductRequest $request
     *
     * @return Response
     */
    public function store(CreateProductRequest $request)
    {
        $input = $request->all();

        $validator = Validator::make($input, [
            'expiry_time' => ["required", "max:255", "in:month,day,Year"]
        ]);

        $input['status'] = 0;

        $product = $this->productRepository->create($input);

        Flash::success('Product saved successfully.');

        return redirect(route('products.index'));
    }

    /**
     * Display the specified Product.
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $product = $this->productRepository->find($id);

        if (empty($product)) {
            Flash::error('Product not found');

            return redirect(route('products.index'));
        }

        return view('products.show')->with('product', $product);
    }

    /**
     * Show the form for editing the specified Product.
     *
     * @param int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $product = $this->productRepository->find($id);

        if (empty($product)) {
            Flash::error('Product not found');

            return redirect(route('products.index'));
        }
        $conditions = ['New(not used)', 'Used Few times', 'Excellent', 'Good', 'Not working'];
        $delivery_area = ['within my area', 'within my city', 'anywhere in Nepal'];
        $sub_categories = SubCategory::select('id', 'name')->pluck('name', 'id')->toArray();
        return view('products.edit', compact('conditions', 'delivery_area', 'sub_categories', 'product'));
    }

    /**
     * Update the specified Product in storage.
     *
     * @param int $id
     * @param UpdateProductRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateProductRequest $request)
    {
        $validator = Validator::make($request->all(), [
            'expiry_time' => ["required", "max:255", "in:month,day,Year"]
        ]);
        dd($validator);
        $product = $this->productRepository->find($id);

        if (empty($product)) {
            Flash::error('Product not found');

            return redirect(route('products.index'));
        }

        $product = $this->productRepository->update($request->all(), $id);

        Flash::success('Product updated successfully.');

        return redirect(route('products.index'));
    }

    /**
     * Remove the specified Product from storage.
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        $product = $this->productRepository->find($id);

        if (empty($product)) {
            Flash::error('Product not found');

            return redirect(route('products.index'));
        }

        $this->productRepository->delete($id);

        Flash::success('Product deleted successfully.');

        return redirect(route('products.index'));
    }
}
