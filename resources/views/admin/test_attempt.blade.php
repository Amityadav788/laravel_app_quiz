<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="/assets/css/quiz.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="quiz-container" id="quiz">
<form method="POST" action="{{route('save.answer')}}">
<div class="quiz-header">
    <input type="hidden" name="_token" value="{{  csrf_token() }}">
    <input type="hidden" name="current_question_id" value="<?php echo $question_id; ?>">
    <input type="hidden" name="total_questions" value="<?php echo $total_questions; ?>">
    <input type="hidden" name="test_id" value="<?php echo $test_id; ?>">

    <?php if($questions){ ?>

          
        <h2 id="question"><?php echo $questions->question; ?></h2>
        <ul>
            <li>
                <input type="radio" id="a" value="<?php echo $questions->option1; ?>" name="answer" class="answer" required/>
                <label id="a_text" for="a"><?php echo $questions->option1; ?></label>
            </li>
            <li>
                <input type="radio" id="b" value="<?php echo $questions->option2; ?>" name="answer" class="answer" required/>
                <label id="b_text" for="b"><?php echo $questions->option2; ?></label>
            </li>
            <li>
                <input type="radio" id="c" value="<?php echo $questions->option3; ?>" name="answer" class="answer" required/>
                <label id="c_text" for="c"><?php echo $questions->option3; ?></label>
            </li>
            <li>
                <input type="radio" id="d" value="<?php echo $questions->option4; ?>" name="answer" class="answer" required/>
                <label id="d_text" for="d"><?php echo $questions->option4; ?></label>
            </li>
        </ul>
        <input type="hidden" name="question_id" value="<?php echo $questions->id; ?>">
    <button id="submit">Submit</button>

    </div>
    <?php } ?>
</form>    
</div>
</body>
</html>    