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
class Notice extends Admin
{

    /**
     * 公告列表
     * @author 橘子俊 <364666827@qq.com>
     * @return mixed
     */


    public function index()
    {
        //保存搜索条件
        $where = [];
        //实例化需要的表
        $ob = Db::connect("db_sqlServer3")->name("news")->paginate(10);
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
        $PopID = $this->request->post("PopID");
        $Subject = $this->request->post("Subject");
        $Body = $this->request->post("Body");
        //$NewsID =$this->request->post("NewsID");
        $NewsID =input("NewsID");
        $ret = [];
        if ($NewsID) {
            $ret =  Db::connect("db_sqlServer3")->name('news')->where("NewsID", '=', $NewsID)->find();

        }
        $data=[];
        if ($PopID && $Body) {
            $data = [
                'PopID' => $PopID,
                'Subject' => $Subject,
                'Body' => $Body,
                'UserID' => 1,
                'ClassID'=>3
            ];
            if ($NewsID && !empty($data)) {
                Db::connect("db_sqlServer3")->name('news')->where("NewsID", '=', $NewsID)->update($data);
                return json_encode(['status' => 1, 'msg' => "修改成功!"]);
            } else if(!empty($data)){
                $ret_id=Db::connect("db_sqlServer3")->name('news')->insert($data);
                if ($ret_id > 0) {
                    return json_encode(['status' => 1, 'msg' => "添加成功!"]);
                }
            }
        }
        $this->assign('ret', $ret);

        return $this->fetch('form');

    }

    /**
     * 修改会员
     * @author 橘子俊 <364666827@qq.com>
     * @return mixed
     */
    public function edit($id = 0)
    {
        if ($this->request->isPost()) {
            $data = $this->request->post();
            if ($data['mobile'] == 0) {
                unset($data['mobile']);
            }
            // 验证
            $result = $this->validate($data, 'AdminMember.update');
            if($result !== true) {
                return $this->error($result);
            }

            if (isset($data['password']) && empty($data['password'])) {
                unset($data['password']);
            }

            if (!MemberModel::update($data)) {
                return $this->error('修改失败！');
            }
            return $this->success('修改成功。');
        }

        $row = MemberModel::where('id', $id)->field('id,username,level_id,nick,email,mobile,expire_time')->find()->toArray();
        $this->assign('data_info', $row);
        $this->assign('level_option', LevelModel::getOption($row['level_id']));
        return $this->fetch('form');
    }

    public function dellevel()
    {
        $NewsID =input("NewsID");
        $ret_id=Db::connect("db_sqlServer3")->name('news')->where("NewsID",$NewsID)->delete();
        if ($ret_id<0) {
            return $this->error("删除失败");
        }
        return $this->success('删除成功');
    }




}
