<?php

namespace App\Http\Controllers\Web;


use App\Http\Controllers\Controller;
use App\Models\Appointment;
use App\Models\Product;
use App\Models\Review;
use App\Models\SubCategory;
use App\Repositories\StylistRepository;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Flash;

class StylistController extends Controller
{
    private $stylistRepository;

    public function __construct(StylistRepository $stylistRepo)
    {
        $this->stylistRepository = $stylistRepo;
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

        return view('web.stylists.index')
            ->with('stylists', $stylists);
    }

    public function booking(Request $request)
    {

        if (Auth::check()) {
            $stylist = $this->stylistRepository->find($request->stylist_id);

            if (empty($stylist)) {
                Flash::error('Stylist not found');

                return redirect(route('stylists.index'));
            }
            $appointments = Appointment::where('stylist_id', $request->stylist_id)->get();


            if (($request->time >= $stylist->start_time) && ($request->time <= $stylist->end_time)) {
                return redirect()->route('web.stylists.index')->with('danger', $stylist->name . ' is not available at this time');
            }
            if ($appointments) {

                foreach ($appointments as $appointment) {

                    if ($appointment->date == $request->date) {

                        if (strtotime($appointment->time) == strtotime($request->time)) {

                            return redirect()->route('web.stylists.index')->with('danger', 'Other customer has already booked');
                        }
                    }
                }
            }
            $input['user_id'] = Auth::user()->id;
            $input['stylist_id'] = $request->stylist_id;
            $input['date'] = $request->date;
            $input['time'] = $request->time;
            $input['status'] = 0;
            Appointment::create($input);

            return redirect()->route('web.stylists.index')->with('success', 'Your booking is created successfully');
        }
        return view('web.profile.login-register');
        return redirect()->route('web.stylists.index')->with('danger', 'Please LogIn');
    }

    public function myBookings()
    {
        if (Auth::check()) {
            $appointments = Appointment::where('user_id', Auth::user()->id)->get();
            return view('web.myproducts.my-booking', compact('appointments'));
        }
        return view('web.profile.login-register');
        return redirect()->route('web.stylists.index')->with('danger', 'Please LogIn');;
    }

    public function changeStatus($id, $status)
    {
        $appointment = Appointment::find($id);
        if (empty($appointment)) {
            Flash::error('Appointment not found');

            return redirect(route('stylists.index'));
        }
        $appointment->status = $status;
        $appointment->save();
        Flash::success('Appointment status changed successfully.');

        return redirect()->back();
    }
}
