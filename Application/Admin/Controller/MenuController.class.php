<?php
namespace Admin\Controller;
use Think\Controller;
class MenuController extends Controller {
    private $parent_title="菜单设置";
    public function index(){

        $menus = M('menu')->select();
        $this->assign('list',$menus);
        $this->assign('parent_title',$this->parent_title);
        $this->assign('current_title',"菜单管理");
        $this->display();
    }

    public function add_menu()
    {

        $dd= U('index');
       // exit;
        if(IS_POST)
        {
            $menu=M('menu');
            $menu->create();
            $menu->parent_id=0;
            $data=$menu->add();
            if($data)
            {
                $this->redirect($dd);
            }
            else
            {
                $this->error();
            }
        }
        else
        {
            $this->assign('parent_title',$this->parent_title);
            $this->assign('current_title',"添加菜单");
            $this->display();
        }

    }
}