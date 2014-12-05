{% extends "services.tpl" %}


{% block service_name %}{_ Hosted PBX _}{% endblock %}


{% block service_description %}

<ul>
    <li>
    <p>запись разговоров;</p>
    </li>
    <li>
    <p>перехват и перевод звонков;</p>
    </li>
    <li>
    <p>электронный секретарь с голосовым приветствием и навигацией;</p>
    </li>
    <li>
    <p>прием факса и пересылка его на Ваш электронный адрес;</p>
    </li>
    <li>
    <p>возможность подключения неограниченного количества телефонных номеров;</p>
    </li>
    <li>
    <p>подключение телефонных линий и номеров третьих операторов связи по протоколу SIP.</p>
    </li>
</ul>

{% include "_paragraph_title.tpl" title=_"Rates" %}

<table class="table table-bordered" style="max-width: 800px; margin: 0 auto !important; float: none !important;" border="0">
    <thead>
        <tr class="th-onnet">
            <th style="text-align: center;">Виртуальная АТС</th>
            <th style="text-align: center;">&nbsp;Цена, руб. (без учета НДС)</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td >Подключение услуги</td>
            <td style="text-align: center;">2 000</td>
        </tr>
        <tr>
            <td >Подключение номера ГТС</td>
            <td style="text-align: center;"><a href="/freenumbers">от 1 000</a></td>
        </tr>
        <tr>
            <td >Абонентская плата за услугу</td>
            <td style="text-align: center;">700</td>
        </tr>
        <tr>
            <td >Переадресация на номера ГТС Санкт-Петербурга, руб./мин.</td>
            <td style="text-align: center;">0,50</td>
        </tr>
        <tr>
            <td >Переадресация на мобильные номера Санкт-Петербурга, руб./мин.</td>
            <td style="text-align: center;">1,50</td>
        </tr>
        <tr>
            <td >Настройка оборудование клиента, руб. за порт</td>
            <td style="text-align: center;">500</td>
        </tr>
    </tbody>
</table>
<p>
     
</p>
<div class="info-board info-board-onnet">
    <p>
<h4>{_ Important info _}</h4>
	Абонентская плата за услугу Виртуальная АТС не зависит от количества подключенных номеров; абонентская плата за подключенные номера отсутствует.
	Мы реализуем данную услугу на свободном ПО <a target="_blank" style="text-decoration: none;" href="http://www.freepbx.org">FreePBX</a>, что позволяет Вам, при надлежащем опыте и желании, самостоятельно администрировать систему; позволяет осуществлять интеграцию с различными CRM системами (например <a target="_blank" style="text-decoration: none;" href="https://novacrm.ru">NovaCRM</a>); избавляет Вас от лицензионных платежей.
	Мы подключаем транки (номера) любых сторонних операторов, работающих по SIP-протоколу.
    </p>
</div>
<p>
     
</p>
    
{% endblock %}
