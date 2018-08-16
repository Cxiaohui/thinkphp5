<?php
namespace app\test\home;
use app\common\controller\Common;

class Test extends Common
{
    public function index()
    {

        echo 333;exit;
        return $this->fetch();
    }
}