<?php
namespace app\test\admin;
use app\common\controller\Common;

class Index extends Common
{
    public function index()
    {
        echo 11;exit;
        return $this->fetch();
    }
}