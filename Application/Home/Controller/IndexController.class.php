<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function index(){
        $content ="hello thinkphp";
        $this->assign("content",$content);
        $this->display();
    }
}