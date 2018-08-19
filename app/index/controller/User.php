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
class User
{

    public function login()
    {
        echo 111;exit;
        return view('game.index');
    }


    //推广图
     public function getQrCode()
    {
        $GameID = session('agentUser')->GameID;
        $list=DB::connection('sqlsrv4')->table("qrCode")->get();
        if($list){
            $code=public_path("phpqrcodes/phpqrcode_$GameID.png");
            if (file_exists($code)) {
                $code="phpqrcodes/phpqrcode0_$GameID.png";
                return view('game.qrCode',['title' => '推广图','list'=>$list,'code'=>$code]);
            }
            $qrcode = new BaconQrCodeGenerator;

            $qrcode->format('png');

            $qrcode->size(100)->margin(0)->generate('http://bole.wmiduo.com/Mobile/WRegister.aspx?GameID='.$GameID,$code);
            $code="phpqrcodes/phpqrcode_$GameID.png";
        }

        $image_1 = imagecreatefrompng($list[0]->Images);
        $image_2 = imagecreatefrompng(public_path("phpqrcodes/phpqrcode_$GameID.png"));
        $image_3 = imageCreatetruecolor(imagesx($image_1),imagesy($image_1));
        $color = imagecolorallocate($image_3, 255, 255, 255);
        imagefill($image_3, 0, 0, $color);
        imageColorTransparent($image_3, $color);
        imagecopyresampled($image_3,$image_1,0,0,0,0,imagesx($image_1),imagesy($image_1),imagesx($image_1),imagesy($image_1));
        imagecopymerge($image_3,$image_2, 65,280,0,0,imagesx($image_2),imagesy($image_2), 100);
        //将画布保存到指定的gif文件
        imagepng($image_3, "phpqrcodes/phpqrcode0_$GameID.png");
        $code="phpqrcodes/phpqrcode0_$GameID.png";
        return view('game.qrCode',['title' => '推广图','list'=>$list,'code'=>$code]);
    }

    //退出
    public function loginOut(){
        session()->flush();
        return redirect('/game/login');
    }

    // 微信提现
    public function getBonusMoney(Request $request){
        $grant_type='client_credential';
        $appid='wxaa1fc76067bf0bfe';
        $secret='0c66a8e5af8b603c6d7b93c25aa6a455';


        $url="https://api.weixin.qq.com/cgi-bin/token?grant_type=".$grant_type."&appid=".$appid."&secret=".$secret;
        $data=Helper::curl_get($url);

    }

}
