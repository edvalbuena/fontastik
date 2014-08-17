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
                <h1 class="animated slideInDown">{_ Business Telephony _}</h1>
                <div class="list">
                  <ul>
                    <li class="animated slideInLeft first delay"><span><i class="fa fa fa-phone"></i> 
                              <a class="undecorate-link" href="/virtualoffice">{_ Virtual Office _}.</a></span></li>
                    <li class="animated slideInLeft second delay"><span><i class="fa fa-cogs"></i>
                              <a class="undecorate-link" href="/vpbx">{_ PBX CRM Integration _}.</a></span></li>
                    <li class="animated slideInLeft third delay"><span><i class="fa fa-slack"></i>
                              <a class="undecorate-link" href="/phonenumbers">{_ St-Petersburg phone numbers _}.</a></span></li>
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
                <h1 class="animated slideInDown">{_ Cloud Computing _}</h1>
                <div class="list">
                  <ul>
                    <li class="animated slideInLeft second delay"><span><i class="fa fa-database"></i> 
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
          <p style="font-size: 1.15em; text-align: center; color: #E86110;">
              <span class="hidden-md"><br /></span> 
              {_ Whoever You Are _},
              <br /> 
              <br /> 
              {_ Wherever You Are _},
              <br /> 
              <br /> 
              {_ You are a modern man _}. 
              <br />
              <br />
              <span style="color: #E86110;">{_ And it means _},<br />{_ COMMUNICATION IS EVERYTHING FOR YOU _}!</span>
              <br />
          </p> 
              <br />
              <br />
              <br />
          <div style="font-size: 1.15em; display: inline-block; color: #E86110;">
              {_ Take a look at your communication creatively _}.
              <br />
              {_ Let us know what are you dreaming about _}.
              <br />
              <br />
          </div>
          <div style="font-size: 1.3em; text-align: center; color: #E86110;">
              <br />  
              {_ 12 years of experience in the telecommunications market allows us to state _},
              <br />  
              {_ IN TELECOM WE CAN DO EVERYTHING _}!
              <br />  
              <br />  
          </div>
          <div class="info-board info-board-onnet">
            <h4>{_ Important info _}</h4>
            <p>{_ Our rates are ATTRACTIVE in deed _}
              <br />
              <br />
              826 {_ rub _}./{_ mo _}. - {_ monthly fee for Hosted PBX, regardless of the number of connected phones and trunks _}. 
              <br />
              {_ Work with pleasure, expand your business, we'll help you _}!</p>
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
        <div class="tab-content">
          <div class="tab-pane active" id="blog">
            {% for id in m.search[{query cat='news' sort='-rsc.publication_start' pagelen=4}] %}
            <div class="media">
              <a class="pull-left" href="{{ m.rsc[id].page_path }}">
                {% image m.rsc[id].depiction class="media-object" alt="Blog Message" %}
              </a>
              <div class="media-body">
                <h4 class="media-heading"><a href="{{ m.rsc[id].page_path }}">{{ m.rsc[id].title }}</a></h4>
                <a class="undecorate-link" href="{{ m.rsc[id].page_path }}">{{ m.rsc[id].summary }}</a>
              </div>
            </div>
            {% endfor %}
            <a href="#" class="read-more">{_ more news _}...</a>
          </div>
        </div>
        </div>
      </div>
    </div>
  </div>
    
{% endblock %}
