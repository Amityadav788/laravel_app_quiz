<?php

namespace App\Models;
use App\Models\Test;
use App\Models\Question;



use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Test_question extends Model
{
    use HasFactory;

 public function test_quest(){
       
    return $this->hasOne(Question::class,'id','question_id');

 }
   
}
