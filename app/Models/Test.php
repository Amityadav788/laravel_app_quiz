<?php

namespace App\Models;
use App\Models\Question;
use App\Models\Subject;
use App\Models\Test_question;




use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Test extends Model
{
    use HasFactory;

    public function subjects()
    {
        return $this->hasone(Subject::class,'id', 'subject_id');
    }

    public function questions()
    {
        return $this->hasMany(Test_question::class,'test_id','id'); 

    } 
       
}
