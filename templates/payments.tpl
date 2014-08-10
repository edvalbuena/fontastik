{% extends "services.tpl" %}

{% block service_name %}{_ Payments _}{% endblock %}

{% block service_description %}

<div class="info-board info-board-orange">
    <p><h4>{_ How to make payment _}</h4></p>
</div>

<p><strong>Вы можете оплатить услуги следующими способами:</strong></p>

<ul>
    <li><span>безналичным платежом с р./сч. Вашей организации на наш р./сч. (для юр. лиц);</span></li>
    <li><span>безналичным платежом с личного р./сч. на наш р./сч. (для физ. лиц);</span></li> 
    <li><span>перечислить денежные средства на наш р./сч. через Сбербанк;</span></li>
    <li><span>осуществить платеж из Личного кабинета через электронные платежные системы (кредитные карты, электронные деньги).</span></li>
</ul>

<div class="center-block" style="max-width: 800px">
<ul class="list-inline" style="margin: 20px;">
    <li class="hidden-xs">
         <img style="max-width: 100%; height: auto;" alt="Система электронных платежей" src="/lib/images/assist_logo.gif">
    </li>
    <li>
         <img style="max-width: 100%; height: auto;" alt="Система электронных платежей" src="/lib/images/logo-dengionline_rus.png">
    </li>
    <li>
         <img style="max-width: 100%; height: auto;" alt="Система электронных платежей" src="/lib/images/yandex-logo.png">
    </li>
</ul>
</div>

    <p>В случае оплаты безналичным платежом в назначении платежа необходимо указывать  № договора  и/или № документа-основания платежа (счет, счет-фактура), а так же сумму НДС.</p>

    <p>В случае, если Вы заключили договор на организацию у которой пока нет р./сч., оплачиваете услуги с р./сч. другого юр. лица (не от лица которого заключен договор), физ. лицо оплачивает услуги за юр. лицо в назначении платежа необходимо указать Выгодоприобретателя. Назначение платежа будет выглядеть следующим образом: «Оплата услуг связи по договору №______ от ______20__г. за Наименование Выгодоприобретателя (например ООО «Май»), в том числе НДС_______.»</p>

<div class="info-board info-board-blue">
    <p><h4>{_ Сроки подключения (активации) услуги _}</h4></p>
</div>

    <p><b>Первичное подключение услуги:</b></p>
    <ul>
        <li>1-2 рабочих дня с момента оплаты услуги (любым способом)</li>
    </ul>

    <p><b>Пополнение баланса по действующим договорам:</b></p>
    <ul>
        <li><p>в течение 15 минут после проведения оплаты через систему ASSIST, Деньги.Online, Яндекс.Деньги;</p></li>
        <li><p>в конце рабочего дня поступления д./с. на наш р./сч. при оплате любым другим способом.</p></li>
    </ul>

<div class="info-board info-board-red">
    <p><h4>{_ Отказ от услуги (возврат денежных средств) _}</h4></p>
</div>


    <p>Отказ от услуги оформляется дополнительным соглашением к действующему договору (соглашением о расторжение договора).</p>
    <p>Возврат денежных средств осуществляется по письму контрагента с указанием реквизитов для перечисления в течение 3-х рабочих дней со дня получения письма-требования (при наличии согласованного сторонами акта сверки взаиморасчетов)</p>

{% endblock %}
