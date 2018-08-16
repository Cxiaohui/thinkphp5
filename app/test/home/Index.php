<?php
namespace app\test\home;
use app\common\controller\Common;

class Index extends Common
{
    public function index()
    {

        echo 22;
        return $this->fetch();
    }
}