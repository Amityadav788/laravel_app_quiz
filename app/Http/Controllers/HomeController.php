<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Question;
use App\Models\Subject;
use App\Models\Test;
use Session;

use Auth;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('custom_home');
    }

    public function custom_home()
    {

        return redirect('/test/list');
    }

    public function user_logout(Request $request)
    {
        Auth()->logout();
        return redirect('/login');
    }

    public function user_dashboard()
    {
        $auth_id = Auth::id();

        if ($auth_id) {

            $user = User::find($auth_id);
            $is_paid =$user->is_payable;
            
        }

        return view('admin.user_dashboard',['is_paid'=> $is_paid]);
    }

    public function user_profile_update(Request $request, $id)
    {
        $user_id = $request->id;

        if ($user_id) {

            $user_data = User::find($user_id);

            return view('admin.user_profile', ['user_data' => $user_data]);
        }
    }

    public function user_attempt_test()
    {

        $auth_id = Auth::user()->id;

        $user = User::find($auth_id);
        $sub_id = $user->subject_id;
        $tests = [];

        if ($sub_id) {

            $subject = Subject::find($sub_id);
            // dd($subject);
            $tests = $subject->getTests;
            // dd($tests);
        }

        return view('admin.user_attempt_test', ['tests' => $tests]);
    }

    public function subscription()
    {
        return view('admin.razorpay');
    }
}
