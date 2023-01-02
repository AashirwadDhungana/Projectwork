<?php

namespace App\Http\Controllers;

use App\Models\Appointment;
use App\Repositories\StylistRepository;
use Illuminate\Http\Request;
use Flash;

class StylistController extends Controller
{
    /** @var  CategoryRepository */
    private $stylistRepository;

    public function __construct(StylistRepository $stylistRepo)
    {
        $this->stylistRepository = $stylistRepo;
        $this->middleware('permission:Manage admin panel');
    }

    /**
     * Display a listing of the Category.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function index(Request $request)
    {
        $stylists = $this->stylistRepository->paginate(10);

        return view('stylists.index')
            ->with('stylists', $stylists);
    }

    /**
     * Show the form for creating a new Category.
     *
     * @return Response
     */
    public function create()
    {

        return view('stylists.create');
    }

    /**
     * Store a newly created Category in storage.
     *
     * @param CreateCategoryRequest $request
     *
     * @return Response
     */
    public function store(Request $request)
    {

        $input = $request->all();
        if ($request->hasFile('image')) {
            $image = request('image')->store('stylists');
        } else {
            $image = $request->image;
        }
        $input['image'] = $image;


        $stylist = $this->stylistRepository->create($input);



        Flash::success('Stylist saved successfully.');

        return redirect(route('stylists.index'));
    }

    /**
     * Display the specified Category.
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $stylist = $this->stylistRepository->find($id);

        if (empty($stylist)) {
            Flash::error('Stylist not found');

            return redirect(route('stylists.index'));
        }

        return view('stylists.show')->with('stylist', $stylist);
    }

    /**
     * Show the form for editing the specified Category.
     *
     * @param int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $stylist = $this->stylistRepository->find($id);

        if (empty($stylist)) {
            Flash::error('Stylist not found');

            return redirect(route('stylists.index'));
        }

        return view('stylists.edit', compact('stylist'));
    }

    /**
     * Update the specified Category in storage.
     *
     * @param int $id
     * @param UpdateCategoryRequest $request
     *
     * @return Response
     */
    public function update($id, Request $request)
    {
        $stylist = $this->stylistRepository->find($id);

        if (empty($stylist)) {
            Flash::error('Stylist not found');

            return redirect(route('stylists.index'));
        }

        $input = $request->all();
        if ($request->hasFile('image')) {
            $image = request('image')->store('stylists');
        } else {
            $image = $stylist->image;
        }
        $input['image'] = $image;
        $stylist->update($input);

        Flash::success('Stylist updated successfully.');

        return redirect(route('stylists.index'));
    }

    /**
     * Remove the specified Category from storage.
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        $stylist = $this->stylistRepository->find($id);

        if (empty($stylist)) {
            Flash::error('Stylist not found');

            return redirect(route('stylists.index'));
        }
        $this->stylistRepository->delete($id);

        Flash::success('Stylist deleted successfully.');

        return redirect(route('stylists.index'));
    }

    public function appointments()
    {
        $appointments = Appointment::all();
        return view('stylists.appointments')
            ->with('appointments', $appointments);
    }
}
