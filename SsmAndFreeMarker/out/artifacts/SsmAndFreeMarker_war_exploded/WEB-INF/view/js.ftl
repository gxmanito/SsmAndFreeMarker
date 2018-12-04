<script type="text/javascript" src="${basePath}/static/libs/vue/vue.min.js"></script>
<script type="text/javascript" src="${basePath}/static/libs/iview/iview.min.js"></script>
<script type="text/javascript" src="${basePath}/static/libs/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
  var basePath = '${basePath}';
  $(document).ajaxError(function(event, request, settings) {
    if(vm){
      vm.$Notice.error({
        desc: '访问 ' + settings.url + '访问失败。可能是登录超时，请尝试重新打开。'
      });
    } else{
      alert('访问 ' + settings.url + '访问失败.可能是登录超时，请尝试重新打开。');
    }
  });
</script>
