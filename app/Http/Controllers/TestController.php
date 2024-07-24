<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Test;
use App\Models\Subject;
use App\Models\Question;
use App\Models\Test_question;
use Auth;

use Session;


class TestController extends Controller
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
        $question =Question::all();
        // dd($question);
        return view('admin.test',['subject' => $subject , 'question' => $question]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // dd($request->all());
        $request->validate([

            'test_name' => 'required',
            'test_date' => 'required|date|after_or_equal:start_date',
            'test_subject' => 'required',
        ]);

        $test_name =$request->test_name;
        $test_date =$request->test_date;
        $test_subject =$request->test_subject;
        $question_id =$request->question_id;
        // dd($question_id);

        $test = new Test();

        $test->test_name =$test_name;
        $test->test_date =$test_date;
        $test->subject_id =$test_subject;
        $test->question_id=$question_id;

        $test->save();
        // dd($test);

        if($test){  
        
            return redirect('/test/create/'.$test->id)->with('success','Test added successfully');
        }

           return redirect()->back()->with('error', 'Something went wrong');

    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        // $test =Test::all();
        // // dd($test);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    public function test_create(Request $request,string $id)
    {
      $id =$request->id;
    //   dd($id);
      
      $test =Test::find($id);
    //   dd($test);

      if($test){

        $subject_id = $test->subject_id;

        $subject = Subject::find($subject_id);
        // dd($subject);

        $questions = $subject->questions; //here i called the relation function (questions)
        // dd($questions);
      }


    return view('admin.test_question',['test' => $test,'questions' => $questions]);

    }

    public function test_question(Request $request)
    {
        // dd($request->all());
        $test_id =$request->test_id;
        $question_id =$request->question_id;
        $len =count($question_id);

        for($i = 0; $i<$len; $i++){

            $question = $question_id[$i];
            
            $test_question = new Test_question();

            $test_question->test_id = $test_id;
            $test_question->question_id = $question;

            $test_question->save();

        }

        return back()->with('success','Question Saved Successfully!');

    }

    public function test_list(Request $request)
    {    
        // dd($request->all());
        $admin = $request->session()->get('is_admin');
        $tests = [];
       
        if($admin){
            
            $tests =Test::paginate(5);

        } else{
            $user=Auth::user();
          
            $subject_id =$user['subject_id'];
            // dd($subject_id);

            $tests =Test::where(['subject_id'=> $subject_id])->paginate(5);
          
        }
        return view('admin.test_list',['list' => $tests, 'admin' => $admin]);
        
    }

    public function test_ques_list(Request $request, string $id)
    {
       $test_id =$request->id;
    //    dd($test_id);
      
    $test =Test::find($test_id);
    $questions = [];

    // dd($test->questions);

    if($test){

        $questions =$test->questions;
        // dd($questions);
    }
   
     
    return view('admin.test_quest_list',['test_quest' => $questions]);
     
    }

    public function test_attempt(Request $request,string $test_id,$question_id = 1)
    {    
        $tests =Test::find($test_id);
        // dd($tests);
        $questions =[];

        $total_questions = 0;

        $next_question_id = $question_id + 1;


        if($tests && $question_id){

            $questions =$tests->questions;
            $total_questions = $tests->questions->count();

            if($total_questions < 1){

                return view('admin.error_page');
            }

            if($question_id > $total_questions){
                exit('invalid access');
            } 

            $current_question = Question::find($questions[$question_id-1]->question_id);  // $quesyion - 1 will work as array key ex: if $question_id = 1 then it show data which have key 1-1 =0 , if Q_id = 2 , data shown will be 2-1 = 1<= $key.

            // dd($current_question);
            return view('admin.test_attempt',['questions' => $current_question, 'question_id' => $question_id, 'total_questions' =>$total_questions ,'test_id'=> $test_id ]);

        } 

    }

    public function save_answer(Request $request)
    {   
        // dd($request->all());
        $user_answer_data = ['question_id' => $request->question_id,'answer' => $request->answer];
        $test_id =$request->test_id;
        $current_question_id =$request->current_question_id;
        $total_questions =$request->total_questions;

        $next_question_id =$current_question_id + 1;

       

        if(!$request->session()->has('user_answers')){

            $request->session()->put('user_answers',[$user_answer_data]);

        } else{

            $old_data = $request->session()->get('user_answers');

            $new_data = [];

            $found = false;

            foreach($old_data as $key => $value){

                if($value['question_id'] == $request->question_id){
                    $old_data[$key]['answer'] = $request->answer; 
                    $found = true;
                } 
              
                // dd($old_data[$key]);               
            }

            if(!$found){
                
                $old_data[] = $user_answer_data;
            }

            $request->session()->put('user_answers',$old_data);
            // dd($old_data);
        }
                
        if($next_question_id > $total_questions){
            
            return redirect('/test/result/'.$test_id);
        } 
        
        return redirect('test/attempt/'.$test_id.'/'.$next_question_id);

    }

    public function test_result(Request $request, string $test_id)
    {    
        $score =[];
        
        $result_details = $request->session()->get('user_answers');
        $count = 0;

        if($result_details){

            foreach($result_details as $key => $value){

                $question_id =$value['question_id'];
              
                $answer =$value['answer'];
                
                if(!empty($question_id)){

                    $questions =Question::find($value['question_id']);

                    if($answer == $questions->right_answer  ){
                        
                        $count += 1 ;
                    }
                    
                    $request->session()->forget('user_answers');
                    $score[] =['id' => $question_id ,'question' => $questions->question, 'right_answer' => $questions->right_answer, 'answer' => $answer];
                    
                }
                
            }
 
        }
        
     
        return view('admin.test_result', ['results' => $score,'output' => $count]);
    }
    
    public function test_edit(string $id)
    {    
        
        $test =Test::find($id);
        // dd($test);
        if($test){
        
        $subject =Subject::all();
        $subject_id = $test->subject_id;
        $test_questions =[];
        foreach($test->questions as $key => $val){
            $test_questions[] = $val->question_id;

        }
    
        

        $question =Question::where(['subject_id' => $subject_id])->get();
    
        return view('admin.test_edit',['data' => $test, 'subjects' => $subject, 'question' => $question ,'test_questions'=> $test_questions]);

        }
    }

    public function test_edit_update(Request $request)
    {    
        // dd($request->all());
        $request->validate([

            'test_name' => 'required',
            'test_date' => 'required',
            'test_subject' => 'required',
        ]);
        
        $id =$request->test_id;
        // dd($id);
        $question_id =$request->question_id;
        
        if($question_id){
            
            $test_quest =Test_question::where(['test_id'=>$id])->get();
            $test_question_obj =[];

            foreach($test_quest as $value){
                $test_question_id = $value->id;
                $test_question_obj = Test_question::find($test_question_id);
                $test_question_obj->delete();
            }

            foreach($question_id as $key => $value){
                
                $test_upload = new Test_question();
            
                $test_upload->test_id=$id;
                $test_upload->question_id =$value;
                $test_upload->save();

            }

        }

        // dd($test_question_obj);
        $tests =Test::find($id);
        // dd($tests);
        
        if($id){
        
        $tests->test_name =$request->input('test_name');
        $tests->test_date =$request->input('test_date');
        $tests->subject_id =$request->input('test_subject');
        $tests->question_id=$question_id;

        $tests->save();
        }
       
        return redirect('/test/edit/'.$id)->with('success', 'Updated successfully');
    }
}
