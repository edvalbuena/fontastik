{% extends "services.tpl" %}


{% block service_name %}{_ Virtual Office _}{% endblock %}


{% block service_description %}

<ul>
    <li> <p>многоканальный телефонный номер;</p> </li>
    <li> <p>переадресация на мобильные и городские номера;</p> </li>
    <li> <p>прием голосовых сообщений позвонившего;</p> </li>
    <li> <p>прием факса на номер Вашего телефона и пересылка его на Ваш электронный адрес;</p> </li>
    <li> <p>профессиональный секретарь с голосовым приветствием и навигацией;</p> </li>
    <li> <p>голосовая почта;</p> </li>
    <li> <p>обратный вызов (Call-back).</p> </li>
</ul>

{% include "_paragraph_title.tpl" title=_"Преимущества Виртуального офиса" %}

<ul>
    <li> 
        <p>Куда бы Вы не перемещались, Вы можете &quot;взять с собой&quot; свой &quot;городской офисный номер&quot;, а следовательно не потеряете контакты деловых партнеров, клиентов, а также друзей и близких;</p>
    </li>
    <li><p>У Ваших клиентов создается впечатление, что Вы находитесь в офисе, так как Ваш городской номер всегда с Вами, где бы Вы не находились;</p></li> 
    <li><p>Номер многоканальный, а следовательно Ваши клиенты не услышат сигнал &quot;занято&quot;</p> </li>
    <li><p>Вы экономите время и средства при решении вопросов, связанных с телефонизацией офиса, так как Вам не надо приобретать специальное оборудование.</p></li>
</ul>

{% include "_paragraph_title.tpl" title=_"Rates" %}

<table class="table table-bordered table-hover table-centered" style="max-width: 800px;">
    <thead>
        <tr class="th-onnet">
            <th style="text-align: center;">Название услуги</th>
            <th style="text-align: center;">&nbsp;Цена, руб. (без учета НДС)</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td >Подключение услуги</td>
            <td style="text-align: center;">бесплатно</td>
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
    </tbody>
</table>
<p>
     
</p>
    
{% endblock %}
