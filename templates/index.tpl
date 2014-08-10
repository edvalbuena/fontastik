{% extends "onnet_base.tpl" %}

{% block main %}

  <div class="wrapper">    
  <!-- Showcase
    ================ -->
    <div id="hp-slider" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#hp-slider" data-slide-to="0" class="active"></li>
        <li data-target="#hp-slider" data-slide-to="1"></li>
      </ol>

      <!-- Wrapper for slides -->
      <div class="carousel-inner">
        <!-- Slider #1 -->
        <div class="item active">
          <div class="container">
            <div class="row">
              <div class="col-md-8 col-sm-12">
                <h1 class="animated slideInDown">Бизнес Телефония</h1>
                <div class="list">
                  <ul>
                    <li class="animated slideInLeft first delay"><span><i class="fa fa fa-phone"></i> 
                              <a class="undecorate-link" href="/virtualoffice">Виртуальный офис.</a></span></li>
                    <li class="animated slideInLeft second delay"><span><i class="fa fa-cogs"></i>
                              <a class="undecorate-link" href="/hostedpbx">АТС для интеграции CRM.</a></span></li>
                    <li class="animated slideInLeft third delay"><span><i class="fa fa-slack"></i>
                              <a class="undecorate-link" href="/phonenumbers">Номера Москвы и Петербурга.</a></span></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- Slider #2 -->
        <div class="item">
          <div class="container">
            <div class="row">
              <div class="col-md-8 col-sm-12">
                <h1 class="animated slideInDown">ОБлачные вычисления</h1>
                <div class="list">
                  <ul>
                    <li class="animated slideInLeft second delay"><span><i class="fa fa-cloud"></i> 
                              <a class="undecorate-link" href="/virtualserver">{_ Virtual Server _}</a></span></li>
                    <li class="animated slideInLeft first delay"><span><i class="fa fa-cloud"></i> 
                              <a class="undecorate-link" href="/spla">{_ Hosted Microsoft Software _}</a></span></li>
                    <li class="animated slideInLeft third delay"><span><i class="fa fa-dropbox"></i> 
                              <a class="undecorate-link" href="/cloudstorage">{_ Cloud Storage _}</a></span></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Controls -->
      <a class="carousel-arrow carousel-arrow-prev" href="#hp-slider" data-slide="prev">
        <i class="fa fa-angle-left"></i>
      </a>
      <a class="carousel-arrow carousel-arrow-next" href="#hp-slider" data-slide="next">
        <i class="fa fa-angle-right"></i>
      </a>
    </div>
    <!-- / .hp-showcase -->

    <div class="container">
      {% include "services_row.tpl" %}
      <div class="row">
        <!-- Welcome message
            ================= -->
        <div class="col-md-8">
        <div class="block-header">
          <h2>
            <span class="title">{_ Welcome _}</span><span class="decoration"></span><span class="decoration"></span><span class="decoration"></span>
          </h2>
        </div>
          <img src="/lib/img/about.jpg" class="img-about img-responsive" alt="About">
          <p>
Кем бы Вы ни были, где бы Вы ни находились, Вы – современный человек. А это значит, что СВЯЗЬ ДЛЯ ВАС ВСЁ! Мы, коллектив ЗАО «ОнНет комьюникейшнс», предлагаем Вам подойти к организации связи в вашей компании или для себя лично творчески. Напишите нам на info@onnet.su или расскажите по телефону (812) 490-67-00, каким Вы видите идеально организованнный под Ваши нужды и потребности бизнес-процесс связи. 12-летний опыт работы на рынке телекоммуникаций позволяет нам утверждать: <br /> В ОБЛАСТИ СВЯЗИ МЫ МОЖЕМ ВСЁ!
          </p>
          <div class="info-board info-board-blue">
            <h4>{_ Important info _}</h4>
            <p>Наши ЦЕНЫ действительно ПРИВЛЕКАТЕЛЬНЫ 826 руб./мес. – абонентская плата за услугу Виртуальная АТС или Виртуальный офис независимо от количества подключенных номеров и абонентов. Работайте с удовольствием, расширяйте свой бизнес, а мы поможем!</p>
          </div>
        </div>
        <!-- Last updated
            ================== -->
        <div class="col-md-4">
        <div class="block-header">
          <h2>
            <span class="title"><span class="hidden-md">{_ Last _}</span> {_ updates _}</span>
            <span class="decoration"></span>
            <span class="decoration"></span>
            <span class="decoration"></span>
          </h2>
        </div>
        <ul class="nav nav-tabs">
          <li class="active"><a href="#blog" data-toggle="tab">{_ Blog _}</a></li>
          <li><a href="#comments" data-toggle="tab">{_ Comments _}</a></li>
          <li><a href="#events" data-toggle="tab">{_ Events _}</a></li>
        </ul>
        <div class="tab-content">
          <div class="tab-pane active" id="blog">
            <div class="media">
              <a class="pull-left" href="#">
                <img class="media-object" src="/lib/img/blog-1.jpg" alt="Blog Message">
              </a>
              <div class="media-body">
                <h4 class="media-heading"><a href="#">Story title</a></h4>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id ipsum varius, tincidunt odio nec, placerat enim.
              </div>
            </div>
            <div class="media">
              <a class="pull-left" href="#">
                <img class="media-object" src="/lib/img/blog-2.jpg" alt="Blog Message">
              </a>
              <div class="media-body">
                <h4 class="media-heading"><a href="#">Story title</a></h4>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id ipsum varius, tincidunt odio nec, placerat enim.
              </div>
            </div>
            <div class="media">
              <a class="pull-left" href="#">
                <img class="media-object" src="/lib/img/blog-3.jpg" alt="Blog Message">
              </a>
              <div class="media-body">
                <h4 class="media-heading"><a href="#">Story title</a></h4>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id ipsum varius, tincidunt odio nec, placerat enim.
              </div>
            </div>
            <a href="#" class="read-more">Read more stories...</a>
          </div>
          <div class="tab-pane" id="comments">
            <div class="media">
              <a class="pull-left" href="#">
                <img class="media-object" src="/lib/img/face1.jpg" alt="Blog Message">
              </a>
              <div class="media-body">
                <a href="#">Alex Smith</a> <span class="text-muted">20 minutes ago</span>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id ipsum varius...</p>
              </div>
            </div>
            <div class="media">
              <a class="pull-left" href="#">
                <img class="media-object" src="/lib/img/face2.jpg" alt="Blog Message">
              </a>
              <div class="media-body">
                <a href="#">Dan Smith</a> <span class="text-muted">1 hour ago</span>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id ipsum varius...</p>
              </div>
            </div>
            <div class="media">
              <a class="pull-left" href="#">
                <img class="media-object" src="/lib/img/face3.jpg" alt="Blog Message">
              </a>
              <div class="media-body">
                <a href="#">David Smith</a> <span class="text-muted">11/10/2013</span>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id ipsum varius...</p>
              </div>
            </div>
          </div>
          <div class="tab-pane" id="events">
            <h5>Moblie Web+DevCon San Francisco 2014 <small>January 28, 2014</small></h5>
            <p class="text-muted"><i class="fa fa-map-marker"></i> Kuala Lumpur, Malaysia</p>
            <hr>
            <h5>2013 The 2nd International Conference on Information and Intelligent Computing(ICIIC 2013) <small>December 29, 2013</small></h5>
            <p class="text-muted"><i class="fa fa-map-marker"></i> San Francisco, California, United States</p>
            <hr>
            <h5>International Conference on Cloud Computing and eGovernances 2014 <small>November 20, 2013</small></h5>
            <p class="text-muted"><i class="fa fa-map-marker"></i> Saigon, Ho Chi Minh, Vietnam</p>
          </div>
        </div>
        </div>
      </div>
    </div>
  </div>
    
{% endblock %}
