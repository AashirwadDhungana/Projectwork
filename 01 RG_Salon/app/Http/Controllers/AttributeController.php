<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateAttributeRequest;
use App\Http\Requests\UpdateAttributeRequest;
use App\Repositories\AttributeRepository;
use App\Http\Controllers\AppBaseController;
use Illuminate\Http\Request;
use Flash;
use Response;

class AttributeController extends AppBaseController
{
    /** @var  AttributeRepository */
    private $attributeRepository;

    public function __construct(AttributeRepository $attributeRepo)
    {
        $this->attributeRepository = $attributeRepo;
        $this->middleware('permission:Manage admin panel');
    }

    /**
     * Display a listing of the Attribute.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function index(Request $request)
    {
        $attributes = $this->attributeRepository->paginate(10);

        return view('attributes.index')
            ->with('attributes', $attributes);
    }

    /**
     * Show the form for creating a new Attribute.
     *
     * @return Response
     */
    public function create()
    {
        return view('attributes.create');
    }

    /**
     * Store a newly created Attribute in storage.
     *
     * @param CreateAttributeRequest $request
     *
     * @return Response
     */
    public function store(CreateAttributeRequest $request)
    {
        $input = $request->all();
        $attribute = $this->attributeRepository->create($input);

        Flash::success('Attribute saved successfully.');

        return redirect(route('attributes.index'));
    }

    /**
     * Display the specified Attribute.
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $attribute = $this->attributeRepository->find($id);

        if (empty($attribute)) {
            Flash::error('Attribute not found');

            return redirect(route('attributes.index'));
        }

        return view('attributes.show')->with('attribute', $attribute);
    }

    /**
     * Show the form for editing the specified Attribute.
     *
     * @param int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $attribute = $this->attributeRepository->find($id);
        if (empty($attribute)) {
            Flash::error('Attribute not found');

            return redirect(route('attributes.index'));
        }

        return view('attributes.edit', compact('attribute'));
    }

    /**
     * Update the specified Attribute in storage.
     *
     * @param int $id
     * @param UpdateAttributeRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateAttributeRequest $request)
    {
        $attribute = $this->attributeRepository->find($id);

        if (empty($attribute)) {
            Flash::error('Attribute not found');

            return redirect(route('attributes.index'));
        }

        $attribute = $this->attributeRepository->update($request->all(), $id);

        Flash::success('Attribute updated successfully.');

        return redirect(route('attributes.index'));
    }

    /**
     * Remove the specified Attribute from storage.
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        $attribute = $this->attributeRepository->find($id);

        if (empty($attribute)) {
            Flash::error('Attribute not found');

            return redirect(route('attributes.index'));
        }

        $this->attributeRepository->delete($id);

        Flash::success('Attribute deleted successfully.');

        return redirect(route('attributes.index'));
    }
}
