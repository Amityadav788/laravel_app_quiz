<?php

namespace App\Admin\Controllers;

use OpenAdmin\Admin\Controllers\AdminController;
use OpenAdmin\Admin\Form;
use OpenAdmin\Admin\Grid;
use OpenAdmin\Admin\Show;
use \App\Models\Test;

class TestController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Test';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Test());

        $grid->column('id', __('Id'));
        $grid->column('test_name', __('Test name'));
        $grid->column('test_date', __('Test date'));
        $grid->column('subjects.title', __('Subject id'));
        $grid->column('question_id', __('Question id'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Test::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('test_name', __('Test name'));
        $show->field('test_date', __('Test date'));
        $show->field('subject_id', __('Subject id'));
        $show->field('question_id', __('Question id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Test());

        $form->text('test_name', __('Test name'));
        $form->text('test_date', __('Test date'));
        $form->text('subject_id', __('Subject id'));
        $form->textarea('question_id', __('Question id'));

        return $form;
    }
}
