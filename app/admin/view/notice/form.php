<form class="layui-form layui-form-pane" action="{:url()}" method="post" id="editForm">
    <div class="layui-form-item">
        <label class="layui-form-label">公告类型</label>
        <div class="layui-input-inline">
            <select name="PopID" class="field-level_id" type="select">
                <option value="1" <?php if($ret && $ret['PopID'] == 1){?>selected="selected"<?php } ?>>新闻</option>
                <option value="3" <?php if($ret && $ret['PopID']  == 3){?>selected="selected"<?php } ?>>消息</option>
                <option value="2" <?php if($ret && $ret['PopID']  == 2){?>selected="selected"<?php } ?>>公告</option>
                <option value="4" <?php if($ret && $ret['PopID']  == 4){?>selected="selected"<?php } ?>>滚动</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">标题</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input field-username" name="Subject" lay-verify="required" autocomplete="off" value="{$ret?$ret['Subject']:''}">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">内容</label>
        <div class="">
            <textarea cols="200" rows="" id="textarea2" name="Body" value="">{$ret?$ret['Body']:''}</textarea>
        </div>
    </div>
    <input type="hidden" name="NewsID" value="{$ret?$ret['NewsID']:''}"/>
    <div class="layui-form-item">
        <div class="layui-input-block">

            <button type="submit" class="layui-btn layui-btn-normal" lay-submit="" lay-filter="formSubmit">提交</button>
            <a href="{:url('index')}" class="layui-btn layui-btn-primary ml10"><i class="aicon ai-fanhui"></i>返回</a>
        </div>
    </div>
</form>
{include file="block/layui" /}

<script src="__ADMIN_JS__/footer.js"></script>