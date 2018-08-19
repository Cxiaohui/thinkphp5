
<?php
namespace app\index\controller;
use app\common\controller\Common;
use think\cache\driver\Redis;
use think\DB;
class Pay extends Common
{

    //生成订单
    public function createOrder(Request $request){
        $amount= $request->input('amount');
        $goodname= $request->input('name');
        $gameid= $request->input('gameid');
        $pay_type= $request->input('pay_type');  // 1：微信 2：支付宝

        $amount=10;
        $gameid=100101;

        $payRype='zny';
       if(empty($goodname)){
           $goodname="金币礼包";
       }
        $PayConfig = DB::connection('sqlsrv')->table("PayConfig")->select("RoomCard")->where("Amount",'=',$amount)->first();
       if(!$PayConfig){
           return json_encode(['status'=>'1','msg'=>'支付金额需有误']);
       }
        $user = DB::connection('sqlsrv')->select("select [UserID],[Accounts] from   [AccountsInfo]   where [GameID]=$gameid");
        //$OrderID="ZFYAPP".date("Ymd",time()).time();
        if(!$user){
            return json_encode(['status'=>'1','msg'=>'游戏用户有误']);
        }
        $OrderID        = "PHP".date("YmdHis", time());		//商户订单号
        $p6_ordertime  	   = date("YmdHis", time());			//商户订单时间
        $data=[
             'OperUserID'=>0,
             'ShareID'=>"",
             'Accounts'=>$user[0]->Accounts,
             'OrderID'=>$OrderID,
             'GameID'=>$gameid,
             'UserID'=>$user[0]->UserID,
             'OrderAmount'=>$amount,
             'payAmount'=>$amount,
             'IPAddress'=>Helper::getIp(),
             'ShareID'=>600,
            'RoomCard'=>$PayConfig->RoomCard
        ];
        $id = DB::connection('sqlsrv1')->table('OnLineOrder')->insertGetId($data);
        //判断是安卓还是ios
        if(strpos($_SERVER['HTTP_USER_AGENT'], 'iPhone')||strpos($_SERVER['HTTP_USER_AGENT'], 'iPad')){
            $is_moblie=2;
        }else if(strpos($_SERVER['HTTP_USER_AGENT'], 'Android')){
            $is_moblie=3;
        }

        return view('game/createOrderOne',['p2_ordernumber'=>$OrderID,'p6_ordertime'=>$p6_ordertime,'GameID'=>$gameid,'p3_money'=>$amount,'pay_type'=>$pay_type,'is_moblie'=>$is_moblie]);
    }


    public function notify_url(Request $request){
        $compkey = "046809113138bGjGxPlr";
        echo 11;exit;
        $p1_yingyongnum = $request->input('p1_yingyongnum');
        $p2_ordernumber  = $request->input('p2_ordernumber');
        $p3_money           = $request->input('p3_money');
        $p4_zfstate           =$request->input('p4_zfstate');
        $p5_orderid          = $request->input('p5_orderid');
        $p6_productcode  =$request->input('p6_productcode');
        $p7_bank_card_code= $request->input('p7_bank_card_code');
        $p8_charset         =$request->input('p8_charset');
        $p9_signtype       = $request->input('p9_signtype');
        $p10_sign            =$request->input('p10_sign');
        $p11_pdesc         = $request->input('p11_pdesc');

        $presign = $p1_yingyongnum."&".$p2_ordernumber."&".$p3_money."&".$p4_zfstate."&".$p5_orderid."&".$p6_productcode."&".$p7_bank_card_code."&".$p8_charset."&".$p9_signtype."&".$p11_pdesc."&".$compkey;
        // echo $presign."<br/>";
        $sign =strtoupper(md5($presign));

        if ($sign ==$p10_sign && $p4_zfstate== "1")
        {
        $p2_ordernumber='PHP20180808134629';
        $p1_yingyongnum="ceshi";
        $log = new Logger('register');
         $log->pushHandler(new StreamHandler(storage_path('logs/reg.log'),Logger::INFO) );
        	$log->addInfo('回调p1_yingyongnum:'.$p1_yingyongnum);
           $log->addInfo('回调p2_ordernumber:'.$p2_ordernumber);

exit;
        $p2_ordernumber='PHP20180808134629';
            if($p2_ordernumber){
                $order = DB::connection('sqlsrv1')->table("OnLineOrder")->where("OrderID",'=',$p2_ordernumber)->where("OrderStatus",'=',0)->first();
                $data=[
                    'OrderStatus'=>1
                ];
                $id = DB::connection('sqlsrv1')->table('OnLineOrder')->where("OrderID",'=',$p2_ordernumber)->update($data);
                //发卡
                $is_band=DB::connection('sqlsrv')->table('AccountsInfo')->select("SpreaderID","AgentID")->where("UserID",'=',$order->UserID)->first();
                if($is_band->SpreaderID>0 || $is_band->AgentID >0){
                    $id = DB::connection('sqlsrv1')->table('UserRoomCard')->where("UserID",'=',$order->UserID)->increment('RoomCard', ($order->RoomCard*1.1));
                }else{
                    $id = DB::connection('sqlsrv1')->table('UserRoomCard')->where("UserID",'=',$order->UserID)->increment('RoomCard', ($order->RoomCard));
                }

                if($id){
                    echo "success";
                }
            }
        }

    }

    public function callback(Request $request){
        $compkey = "046809113138bGjGxPlr";
        $p1_yingyongnum = $request->input('p1_yingyongnum');
        $p2_ordernumber  = $request->input('p2_ordernumber');
        $p3_money           = $request->input('p3_money');
        $p4_zfstate           =$request->input('p4_zfstate');
        $p5_orderid          = $request->input('p5_orderid');
        $p6_productcode  =$request->input('p6_productcode');
        $p7_bank_card_code= $request->input('p7_bank_card_code');
        $p8_charset         =$request->input('p8_charset');
        $p9_signtype       = $request->input('p9_signtype');
        $p10_sign            =$request->input('p10_sign');
        $p11_pdesc         = $request->input('p11_pdesc');

        $presign = $p1_yingyongnum."&".$p2_ordernumber."&".$p3_money."&".$p4_zfstate."&".$p5_orderid."&".$p6_productcode."&".$p7_bank_card_code."&".$p8_charset."&".$p9_signtype."&".$p11_pdesc."&".$compkey;
        // echo $presign."<br/>";
        $sign =strtoupper(md5($presign));

        if ($sign ==$p10_sign && $p4_zfstate== "1")
        {
            echo "支付成功";
        }

    }


}

