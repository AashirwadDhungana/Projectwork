<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateCityRequest;
use App\Http\Requests\UpdateCityRequest;
use App\Models\City;
use App\Models\Region;
use App\Repositories\CityRepository;
use App\Http\Controllers\AppBaseController;
use Illuminate\Http\Request;
use Flash;
use Response;

class RegionController extends AppBaseController
{
    /** @var  CityRepository */
    private $regionModel;

    public function __construct(Region $regionRepo)
    {
        $this->regionModel = $regionRepo;
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
        $regions =  $this->regionModel->paginate(10);

        return view('regions.index')
            ->with('regions', $regions);
    }

    /**
     * Show the form for creating a new City.
     *
     * @return Response
     */
    public function create()
    {
        $cities=City::pluck('name','id')->toArray();
        return view('regions.create',compact('cities'));
    }


    public function search(Request $request)
    {
        $search = $request->search;

        if($search == ''){
            $cities = City::select('id','name')->get();
        }
        else{

            $cities = City::select('id','name')->where('name', 'like', '%' .$search . '%')->get();
        }

        $response = array();
        foreach($cities as $city){
            $response[] = array(
                "id"=>$city->id,
                "text"=>$city->name
            );
        }

        echo json_encode($response);
        exit;
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
        $region = $this->regionModel->create($input);
        if ($request->has('city_id')) {

            foreach ($request->city_id as $cityId) {
                if (substr($cityId, 0, 4) == 'new:') {
                    $data['name'] = substr($cityId, 4);
                    $data['region_id'] = $region->id;
                    $newcity = City::create($data);
                }
                else
                {
                  $oldcity  =City::find($cityId);
                  $oldcity->region_id=$region->id;
                  $oldcity->save();

                }

            }
        }

        Flash::success('Region saved successfully.');

        return redirect(route('regions.index'));
    }

    /**
     * Display the specified City.
     *
     * @param int $id
     *
     * @return Response
     */

    /**
     * Show the form for editing the specified City.
     *
     * @param int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $region = $this->regionModel->find($id);

        if (empty($region)) {
            Flash::error('Region not found');

            return redirect(route('regions.index'));
        }
        $cities=City::pluck('name','id')->toArray();
        $selected_cities=City::where('region_id',$id)->pluck('id')->toArray();

        return view('regions.edit',compact('cities','selected_cities'))->with('region', $region);
    }

    /**
     * Update the specified City in storage.
     *
     * @param int $id
     * @param UpdateCityRequest $request
     *
     * @return Response
     */
    public function update($id, Request $request)
    {
        $region = $this->regionModel->find($id);

        if (empty($region)) {
            Flash::error('City not found');

            return redirect(route('regions.index'));
        }

        $region = $region->update($request->all());

        if ($request->has('city_id')) {
            $selected_cities = City::where('region_id', $id)->pluck('id')->toArray();

            foreach ($selected_cities as $selected_city) {
                if (!in_array($selected_city, $request->city_id)) {
                    $oldcity = City::find($selected_city);
                    $oldcity->region_id = null;
                    $oldcity->save();
                }
            }
            foreach ($request->city_id as $cityId) {
                if (substr($cityId, 0, 4) == 'new:') {
                    $data['name'] = substr($cityId, 4);
                    $data['region_id'] = $id;
                    $newcity = City::create($data);
                } else {
                    $oldcity = City::find($cityId);
                    $oldcity->region_id = $id;
                    $oldcity->save();


                }

            }
        }


        Flash::success('Region updated successfully.');

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
        $region = $this->regionModel->find($id);

        if (empty($region)) {
            Flash::error('Region not found');

            return redirect(route('regions.index'));
        }

        $region->delete();

        Flash::success('Region deleted successfully.');

        return redirect(route('regions.index'));
    }
}
