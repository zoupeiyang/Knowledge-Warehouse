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

    /**
     * 增加菜单
     */
    public function menu_add()
    {
        if(IS_POST)
        {
            $menu=M('menu');
            $menu->create();
            if($menu->menu_type==1)
            {
                $menu->parent_id=0;
            }
            elseif($menu->menu_type==2)
            {
                $menu->parent_id=I('post.parent1_id');
            }
            elseif($menu->menu_type==3)
            {
                $menu->parent_id=I('post.parent2_id');
            }

            $data=$menu->add();
            if($data)
            {
                $this->redirect(U('index'));
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

    /**
     * 编辑菜单
     */
    public function menu_edit()
    {
        $menu=M('menu');
        if(IS_POST)
        {
            $data['id'] = I('post.id');
            $data['menu_type'] = I('post.menu_type');
            $data['menu_name'] = I('post.menu_name');
            $data['controller_name'] = I('post.controller_name');
            $data['module_name'] = I('post.module_name');
            $data['action_name'] = I('post.action_name');
            $data['param'] = I('post.param');
            $data['link_url'] = I('post.link_url');
            $data['is_show'] = I('post.is_show')==true?0:1;
            if($data['menu_type']==1)
            {
                $data['parent_id']==0;
            }
            elseif($data['menu_type']==2)
            {
                $data['parent_id']=I('post.parent1_id');
            }
            elseif($data['menu_type']==3)
            {
                $data['parent_id']=I('post.parent2_id');
            }
            $result=$menu->save($data);
            //恒等的方式判断返回false表示出错
            if($result===false)
            {
                $this->error();
            }
            else
            {
                //如果返回为0表示没有修改可更新
                $this->redirect(U('index'));
            }
        }
        else
        {
            $id=I('get.id');
            $is_group1_show="false";
            $is_group2_show="false";
            $menu_group1_id=-1;
            $menu_group2_id=-1;
            $menu=$menu->where('ID=%d',$id)->find();


            if($menu['menu_type']==2)
            {

                $menu_group1=M('menu')->field('id,menu_name,parent_id')->where('parent_id=%d',0)->select();
                $is_group1_show="true";
                $menu_group1_id=$menu['parent_id'];
               // \Think\Log::write("tes1t:".$menu_group1_id);
                $this->assign('menu_group1_id',$menu_group1_id);
                $this->assign('group1_list',$menu_group1);

            }
            if($menu['menu_type']==3)
            {
                $menu_parent=M('menu')->field('id,menu_name,parent_id')->where('id=%d',$menu['parent_id'])->find();
                $menu_group1_id=$menu_parent['parent_id'];
                $this->assign('menu_group1_id',$menu_group1_id);
                $menu_group2_id=$menu['parent_id'];
                $this->assign('menu_group2_id',$menu_group2_id);
                $menu_group1=M('menu')->field('id,menu_name,parent_id')->where('parent_id=%d',0)->select();
                $is_group1_show="true";
                $menu_group2=M('menu')->field('id,menu_name')->where('parent_id=%d',$menu_parent['parent_id'])->select();
                $this->assign('group1_list',$menu_group1);
                $this->assign('group2_list',$menu_group2);
                $is_group2_show="true";

            }
            $this->assign('single',$menu);
            $this->assign('parent_title',$this->parent_title);
            $this->assign('current_title',"编辑菜单");
            $this->assign('is_group1_show',$is_group1_show);
            $this->assign('is_group2_show',$is_group2_show);
            $this->display();
        }

    }

    /**
     * 获取等级菜单信息,如获得一级的菜单信息
     */
    public function get_menu_group()
    {
        $menu_parent_id =I('post.menu_parent_id');
        $menu=M('menu')->where('parent_id=%d',$menu_parent_id)->field('id,menu_name')->select();
        $this->ajaxReturn($menu);

    }
}