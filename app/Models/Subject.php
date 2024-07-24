<?php

namespace App\Models;
use App\Models\Question;
use App\Models\Test;


use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Subject extends Model
{
    use HasFactory;

    public function questions()
    {
        return $this->hasMany(Question::class, 'subject_id' , 'id'); 
        //this relation will get all the data from questions table which have subject_id same as subjects table's id 
    }

    public function getTests()
    {
        return $this->hasMany(Test::class,'subject_id','id');
    }

}
