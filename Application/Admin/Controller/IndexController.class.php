<?php
namespace Admin\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function index(){
        $this->assign("hello","good,test");
        $this->display();
    }
}