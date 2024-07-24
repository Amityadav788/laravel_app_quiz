<?php

namespace App\Models;
use App\Models\Subject;
use App\Models\Test;
use App\Models\Test_question;




use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Question extends Model
{
    use HasFactory;

    public function subject()
    {
        return $this->hasone(Subject::class,'id', 'subject_id');
    }
    
   
}
