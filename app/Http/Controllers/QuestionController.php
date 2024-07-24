<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Question;
use App\Models\Subject;



class QuestionController extends Controller
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
        $subject =Subject::all();
        // dd($subject);
        return view('admin.question',['data'=> $subject]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // dd($request->all());
        $request->validate([

            'question' =>'required',
            'option1' =>'required',
            'option2' =>'required',
            'option3' =>'required',
            'option4' =>'required',
            'right_answer' =>'required',
            'select_subject' =>'required',

        ]);

        $question =$request->question;
        $option1 =$request->option1;
        $option2 =$request->option2;
        $option3 =$request->option3;
        $option4 =$request->option4;
        $right_answer =$request->right_answer;
        $subject_id =$request->select_subject;
        // dd($select_subject);

        $data = new Question();

        $data ->question=$question;
        $data ->option1 =$option1;
        $data ->option2 =$option2;
        $data ->option3 =$option3;
        $data ->option4 =$option4;
        $data ->right_answer=$right_answer;
        $data ->subject_id=$subject_id;

        $save =$data->save();

        if($save){

            return redirect()->back()->with('success','Submitted successfully');

        } else{

        return redirect()->back()->with('error','Something went wrong!');
        
      }

    }
    /**
     * Display the specified resource.
     */
    public function show()
    {
        $question =Question::paginate(5);
        // dd($question );
        return view('admin.question_list',['data' => $question]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $question =Question::find($id);
        // dd($question);
        $subject = Subject::all();

        return view('admin.question_edit',['data' => $question,'subjects' => $subject]);
        
    }

   // i had removed string $id
    public function update(Request $request)
    {    
    
         $request->validate([

            'question' => 'required',
            'option1' => 'required',
            'option2' => 'required',
            'option3' => 'required',
            'option4' => 'required',
            'right_answer' => 'required',
            'select_subject' => 'required',

         ]);

         $id =$request->id;
        //  dd($request->all());

         $update =Question::find($id);
        //  dd($update);

        if($id){

         $update ->question =$request->input('question');
         $update ->option1 =$request->input('option1');
         $update ->option2 =$request->input('option2');
         $update ->option3 =$request->input('option3');
         $update ->option4 =$request->input('option4');
         $update ->right_answer =$request->input('right_answer');
         $update ->subject_id =$request->input('select_subject');

         $update->save();

        }

        return redirect('/admin/question/edit/'.$id)->with('success','Updated successfully');

    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        // dd($id);
        $question =Question::find($id);
        if($id){

            $question ->delete();

        }

        return redirect()->back()->with('success', 'Deleted successfully');
    }

}
