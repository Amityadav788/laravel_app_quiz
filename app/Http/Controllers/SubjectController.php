<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Subject;

// use Session;


class SubjectController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.subject');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // dd($request->all());
        $request->validate([

            'title' => 'required',
            'image' => 'required',
        ]);

        $title =$request->title;
        // dd($title);
        $image =$request->image;
        // dd($image);

        if(isset($request->image)){

            $ext =$request->image->extension();
            $unique_name =time().'.'.$ext;
            // dd($unique_name);
            $upload =$request->image->storeAs('public/images',$unique_name);

        }

            $subject = new Subject();

            $subject ->title=$title;
            $subject ->image=$unique_name;

            $save =$subject->save();

            if($save){
              
               return redirect()->back()->with('success','Added successfully');

            }
            
            return redirect()->back()->with('error','Something went wrong');

    } 
    /**
     * Display the specified resource.
     */
    public function show(string $id = null)
    {
        $subject =Subject::paginate(5);

        return view('admin.user_list', ['data' => $subject]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $subject =Subject::find($id);
        // dd($subject);

        if($subject){

            return view('admin.edit_user',['data' => $subject]);
        }

    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request,)
    {     
        //  dd($request->all());
         $request->validate([

            'title' => 'required',
            
         ]);

         $id =$request->id;
        //  dd($id);
        $subject =Subject::find($id);

        $unique_name =$request->old_image;
        // dd($unique_name);
        if(isset($request->image)){

            $ext =$request->image->extension();
            $unique_name =time().'.'.$ext;
            $uploaded =$request->image->storeAs('public/images', $unique_name);
        }

       if($id){

        $subject->title =$request->input('title');
        $subject->image =$unique_name;
        // dd($subject->image);

        $subject ->save();

       }

       return redirect('/admin/edit/'.$id)->with('success','Updated successfully');

        
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {   
        // dd($id);

        $subject =Subject::find($id);
        // dd($subject);
        if($subject){

            $subject->delete();
            
        }

        return redirect()->back()->with('success','Deleted successfully');
    }
}
