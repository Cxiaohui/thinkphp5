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
namespace app\index\controller;
use app\common\controller\Common;
use think\cache\driver\Redis;


use think\DB;
/**
 * 后台默认首页控制器
 * @package app\admin\controller
 */

class Index extends Common
{
    /**
     * 首页
     * @author 橘子俊 <364666827@qq.com>
     * @return mixed
     */
    public function index()
    {
             //测试Sqlservel链接
            // $test1=Db::connect("db_sqlServer")->name("accountsinfo")->select();
			 //var_dump($test1);
             //测试oracle链接
             //$test2=Db::connect("db_Oracle")->name("accountsinfo")->select();

            return $this->fetch();
    }

    public function testRedis(){
        $redis = new Redis();
        var_dump($redis);exit;
        $redis->set('test','hello redis');
        echo $redis->get('test');
    }
}
