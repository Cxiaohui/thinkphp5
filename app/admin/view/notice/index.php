<script src="__ADMIN_JS__/jquery-1.9.1.min.js"></script>
<div class="page-toolbar">

    <div class="layui-btn-group fl">
        <a href="{:url('add')}" class="layui-btn layui-btn-primary layui-icon layui-icon-add-circle-fine">&nbsp;添加</a>
<!--        <a data-href="{:url('status?table=admin_member&val=1')}" class="layui-btn layui-btn-primary j-page-btns layui-icon layui-icon-play" data-table="dataTable">&nbsp;启用</a>-->
<!--        <a data-href="{:url('status?table=admin_member&val=0')}" class="layui-btn layui-btn-primary j-page-btns layui-icon layui-icon-pause" data-table="dataTable">&nbsp;禁用</a>-->
<!--        <a data-href="{:url('del?table=admin_member')}" class="layui-btn layui-btn-primary j-page-btns confirm layui-icon layui-icon-close red">&nbsp;删除</a>-->
    </div>
</div>
<form id="pageListForm">
<div class="layui-form">
    <table class="layui-table mt10" lay-even="" lay-skin="row">
        <colgroup>
            <col width="50">
        </colgroup>
        <thead>
            <tr>
                <th>标题</th>
                <th>类别</th>
                <th>内容</th>
                <th>注册时间</th>
                <th>操作</th>
            </tr> 
        </thead>
        <tbody>

            {volist name="data_list" id="vo"}
            <tr>
                <td class="font12">{$vo['Subject']}</td>

                <?php if($vo["PopID"] ==1){?>
                    <td class="font12">新闻</td>
                <?php }elseif($vo["PopID"] ==2){?>
                    <td class="font12">公告</td>
                <?php }elseif($vo["PopID"] ==3){?>
                    <td class="font12">消息</td>
                <?php }else{?>
                   <td class="font12">滚动</td>
                <?php }?>
                <td class="font12">{$vo['Body']}</td>
                <td class="font12">{$vo['LastModifyDate']}</td>
                <td class="font12">
                    <div class="layui-btn-group">
                        <div class="layui-btn-group">

                            <a href="{:url('add?NewsID='.$vo['NewsID'])}" class="layui-btn layui-btn-primary layui-btn-sm"><i class="layui-icon">&#xe642;编辑</i></a>
                          <a href="{:url('dellevel?NewsID='.$vo['NewsID'])}" class="layui-btn layui-btn-primary layui-btn-sm j-tr-del"><i cs="layui-icon">&#xe640;删除</i></a>
                        </div>
                    </div>
                </td>
            </tr>
            {/volist}
        </tbody>
    </table>
    {$pages}
</div>
</form>
{include file="block/layui" /}

