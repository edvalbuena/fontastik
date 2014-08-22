{% extends "services.tpl" %}


{% block service_name %}{_ Virtual Server _}{% endblock %}


{% block service_description %}

<p>Виртуальный выделенный сервер (VPS/VDS - Virtual Private Server/Virtual Didicated Server) - это аналог физического сервера со всеми его возможностями, размещенный на современном оборудовании компании ОнНет комьюникейшнс. На наших мощных физических серверах одновременно запускается несколько виртуальных серверов, которые предоставляются пользователям в аренду. Каждый из виртуальных серверов ведет себя как отдельный изолированный сервер, имеющий свой собственный&nbsp; IP-адрес.</p>

<p>На Виртуальном выделенном сервере Вы можете устанавливать отдельную операционную систему и любое программное обеспечение, хранить и создавать неограниченное количество баз данных,&nbsp; сайтов, почтовых ящиков, размещать крупные проекты, требующие  специализированного программного обеспечения, организовать собственную АТС любой мощности. Вы ограничены только физическими ресурсами (объемом дискового пространства, объемом оперативной памяти) в соответствии с выбранным Вами тарифным планом, так как при разделении физического сервера компании ОнНет комьюникейшнс на несколько виртуальных серверов каждый VPS/VDS получает место на жестком диске и фиксированную оперативную память. При этом все ресурсы принадлежат Вам: Вы можете администрировать виртуальный сервер самостоятельно либо привлечь высококвалифицированных специалистов нашей компании.</p>


{% include "_paragraph_title.tpl" title=_"Преимущества услуги Виртуальный выделенный сервер" %}

<ul>
    <li> <p><strong>экономия</strong> - аренда виртуального сервера дешевле аренды физического сервера, кроме того, нет расходов на приобретение оборудования, его установку и наладку;</p> </li>
    <li> <p><strong>надежность и безопасность </strong>- все ресурсы принадлежат клиенту, который имеет полный контроль за хранимой информацией и процессами в системе;</p> </li>
    <li><p><strong>гибкость</strong> - установка любого программного обеспечения, возможность его конфигурации, изменения, добавления, удаления хранимых данных;</p></li>
    <li><p><strong>конфиденциальность</strong> - каждый виртуальный сервер полностью изолирован от других виртуальных серверов, находящихся на физическом сервере компании ОнНет комьюникейшнс и полностью отсутствует возможность получить доступ к файлам и процессам VPS/VDS с другого VPS/VDS;</p> </li>
    <li> <p><strong>единый документооборот компании</strong> на основе единого доступа сотрудников компании к базам данных и программному обеспечению;</p> </li>
    <li> <p><strong>отсутствие проблем с бухгалтерией</strong>&nbsp; -&nbsp; нет необходимости учета &quot;железа&quot; на балансе организации;</p> </li>
    <li> <p>оптимальное соотношение<span style="font-weight: bold;"> </span><strong>цена&nbsp; - качество.</strong></p> </li>
</ul>

{% include "_paragraph_title.tpl" title=_"Rates" %}

<table class="table table-bordered table-centered" style="max-width: 900px">
    <tbody>
        <tr class="th-onnet">
            <td width="40%" style="text-align: center;"><strong>Виртуальный сервер</strong></td>
            <td width="8%" style="text-align: center;"><strong>VPS </strong><strong>0.5</strong></td>
            <td width="8%" style="text-align: center;"><strong>VPS 1</strong></td>
            <td width="8%" style="text-align: center;"><strong>VPS 2</strong></td>
            <td width="8%" style="text-align: center;"><strong>VPS 3</strong></td>
            <td width="8%" style="text-align: center;"><strong>VPS 4</strong></td>
            <td width="8%" style="text-align: center;"><strong>VPS 5</strong></td>
            <td width="8%" style="text-align: center;"><strong>VPS 6</strong></td>
        </tr>
        <tr>
            <td width="40%">Объем оперативной памяти, Мб</td>
            <td width="8%" style="text-align: center;">&nbsp;512</td>
            <td width="8%" style="text-align: center;">1024</td>
            <td width="8%" style="text-align: center;">&nbsp;2048</td>
            <td width="8%" style="text-align: center;">3072</td>
            <td width="8%" style="text-align: center;">&nbsp;4096</td>
            <td width="8%" style="text-align: center;">&nbsp;5120</td>
            <td width="8%" style="text-align: center;">&nbsp;6144</td>
        </tr>
        <tr>
            <td width="40%">Объем дискового пространства, Гб</td>
            <td width="8%" style="text-align: center;">&nbsp;10</td>
            <td width="8%" style="text-align: center;">20</td>
            <td width="8%" style="text-align: center;">&nbsp;40</td>
            <td width="8%" style="text-align: center;">&nbsp;80</td>
            <td width="8%" style="text-align: center;">&nbsp;160</td>
            <td width="8%" style="text-align: center;">&nbsp;320</td>
            <td width="8%" style="text-align: center;">&nbsp;640</td>
        </tr>
        <tr>
            <td width="40%">Скорость подключения в Интернет, Мб/сек.</td>
            <td width="8%" style="text-align: center;">&nbsp;1</td>
            <td width="8%" style="text-align: center;">2</td>
            <td width="8%" style="text-align: center;">&nbsp;3</td>
            <td width="8%" style="text-align: center;">&nbsp;4</td>
            <td width="8%" style="text-align: center;">&nbsp;5</td>
            <td width="8%" style="text-align: center;">&nbsp;6</td>
            <td width="8%" style="text-align: center;">&nbsp;10</td>
        </tr>
        <tr>
            <td width="40%">Подключение услуги, руб.(без учета НДС)<sup>*</sup></td>
            <td width="8%" style="text-align: center;">&nbsp;2000</td>
            <td width="8%" style="text-align: center;">2000</td>
            <td width="8%" style="text-align: center;">&nbsp;2000</td>
            <td width="8%" style="text-align: center;">&nbsp;2000</td>
            <td width="8%" style="text-align: center;">&nbsp;2000</td>
            <td width="8%" style="text-align: center;">&nbsp;2000</td>
            <td width="8%" style="text-align: center;">&nbsp;2000</td>
        </tr>
        <tr>
            <td width="40%">Абонентская плата, руб./мес.(без учета НДС)</td>
            <td width="8%" style="text-align: center;">&nbsp;700</td>
            <td width="8%" style="text-align: center;">1000</td>
            <td width="8%" style="text-align: center;">&nbsp;2000</td>
            <td width="8%" style="text-align: center;">&nbsp;3000</td>
            <td width="8%" style="text-align: center;">4000</td>
            <td width="8%" style="text-align: center;">&nbsp;5000</td>
            <td width="8%" style="text-align: center;">&nbsp;6000</td>
        </tr>
    </tbody>
</table>

{% include "_paragraph_title.tpl" title=_"Вы получаете" %}

<ul>

    <li>доступ к своему программному обеспечению в любое время и из любой точки мира, где есть интернет;</li>

    <li>возможность установки любого программного обеспечения и отдельной операционной системы;</li>

    <li>возможность администрирования с правами суперпользователя либо экономию на IT-специалистах, доверив техническую поддержку и обслуживание специалистам компании ОнНет комьюникейшнс;</li>

    <li>возможность объединения сотрудников удаленных офисов в единую сеть с помощью VPN (англ. Virtual Private Network &mdash; виртуальная частная сеть) и работы сотрудников из любой точки планеты: дома, в офисе, в командировке, в заграничной поездке;</li>

    <li>возможность организации сервера терминального доступа для выноса важной  бизнес-информации из офиса в датацентр с гарантированным питанием, доступом в интернет и надежным дисковым хранилищем;</li>

    <li>возможность организации офисной почты;</li>

    <li>возможность организации собственной виртуальной АТС любой мощности;</li>

    <li>полный контроль над всеми сервисами и процессами, возможность запуска любых новых сервисов или же наоборот отключения ненужных;</li>

    <li>выбор площадки размещения (Россия - Санкт-Петербург, Европа - Лондон).</li>

</ul>

<p style="text-align: center; padding-top: 10px;">У Вас возникли вопросы по подключению услуги и выбору тарифа?</p>

<p style="text-align: center;">Обращайтесь к нам по телефону <span style="color: #3E7A8C; text-align: center;">(812) 490 67 00</span></p>

<p style="text-align: center;">или пишите нам на 
 <script language='JavaScript' type='text/javascript'>
 <!--
 var prefix = 'm&#97;&#105;lt&#111;:';
 var suffix = '';
 var attribs = '';
 var path = 'hr' + 'ef' + '=';
 var addy73655 = '&#105;nf&#111;' + '&#64;';
 addy73655 = addy73655 + '&#111;nn&#101;t' + '&#46;' + 's&#117;';
 document.write( '<a ' + path + '\'' + prefix + addy73655 + suffix + '\'' + attribs + '>' );
 document.write( addy73655 );
 document.write( '<\/a>' );
 //-->
 </script><script language='JavaScript' type='text/javascript'>
 <!--
 document.write( '<span style=\'display: none;\'>' );
 //-->
 </script>Данный адрес e-mail защищен от спам-ботов, Вам необходимо включить Javascript для его просмотра.
 <script language='JavaScript' type='text/javascript'>
 <!--
 document.write( '</' );
 document.write( 'span>' );
 //-->
 </script></p>


<p>
     
</p>
    
{% endblock %}
