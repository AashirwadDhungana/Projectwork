<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateCityRequest;
use App\Http\Requests\UpdateCityRequest;
use App\Models\Area;
use App\Repositories\CityRepository;
use App\Http\Controllers\AppBaseController;
use Illuminate\Http\Request;
use Flash;
use Response;

class CityController extends AppBaseController
{
    /** @var  CityRepository */
    private $cityRepository;

    public function __construct(CityRepository $cityRepo)
    {
        $this->cityRepository = $cityRepo;
        $this->middleware('permission:Manage admin panel');
    }

    /**
     * Display a listing of the City.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function index(Request $request)
    {
        $cities = $this->cityRepository->paginate(10);

        return view('cities.index')
            ->with('cities', $cities);
    }

    /**
     * Show the form for creating a new City.
     *
     * @return Response
     */
    public function create()
    {
        return view('cities.create');
    }

    /**
     * Store a newly created City in storage.
     *
     * @param CreateCityRequest $request
     *
     * @return Response
     */
    public function store(CreateCityRequest $request)
    {
        $input = $request->all();

        $city = $this->cityRepository->create($input);

        Flash::success('City saved successfully.');

        return redirect(route('cities.index'));
    }

    /**
     * Display the specified City.
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $city = $this->cityRepository->find($id);

        if (empty($city)) {
            Flash::error('City not found');

            return redirect(route('cities.index'));
        }

        return view('cities.show')->with('city', $city);
    }

    /**
     * Show the form for editing the specified City.
     *
     * @param int $id
     *
     * @return Response
     */
    public function search(Request $request)
    {
        $search = $request->search;

        if($search == ''){
            $areas = Area::select('id','name')->get();
        }
        else{

            $areas = Area::select('id','name')->where('name', 'like', '%' .$search . '%')->get();
        }

        $response = array();
        foreach($areas as $area){
            $response[] = array(
                "id"=>$area->id,
                "text"=>$area->name
            );
        }

        echo json_encode($response);
        exit;
    }
    public function edit($id)
    {
        $city = $this->cityRepository->find($id);

        if (empty($city)) {
            Flash::error('City not found');

            return redirect(route('cities.index'));
        }
        $areas=Area::pluck('name','id')->toArray();
        $selected_areas=Area::where('city_id',$id)->pluck('id')->toArray();

        return view('cities.edit',compact('areas','selected_areas'))->with('city', $city);
    }

    /**
     * Update the specified City in storage.
     *
     * @param int $id
     * @param UpdateCityRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateCityRequest $request)
    {
        $city = $this->cityRepository->find($id);

        if (empty($city)) {
            Flash::error('City not found');

            return redirect(route('cities.index'));
        }

        $city = $this->cityRepository->update($request->all(), $id);
        if ($request->has('area_id')) {

            $selected_areas = Area::where('city_id', $id)->pluck('id')->toArray();

            foreach ($selected_areas as $selected_area) {
                if (!in_array($selected_area, $request->area_id)) {
                    $oldcity = Area::find($selected_area);
                    $oldcity->city_id = null;
                    $oldcity->save();
                }
            }
            foreach ($request->area_id as $areaId) {
                if (substr($areaId, 0, 4) == 'new:') {
                    $data['name'] = substr($areaId, 4);
                    $data['city_id'] = $id;
                    $newcity = Area::create($data);
                } else {
                    $oldcity = Area::find($areaId);
                    $oldcity->city_id = $id;
                    $oldcity->save();


                }

            }
        }


        Flash::success('City updated successfully.');

        return redirect(route('regions.index'));
    }

    /**
     * Remove the specified City from storage.
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        $city = $this->cityRepository->find($id);

        if (empty($city)) {
            Flash::error('City not found');

            return redirect(route('cities.index'));
        }

        $this->cityRepository->delete($id);

        Flash::success('City deleted successfully.');

        return redirect(route('cities.index'));
    }
}
