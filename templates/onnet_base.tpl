<!DOCTYPE html>
<html lang="{{ z_language|default:"ru"|escape }}">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="/lib/images/favicon.ico">

    <title>OnNet communications Inc.</title>

    <script src="//code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="//code.jquery.com/jquery-migrate-1.0.0.js"></script>
    <script src="//code.jquery.com/ui/1.11.0/jquery-ui.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui-touch-punch/0.2.3/jquery.ui.touch-punch.min.js"></script>

    <!-- Bootstrap -->

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>


    <!-- Custom styles for this template -->
    <link href='//fonts.googleapis.com/css?family=Tangerine:100,300,400&subset=latin,cyrillic' rel='stylesheet' type='text/css'>

    {% lib
          "css/z.modal.css"
    %}
    {% lib
          "css/z.growl.css"
          "css/jquery.loadmask.css"
          "css/animate.css"
          "css/elements.css"
          "css/custom.css"
          "css/onnet.css"
    %}
 

    {% lib "js/apps/zotonic-1.0.js" %}
    {% lib "js/apps/z.widgetmanager.js" %}
    {% lib "js/modules/z.notice.js" %}
    {% lib "js/z.dialog.bootstrap3.js" %}
    {# lib
          "js/modules/jquery.loadmask.js"
          "js/modules/livevalidation-1.3.js"
     #}
    {% lib 
          "js/modules/z.tooltip.js"
          "js/modules/z.feedback.js"
          "js/modules/z.formreplace.js"
          "js/modules/z.datepicker.js"
          "js/modules/z.menuedit.js"
          "js/modules/z.cropcenter.js"
          "js/modules/livevalidation-1.3.js"
          "js/modules/jquery.loadmask.js"
          "js/modules/jquery.timepicker.min.js"
     %}

    {% lib "css/datepicker3.css"  %}
    {% lib "js/bootstrap-datepicker.js"  %}
    {% lib "js/locales/bootstrap-datepicker.ru.js"  %}


    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="//cdn.datatables.net/plug-ins/be7019ee387/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">
    <script src="//cdn.datatables.net/1.10.1/js/jquery.dataTables.min.js"></script>
    <script src="//cdn.datatables.net/plug-ins/be7019ee387/integration/bootstrap/3/dataTables.bootstrap.js"></script>
    {% lib "js/jquery.dataTables.columnFilter.js" %}


    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    {% include "topmenu.tpl" %}

    {% block main %}{% endblock %}

    {% include "footer.tpl" %}
    {% include "legal.tpl" %}
    {% include "footer_js.tpl" %}
    {# include "google_anatytics.tpl" #}
    {# include "yandex_metrika.tpl" #}
    {# include "rambler_counter.tpl" #}

    {% script %}
  </body>
</html>
