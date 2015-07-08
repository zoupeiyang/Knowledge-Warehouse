<?php
namespace Admin\Controller;
use Think\Controller;
class MenuController extends Controller {
    private $parent_title="系统设置";
    public function index(){

        $menus = M('menu')->select();
        $this->assign('list',$menus);
        $this->assign('parent_title',$this->parent_title);
        $this->assign('current_title',"菜单管理");
        $this->display();
    }

    public function add_menu()
    {
        $this->assign('parent_title',$this->parent_title);
        $this->assign('current_title',"添加菜单");
        $this->display();
    }
}