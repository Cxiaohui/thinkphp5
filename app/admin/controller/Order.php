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
class Order extends Admin
{
    /**
     * 公告列表
     * @author 橘子俊 <364666827@qq.com>
     * @return mixed
     */
    public function index($q='',$OrderStatus='')
    {
        $map = [];
        if ($q) {
            if (is_numeric( $q ) ) {
                $map['GameID'] = $q;
            } else {// 用户名、昵称
                $map['NickName'] = ['like', '%'.$q.'%'];
            }
        }
        if ($OrderStatus) {
                $map['OrderStatus'] = $OrderStatus;
        }

        //保存搜索条件
        $where = [];
        //实例化需要的表
        $ob = Db::connect("db_sqlServer1")->name("onlineorder")->where($map)->paginate(10);
        //执行分页查询
        $pages = $ob->render();
        $this->assign('data_list', $ob);
        $this->assign('pages', $pages);
        // 加载模板的同时，把查询的数据，以及分页时需要携带的参数传到模板上
        return $this->fetch();
    }

}
