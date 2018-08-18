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
// 后台函数库
use think\DB;
if (!function_exists('app_status')) {
    /**
     * 应用状态
     * @param string $v 状态值
     * @author 橘子俊 <364666827@qq.com>
     * @return array|null
     */
    function app_status($v = 0) {
        $arr = [];
        $arr[0] = '未安装';
        $arr[1] = '未启用';
        $arr[2] = '已启用';

        if (isset($arr[$v])) {
            return $arr[$v];
        }
        return '';
    }

}


//获取玩家房卡
function  getUserRoomCard($uid){
    if(!$uid){
        return 0;
    }
    $ob =Db::connect("db_sqlServer1")->name("userroomcard")->where('UserID',$uid)->find();
    return $ob['RoomCard'];
}
 function getSpreaderGameID($SpreaderID){
    if($SpreaderID ==0){
        return "无上级";
    }
    $ob = Db::connect('db_sqlServer')->table('accountsinfo')->where('UserID',$SpreaderID)->find();
    if($ob){
            return $ob['GameID'];
    }else{
        return "无上级";
    }
}


//
 function  getUserNikname($uid,$type="UserID"){
    if(!$uid){
        return 0;
    }
    if($type== "GameID" ){
        $ob = Db::connect('db_sqlServer')->table('accountsinfo')->where('GameID',$uid)->find();
    }else{
        $ob =  Db::connect('db_sqlServer')->table('accountsinfo')->where('UserID',$uid)->find();
    }
    if($ob){
        return $ob['NickName'];
    }else{
        return "";
    }

}
//获取上级游戏ID
function getSpreaderIDUserGameID($id){
    if($id ==0){
        return "";
    }
    $ob = Db::connect('db_sqlServer')->table('accountsinfo')->where('SpreaderID',$id)->find();
    if($ob){
        return $ob['GameID'];
    }else{
        return "无上级";
    }
}
