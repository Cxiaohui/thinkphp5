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
use think\DB;
use app\common\util\Dir;
/**
 * 后台默认首页控制器
 * @package app\admin\controller
 */

class Api extends Common
{

    protected $msg = [
        'status' => '1', 'msg' => '', 'data' => [],
    ];
    /**
     * 首页
     * @author 橘子俊 <364666827@qq.com>
     * @return mixed
     */
    /*
     * 登录
     * */
    public function login()
    {
       var_dump($_POST);exit;
    }
    /*
   * 注册
   * */
    public function  register()
    {
        var_dump($_POST);exit;
    }

    /*
     * 短信
     * */
    public function  sms()
    {
        if (request()->isPost()) {
            $phone = input('phone');
            if (!preg_match('/^1([0-9]{9})/',$phone)) {// 手机号
                $this->msg['msg']="手机号格式不正确!";
                return json( $this->msg);
            }
            var_dump($this->msg['msg']);



            $data['Account'] 	 = 18771377732;
            $data['Pwd'] 	 	 = '87346330fa718364fdeb0a272';
            $data['Content'] 	 = "【飞鸽传书】您的验证码为：6940，2分钟内有效，请尽快验证。如非本人操作，请忽略本短信。";
            $data['Mobile']	 	 = $phone;
            $data['TemplateId']	 = 35067;
            $data['SignId']	 	 = "";



            $url="http://api.feige.ee/SmsService/Template";

            $res=post($url,$data);

            echo $res;exit;

        }


    }

    public function post($url, $data, $proxy = null, $timeout = 20) {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_USERAGENT, $_SERVER['HTTP_USER_AGENT']); //在HTTP请求中包含一个"User-Agent: "头的字符串。
        curl_setopt($curl, CURLOPT_HEADER, 0); //启用时会将头文件的信息作为数据流输出。
        curl_setopt($curl, CURLOPT_POST, true); //发送一个常规的Post请求
        curl_setopt($curl,  CURLOPT_POSTFIELDS, $data);//Post提交的数据包
        curl_setopt($curl, CURLOPT_FOLLOWLOCATION, 1); //启用时会将服务器服务器返回的"Location: "放在header中递归的返回给服务器，使用CURLOPT_MAXREDIRS可以限定递归返回的数量。
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true); //文件流形式
        curl_setopt($curl, CURLOPT_TIMEOUT, $timeout); //设置cURL允许执行的最长秒数。
        $content = curl_exec($curl);
        curl_close($curl);
        unset($curl);
        return $content;
    }


    /*
    * 用户信息
    * */
    public function  userInfo()
    {
        //判断页面是否提交
        if (request()->isPost()) {
            $data = [    //接受传递的参数
                'id' => input('id'),
            ];
            $rule = [
                'id' => 'require|number|require',
            ];
            $result = $this->validate($data, $rule);
            if (true !== $result) {
                $this->msg['msg']=$result;
                return json( $this->msg);
            }
            $id=(input('post.id'));
            /*	Db('表名') 数据库助手函数*/
            $map=[
               'id'=>$id
            ];
            $data_list =  DB::name("AdminMember")->where($map)->find();



            $this->msg['msg']=$result;
            $this->msg['data']=$data_list;
            return json( $this->msg);
        }
    }
}
