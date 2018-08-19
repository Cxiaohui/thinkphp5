<?php
// +----------------------------------------------------------------------
// | HisiPHP框架[基于ThinkPHP5开发]
// +----------------------------------------------------------------------
// | Copyright (c) 2016-2018 http://www.hisiphp.com
// +----------------------------------------------------------------------
// | HisiPHP承诺基础框架永久免费开源，您可用于学习和商用，但必须保留软件版权信息。
// +----------------------------------------------------------------------
// | Author: 橘子俊 <364666827@qq.com>，开发者QQ群：50304283
// +----------------------------------------------------------------------
namespace app\admin\controller;

use app\common\model\AdminMember as MemberModel;
use app\common\model\AdminMemberLevel as LevelModel;
use think\DB;
/**
 * 会员管理控制器
 * @package app\admin\controller
 */
class Payconfig extends Admin
{

    /**
     * 公告列表
     * @author 橘子俊 <364666827@qq.com>
     * @return mixed
     */


    public function index()
    {
        $where = [];
        $ob=Db::connect("db_sqlServer")->name("payconfig")->paginate(10);
        //执行分页查询
        $pages = $ob->render();
        $this->assign('data_list', $ob);
        $this->assign('pages', $pages);
        // 加载模板的同时，把查询的数据，以及分页时需要携带的参数传到模板上
        return $this->fetch();
    }
    /**
     * 添加
    @author 橘子俊 <364666827@qq.com>
     * @return mixed
     */
    public function add()
    {
        $Amount = $this->request->post("Amount");
        $RoomCard = $this->request->post("RoomCard");
        $GivingProportion = $this->request->post("GivingProportion");
        $Commission = $this->request->post("Commission");
        //$NewsID =$this->request->post("NewsID");
        $ID =input("ID");
        $ret = [];
        if ($ID) {
            $ret =  Db::connect("db_sqlServer")->name('payconfig')->where("ID", '=', $ID)->find();

        }
        $hav_ret = Db::connect("db_sqlServer")->name('payconfig')->find();

        $data = [
            'Amount'=>$Amount,
            'RoomCard'=>$RoomCard,
            'GivingProportion'=>$GivingProportion,
            'Commission'=>$Commission
        ];

        if ($ID && !empty($Amount) && !empty($RoomCard)) {
            Db::connect("db_sqlServer")->name('payconfig')->where("ID", '=', $ID)->update($data);

            Db::connect("db_sqlServer")->name('payconfig')->where("ID",">",0)->update(array('GivingProportion'=>$GivingProportion,'Commission'=>$Commission));

             $this->success('修改成功。');exit;

        }else if(!empty($Amount) && !empty($RoomCard)){
            $id =Db::connect("db_sqlServer")->name('payconfig')->insert($data);
            if ($id > 0) {
                //统一修改比例
                Db::connect("db_sqlServer")->name('payconfig')->where("ID",">",0)->update(['GivingProportion'=>$GivingProportion,'Commission'=>$Commission]);
                 $this->success('修改成功。');exit;
            }
        }
        $this->assign('ret', $ret);
        $this->assign('hav_ret', $hav_ret);
        $this->assign('ID', $ID);
        return $this->fetch('form');
    }


    public function dellevel()
    {
        $ID =input("ID");
        $ret_id= Db::connect("db_sqlServer")->name('payconfig')->where("ID",$ID)->delete();
        if ($ret_id<0) {
            return $this->error("删除失败");
        }
        return $this->success('删除成功');
    }




}
