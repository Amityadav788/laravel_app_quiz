<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Config;


class AdminController extends Controller
{
    public function admin_login()
    {
        return view('admin.login');
    }
    
    public function admin_store(Request $request)
    {
        // dd($request->all());

        $request->validate([

            'email' =>'required',
            'password' =>'required',
        
        ]);
        
        $email =$request->email;
        $pass =$request->password;
        // dd($pass);

        // dd(config('constant.admin_email'));
        $a_email =Config::get('constant.admin_email');
        // dd($a_email) ;  
        $a_pass =Config::get('constant.admin_password');
        // dd($a_pass);
        
        if($email == $a_email && $pass == $a_pass){

            $request->session()->put('is_admin', 'true');
            return redirect('/dashboard');

        } 

        return redirect()->back()->with('error','Invalid request');

    }

    public function dashboard()
    {

        return view('admin.dashboard');
    }
    
    public function admin_logout(Request $request)
    {

      $request->session()->flush();
      Auth()->logout();

      return redirect('/admin/login');
      
    }
   

}
