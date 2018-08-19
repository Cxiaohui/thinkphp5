<form class="layui-form layui-form-pane" action="{:url()}" method="post" id="editForm">

    <div class="layui-form-item">
        <label class="layui-form-label">金额</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input field-username" name="Amount" lay-verify="required" autocomplete="off" value="{$ret?$ret['Amount']:''}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">房卡数</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input field-username" name="RoomCard" lay-verify="required" autocomplete="off" value="{$ret?$ret['RoomCard']:''}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">饭钻比例(%)</label>
        <div class="layui-input-inline">
            <?php if($hav_ret){?>
                  <input type="text" class="layui-input field-username" name="GivingProportion" lay-verify="required" autocomplete="off" value="{$hav_ret?$hav_ret['GivingProportion']:''}">
            <?php }else{?>
                  <input type="text" class="layui-input field-username" name="GivingProportion" lay-verify="required" autocomplete="off" value="{$ret?$ret['GivingProportion']:''}">
            <?php } ?>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">代理返现(%)</label>
        <div class="layui-input-inline">
            <?php if($hav_ret){?>
                   <input type="text" class="layui-input field-username" name="Commission" lay-verify="required" autocomplete="off" value="{$hav_ret?$hav_ret['Commission']:''}">
            <?php }else{?>
                 <input type="text" class="layui-input field-username" name="Commission" lay-verify="required" autocomplete="off" value="{$ret?$ret->Commission:''}">
            <?php } ?>
        </div>
    </div>

    <input type="hidden" name="ID" value="{$ret?$ret['ID']:''}"/>
    <div class="layui-form-item">
        <div class="layui-input-block">

            <button type="submit" class="layui-btn layui-btn-normal" lay-submit="" lay-filter="formSubmit">提交</button>
            <a href="{:url('index')}" class="layui-btn layui-btn-primary ml10"><i class="aicon ai-fanhui"></i>返回</a>
        </div>
    </div>
</form>
{include file="block/layui" /}

