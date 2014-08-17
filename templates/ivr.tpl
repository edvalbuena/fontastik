{% extends "services.tpl" %}


{% block service_name %}{_ IVR _}{% endblock %}

{% block service_description %}

<script language="JavaScript">
var tTextPrivetFlag = 0;
function FieldClear (sField){
switch (sField){case'tTextPrivet':if(tTextPrivetFlag==0){eval("document.forms.frmCallCenter."+sField+".value=''");tTextPrivetFlag=1;} break;default:}
return (true);}
</script>
<p><style type="text/css">
img {border:0;}
p {padding:10px 0px 15px 0px;margin:0px;}
form {margin:0px 0px 0px 0px;}
table.callcenter {background-color:#FFFFFF;width:450px;padding:10px 0px 10px 0px;}
td.tblhdr {background-color:#FFF18F;padding:10px 10px 10px 10px;font-size:12px;color:#000000; font-family:Arial,sans-serif,Helvetica;text-decoration:none;font-weight:bold;}
td.tbltxt {background-color:#EAECFF;padding:10px 10px 10px 10px;font-size:12px;color:#000000; font-family:Arial,sans-serif,Helvetica;text-decoration:none;font-weight:bold;}
td.button {background-color:#EAECFF;padding:20px 10px 20px 20px;}
input.sendbtn {background-color:#EEEEEE;color:#000000;font-size:12px; font-family:Arial,sans-serif,Helvetica;width:130px;height:22px;}
input.txtfio {font-size:12px;color:#000000;font-family:Arial,Helvetica; text-decoration:none;letter-spacing:0px;width:300px;height:22px;}
input.txttime {font-size:12px;color:#000000;font-family:Arial,Helvetica; text-decoration:none;letter-spacing:0px;width:30px;height:22px;}
textarea.txtinf {font-size:12px;color:#000000;font-family:Arial,Helvetica; text-decoration:none;letter-spacing:0px;width:300px;height:120px;}
textarea.txtprivet	{font-size:12px;color:#000000;font-family:Arial,Helvetica; text-decoration:none;letter-spacing:0px;width:380px;height:180px;}
textarea.txtcomments {font-size:12px;color:#000000;font-family:Arial,Helvetica; text-decoration:none;letter-spacing:0px;width:380px;height:100px;}
select.payment {font-size:12px;color:#000000;font-family:Arial,Helvetica; text-decoration:none;letter-spacing:0px;width:300px;height:23px;}
input.file {font-size:12px;color:#000000;font-family:Arial,Helvetica; text-decoration:none;letter-spacing:0px;width:180px;height:22px;}
a.link {font-size:12px;color:#0000FF;font-family:Tahoma,Arial,Helvetica,sans-serif; text-decoration:underline;font-weight:normal;}
.header {font-size:20px;color:#000000;font-family:Arial,sans-serif,Helvetica; text-decoration:none;font-weight:bold; padding:5px 0px 5px 0px;}
.title {font-size:12px;color:#000000;font-family:Arial,sans-serif,Helvetica; text-decoration:none;font-weight:normal; padding:10px 0px 10px 0px;}
.costs {font-size:12px;color:#000000;font-family:Arial,sans-serif,Helvetica; text-decoration:none;font-weight:bold; padding:5px 0px 5px 0px;}
.caption {font-size:18px;color:#000000;font-family:Arial,sans-serif,Helvetica; text-decoration:none;font-weight:bold; padding:20px 0px 10px 0px;}
.subtext {font-size:11px;color:#808080;font-family:Arial,sans-serif,Helvetica; text-decoration:none;font-weight:normal; padding:0px 0px 10px 0px;}
.text {font-size:12px;color:#000000;font-family:Arial,sans-serif,Helvetica; text-decoration:none;font-weight:normal; padding:10px 0px 5px 0px;}
.inputfld {font-size:12px;color:#000000;font-family:Arial,sans-serif,Helvetica; text-decoration:none;font-weight:normal; padding:0px 0px 0px 0px;}
.btext {font-size:12px;color:#000000;font-family:Tahoma,Arial,Helvetica,sans-serif; text-decoration:none;font-weight:normal;}
.textsmheader {font-size:11px;color:#000000;font-family:Tahoma,Arial,Helvetica,sans-serif; text-decoration:none;font-weight:bold;}
</style></p>
<form name="frmCallCenter" action="http://ivrplus.ru/callcenters/callcenterssubmit.php" method="post" enctype="multipart/form-data">
    <input type="Hidden" name="tCallCenterCharset" value="utf-8" /> <input type="Hidden" name="tCallCenterName" value="ЗАО 'ОнНет Комьюникейшнс'" /> <input type="Hidden" name="tCallCenterEmail" value="info@onnet.su" /> <input type="Hidden" name="tCSoundFormat" value="wav, 44100 Гц, 16 бит, моно; wav, 8000 Гц, 8 бит, моно; mp3, 192 Кбит/с, моно" />
    <table border="0" cellspacing="0" cellpadding="0" align="center" width="450">
        <tbody>
            <tr>
                <td align="left" width="100%" valign="top" class="header">Запись голосового приветствия профессиональными дикторами</td>
            </tr>
            <tr>
                <td align="center"><img src="http://ivrplus.ru/protection/start.php" border="0" width="1" height="1" alt="" /></td>
            </tr>
            <tr>
                <td align="left" valign="top" class="btext" style="padding:10px 0px 0px 0px">&nbsp;</td>
            </tr>
            <tr>
                <td align="center" valign="top"><img src="http://ivrplus.ru/images/callcenter.jpg" alt="Запись голосового приветствия" width="450" height="100" /></td>
            </tr>
            <tr>
                <td align="left" valign="top" class="btext" style="padding:10px 0px 0px 0px">&nbsp;</td>
            </tr>
            <tr>
                <td align="left" valign="top" class="title">Профессионально записанное голосовое приветствие создает благоприятное впечатление от&nbsp;звонка в&nbsp;организацию. Абонент на&nbsp;другом конце провода должен поверить, что обратился &laquo;по&nbsp;адресу&raquo;. Такой эффект достигается правильным подбором дикторского голоса, используемой лексики и&nbsp;музыкального сопровождения.<br />
                <br />
                Запись голосового приветствия ведет партнер ЗАО &quot;ОнНет комьюникейшнс&quot; студия &laquo;<a href="http://www.ivrplus.ru/" target="_blank">IVR Плюс</a>&raquo; 	<br />
                Телефон студии: (812) 312-00-55 	<br />
                Время работы: с 13:00 до 20:00 по будням.</td>
            </tr>
            <tr>
                <td align="left" valign="top" class="costs">Стоимость записи:</td>
            </tr>
            <tr>
                <td align="left" valign="top">
                <table border="0" cellspacing="6" cellpadding="6" align="center" width="450">
                    <tbody>
                        <tr>
                            <td align="left" width="100%" class="tblhdr">Голосовое приветствие до 40 сек.</td>
                            <td align="center" class="tblhdr">Русский</td>
                            <td align="center" class="tblhdr">Русский + английский</td>
                        </tr>
                        <tr>
                            <td align="left" width="100%" class="tbltxt">без фоновой музыки</td>
                            <td align="center" class="tbltxt" nowrap="">2100 руб.</td>
                            <td align="center" class="tbltxt" nowrap="">5000 руб.</td>
                        </tr>
                        <tr>
                            <td align="left" width="100%" class="tbltxt">с фоновой музыкой</td>
                            <td align="center" class="tbltxt" nowrap="">2600 руб.</td>
                            <td align="center" class="tbltxt" nowrap="">5400 руб.</td>
                        </tr>
                    </tbody>
                </table>
                </td>
            </tr>
            <tr>
                <td align="left" valign="top" class="caption">1. Выберите голос диктора</td>
            </tr>
            <tr>
                <td align="left" valign="top">
                <table border="0" cellpadding="0" cellspacing="0" align="center" width="100%">
                    <tbody>
                        <tr>
                            <td><img src="http://ivrplus.ru/images/sp.gif" alt="" width="1" height="10" /></td>
                        </tr>
                        <tr>
                            <td align="center" valign="top">
                            <table border="0" cellpadding="0" cellpacing="0" width="100%" align="center">
                                <tbody>
                                    <tr>
                                        <td class="textsmheader">Женские голоса</td>
                                    </tr>
                                    <tr>
                                        <td width="100%" align="center" valign="top">
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
                                            <tbody>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbVoice" value="6" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/voices/Bochanova.mp3" title="Bochanova" class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap="">Бочанова Юля</td>
                                                    <td class="btext" align="left" style="padding-left:10px;" width="100%">сопрано</td>
                                                </tr>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbVoice" value="7" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/voices/Geller.mp3" title="Geller" class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap="">Геллер Анна</td>
                                                    <td class="btext" align="left" style="padding-left:10px;" width="100%">меццо-сопрано</td>
                                                </tr>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbVoice" value="19" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/voices/Borisenko .mp3" title="Borisenko " class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap="">Борисенко Людмила</td>
                                                    <td class="btext" align="left" style="padding-left:10px;" width="100%">сопрано</td>
                                                </tr>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbVoice" value="8" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/voices/Brjezovskaya.mp3" title="Brjezovskaya" class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap="">Бржезовская Ксения</td>
                                                    <td class="btext" align="left" style="padding-left:10px;" width="100%">сопрано</td>
                                                </tr>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbVoice" value="9" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/voices/Shulman.mp3" title="Shulman" class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap="">Шульман Лена</td>
                                                    <td class="btext" align="left" style="padding-left:10px;" width="100%">меццо-сопрано</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            </td>
                        </tr>
                        <tr>
                            <td><img src="http://ivrplus.ru/images/sp.gif" alt="" width="1" height="10" /></td>
                        </tr>
                        <tr>
                            <td align="center" valign="top">
                            <table border="0" cellpadding="0" cellpacing="0" width="100%" align="center">
                                <tbody>
                                    <tr>
                                        <td class="textsmheader">Мужские голоса</td>
                                    </tr>
                                    <tr>
                                        <td width="100%" align="center" valign="top">
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
                                            <tbody>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbVoice" value="20" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/voices/Soloviev.mp3" title="Soloviev" class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap="">Соловьев Валерий</td>
                                                    <td class="btext" align="left" style="padding-left:10px;" width="100%">баритон</td>
                                                </tr>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbVoice" value="3" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/voices/Dmitriev.mp3" title="Dmitriev" class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap="">Дмитриев Артем</td>
                                                    <td class="btext" align="left" style="padding-left:10px;" width="100%">баритон</td>
                                                </tr>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbVoice" value="4" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/voices/Notkin.mp3" title="Notkin" class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap="">Ноткин Александр</td>
                                                    <td class="btext" align="left" style="padding-left:10px;" width="100%">бас</td>
                                                </tr>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbVoice" value="24" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/voices/Aravushkin.mp3" title="Aravushkin" class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap="">Аравушкин Александр</td>
                                                    <td class="btext" align="left" style="padding-left:10px;" width="100%">баритон</td>
                                                </tr>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbVoice" value="45" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/voices/Burlakov.mp3" title="Burlakov" class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap="">Бурлаков Роман</td>
                                                    <td class="btext" align="left" style="padding-left:10px;" width="100%">тенор</td>
                                                </tr>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbVoice" value="28" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/voices/Chernyak.mp3" title="Chernyak" class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap="">Черняк Михаил</td>
                                                    <td class="btext" align="left" style="padding-left:10px;" width="100%">баритон</td>
                                                </tr>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbVoice" value="2" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/voices/Cherkasskiy.mp3" title="Cherkasskiy" class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap="">Черкасский Михаил</td>
                                                    <td class="btext" align="left" style="padding-left:10px;" width="100%">баритон</td>
                                                </tr>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbVoice" value="35" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/voices/Koncevich.mp3" title="Koncevich" class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap="">Концевич Станислав</td>
                                                    <td class="btext" align="left" style="padding-left:10px;" width="100%">бас</td>
                                                </tr>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbVoice" value="1" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/voices/Belov.mp3" title="Belov" class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap="">Белов Олег</td>
                                                    <td class="btext" align="left" style="padding-left:10px;" width="100%">бас</td>
                                                </tr>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbVoice" value="36" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/voices/Hrustalev.mp3" title="Hrustalev" class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap="">Хрусталев Михаил</td>
                                                    <td class="btext" align="left" style="padding-left:10px;" width="100%">баритон</td>
                                                </tr>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbVoice" value="37" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/voices/Timofeev.mp3" title="Timofeev" class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap="">Тимофеев Артем</td>
                                                    <td class="btext" align="left" style="padding-left:10px;" width="100%">баритон</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            </td>
                        </tr>
                        <tr>
                            <td><img src="http://ivrplus.ru/images/sp.gif" alt="" width="1" height="10" /></td>
                        </tr>
                        <tr>
                            <td align="center" valign="top">
                            <table border="0" cellpadding="0" cellpacing="0" width="100%" align="center">
                                <tbody>
                                    <tr>
                                        <td class="textsmheader">Иностранные голоса</td>
                                    </tr>
                                    <tr>
                                        <td width="100%" align="center" valign="top">
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
                                            <tbody>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbVoiceForeign" value="-1" checked="" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><img src="http://ivrplus.ru/images/golosovoe_menu_stand_by.gif" alt="" width="16" height="16" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" colspan="2">нет</td>
                                                </tr>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbVoiceForeign" value="32" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/voices/Collimson.mp3" title="Collimson" class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap="">Collinson Shura</td>
                                                    <td class="btext" align="left" style="padding-left:10px;" width="100%">британка</td>
                                                </tr>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbVoiceForeign" value="39" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/voices/Starin_Carolina_ru.mp3" title="Starin_Carolina_ru" class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap="">Starinn Carolina</td>
                                                    <td class="btext" align="left" style="padding-left:10px;" width="100%">американка</td>
                                                </tr>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbVoiceForeign" value="43" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/voices/Essel_Heidi.mp3" title="Essel_Heidi" class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap="">Essel Heidi</td>
                                                    <td class="btext" align="left" style="padding-left:10px;" width="100%">немка</td>
                                                </tr>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbVoiceForeign" value="44" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/voices/Kinoue_Reiko.mp3" title="Kinoue_Reiko" class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap="">Kinoue Reiko</td>
                                                    <td class="btext" align="left" style="padding-left:10px;" width="100%">японка</td>
                                                </tr>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbVoiceForeign" value="16" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/voices/Pullar.mp3" title="Pullar" class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap="">Pullar Douglas</td>
                                                    <td class="btext" align="left" style="padding-left:10px;" width="100%">американец</td>
                                                </tr>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbVoiceForeign" value="12" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/voices/HackettJones.mp3" title="HackettJones" class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap="">Hackett-Jones William</td>
                                                    <td class="btext" align="left" style="padding-left:10px;" width="100%">британец</td>
                                                </tr>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbVoiceForeign" value="41" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/voices/Kushe_Peter.mp3" title="Kushe_Peter" class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap="">Kushe Peter</td>
                                                    <td class="btext" align="left" style="padding-left:10px;" width="100%">немец</td>
                                                </tr>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbVoiceForeign" value="42" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/voices/Sioy_Olivier.mp3" title="Sioy_Olivier" class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap="">Sioy Olivier</td>
                                                    <td class="btext" align="left" style="padding-left:10px;" width="100%">француз</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            </td>
                        </tr>
                        <tr>
                            <td><img src="http://ivrplus.ru/images/sp.gif" alt="" width="1" height="10" /></td>
                        </tr>
                    </tbody>
                </table>
                </td>
            </tr>
            <tr>
                <td align="left" valign="top" class="caption">2. Введите текст голосового приветствия</td>
            </tr>
            <tr>
                <td align="left" valign="top" class="text"><b>Текст голосового приветствия:</b></td>
            </tr>
            <tr>
                <td align="left" valign="top" class="inputfld"><textarea name="tTextPrivet" id="tTextPrivet" maxlength="255" size="30" class="txtprivet" onclick="FieldClear('tTextPrivet');">Убедитесь, что в тексте расставлены ударения в именах собственных, расшифрованы сокращения и аббревиатуры, иностранные слова имеют русскую транскрипцию.</textarea></td>
            </tr>
            <tr>
                <td align="left" valign="top" class="text"><b>Комментарии и пожелания:</b></td>
            </tr>
            <tr>
                <td align="left" valign="top" class="inputfld"><textarea name="tTextComments" id="tTextComments" maxlength="255" size="30" class="txtcomments"></textarea></td>
            </tr>
            <tr>
                <td align="left" valign="top" class="caption">3. Выберите музыкальное оформление</td>
            </tr>
            <tr>
                <td align="left" valign="top">
                <table border="0" cellspacing="6" cellpadding="6" align="center" width="450">
                    <tbody>
                        <tr>
                            <td class="text" align="left" nowrap=""><input type="Radio" name="rbBackgrMusic" value="1" /></td>
                            <td class="text" align="left" nowrap=""><b>Требуется фоновая музыка</b></td>
                            <td class="text" align="left" nowrap=""><input type="Radio" name="rbBackgrMusic" value="2" checked="" /></td>
                            <td class="text" align="left" nowrap="" width="100%"><b>Без фоновой музыки</b></td>
                        </tr>
                    </tbody>
                </table>
                </td>
            </tr>
            <tr>
                <td align="left" valign="top">
                <table border="0" cellpadding="0" cellspacing="0" align="center" width="100%">
                    <tbody>
                        <tr>
                            <td><img src="http://ivrplus.ru/images/sp.gif" alt="" width="1" height="10" /></td>
                        </tr>
                        <tr>
                            <td align="center" valign="top">
                            <table border="0" cellpadding="0" cellpacing="0" width="100%" align="center">
                                <tbody>
                                    <tr>
                                        <td width="100%" align="center" valign="top">
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
                                            <tbody>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbBackgrMusicType" value="21" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/musicdecoration/ivr_bell_1.mp3" title="ivr_bell_1" class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" width="100%">Звук 1</td>
                                                </tr>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbBackgrMusicType" value="22" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/musicdecoration/ivr_bell_2.mp3" title="ivr_bell_2" class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" width="100%">Звук 2</td>
                                                </tr>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbBackgrMusicType" value="23" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/musicdecoration/ivr_bell_3.mp3" title="ivr_bell_3" class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" width="100%">Звук 3</td>
                                                </tr>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbBackgrMusicType" value="24" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/musicdecoration/ivr_bell_4.mp3" title="ivr_bell_4" class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" width="100%">Звук 4</td>
                                                </tr>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbBackgrMusicType" value="25" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/musicdecoration/ivr_bell_05.mp3" title="ivr_bell_05" class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" width="100%">Звук 5</td>
                                                </tr>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbBackgrMusicType" value="11" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/musicdecoration/Muzika_1.mp3" title="Muzika_1" class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" width="100%">Музыка 1</td>
                                                </tr>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbBackgrMusicType" value="12" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/musicdecoration/Muzika_2.mp3" title="Muzika_2" class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" width="100%">Музыка 2</td>
                                                </tr>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbBackgrMusicType" value="13" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/musicdecoration/Muzika_3.mp3" title="Muzika_3" class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" width="100%">Музыка 3</td>
                                                </tr>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbBackgrMusicType" value="14" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/musicdecoration/Muzika_4.mp3" title="Muzika_4" class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" width="100%">Музыка 4</td>
                                                </tr>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbBackgrMusicType" value="15" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/musicdecoration/Muzika_5.mp3" title="Muzika_5" class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" width="100%">Музыка 5</td>
                                                </tr>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbBackgrMusicType" value="16" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/musicdecoration/Muzika_6.mp3" title="Muzika_6" class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" width="100%">Музыка 6</td>
                                                </tr>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbBackgrMusicType" value="17" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/musicdecoration/Muzika_7.mp3" title="Muzika_7" class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" width="100%">Музыка 7</td>
                                                </tr>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbBackgrMusicType" value="18" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/musicdecoration/Muzika_8.mp3" title="Muzika_8" class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" width="100%">Музыка 8</td>
                                                </tr>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbBackgrMusicType" value="19" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/musicdecoration/Muzika_9.mp3" title="Muzika_9" class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" width="100%">Музыка 9</td>
                                                </tr>
                                                <tr>
                                                    <td class="btext" align="left" style="padding-left:7px;"><input type="Radio" name="rbBackgrMusicType" value="20" /></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" nowrap=""><a href="http://ivrplus.ru/samples/musicdecoration/Muzika_10.mp3" title="Muzika_10" class="link"><img src="http://ivrplus.ru/images/golosovoe_menu_download.gif" alt="" width="16" height="16" /></a></td>
                                                    <td class="btext" align="left" style="padding-left:5px;" width="100%">Музыка 10</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            </td>
                        </tr>
                        <tr>
                            <td><img src="http://ivrplus.ru/images/sp.gif" alt="" width="1" height="10" /></td>
                        </tr>
                    </tbody>
                </table>
                </td>
            </tr>
            <tr>
                <td align="left" valign="top" style="padding: 0px 0px 0px 6px">
                <table border="0" cellspacing="2" cellpadding="2" align="center" width="450">
                    <tbody>
                        <tr>
                            <td class="text" align="left" nowrap=""><input type="Radio" name="rbBackgrMusicType" value="-1" /></td>
                            <td class="text" align="left" nowrap="">Своя музыка</td>
                            <td class="text" align="left" nowrap=""><input type="File" name="fileOwnMusic" class="file" /></td>
                            <td class="text" align="left" nowrap="" width="100%">mp3 файл до 3х Мб</td>
                        </tr>
                    </tbody>
                </table>
                </td>
            </tr>
            <tr>
                <td align="left" valign="top" style="padding: 0px 0px 0px 6px">
                <table border="0" cellspacing="2" cellpadding="2" align="center" width="450">
                    <tbody>
                        <tr>
                            <td class="text" align="left" nowrap=""><input type="Radio" name="rbBackgrMusicType" value="-2" /></td>
                            <td class="text" align="left" nowrap="" width="100%">Музыка на наше усмотрение</td>
                        </tr>
                    </tbody>
                </table>
                </td>
            </tr>
            <tr>
                <td align="left" valign="top" style="padding: 0px 0px 0px 6px">
                <table border="0" cellspacing="2" cellpadding="2" align="center" width="450">
                    <tbody>
                        <tr>
                            <td class="text" align="left" width="70%">Длительность звучания музыки<br />
                            после окончания текста голосового приветствия</td>
                            <td valign="bottom" class="text" align="left" width="30%" nowrap=""><input type="Text" readonly="true" name="tMin" id="tMin" maxlength="2" size="30" class="txttime" value="0" /> мин. <input type="Text" readonly="true" name="tSec" id="tSec" maxlength="2" size="30" class="txttime" value="0" /> сек.</td>
                        </tr>
                    </tbody>
                </table>
                </td>
            </tr>
            <tr>
                <td align="left" valign="top" class="caption">4. Введите контактные данные</td>
            </tr>
            <tr>
                <td align="left" valign="top" class="text">Контактное лицо (ФИО):</td>
            </tr>
            <tr>
                <td align="left" valign="top" class="inputfld"><input type="Text" name="tName" id="tName" maxlength="255" size="30" class="txtfio" value="" /></td>
            </tr>
            <tr>
                <td align="left" valign="top" class="text">Удобный способ оплаты:</td>
            </tr>
            <tr>
                <td align="left" valign="top" class="inputfld"><select name="sPaymentType" class="payment">
                <option value="1">Как юридическое лицо</option>
                <option value="2">Как физическое лицо</option>
                <option value="3">Яндекс.деньги</option>
                </select></td>
            </tr>
            <tr>
                <td align="left" valign="top" class="text">Реквизиты:</td>
            </tr>
            <tr>
                <td align="left" valign="top" class="inputfld"><textarea name="tRekviziti" id="tRekviziti" maxlength="255" size="30" class="txtinf"></textarea></td>
            </tr>
            <tr>
                <td align="left" valign="top" class="subtext">Реквизиты плательщика или номер яндекс.кошелька</td>
            </tr>
            <tr>
                <td align="left" valign="top" class="text">Контактный телефон:</td>
            </tr>
            <tr>
                <td align="left" valign="top" class="inputfld"><input type="Text" name="tPhone" id="tPhone" maxlength="255" size="30" class="txtfio" value="" /></td>
            </tr>
            <tr>
                <td align="left" valign="top" class="subtext">Пожалуйста, укажите код города</td>
            </tr>
            <tr>
                <td align="left" valign="top" class="text">e-mail:</td>
            </tr>
            <tr>
                <td align="left" valign="top" class="inputfld"><input type="Text" name="tEmail" id="tEmail" maxlength="255" size="30" class="txtfio" value="" /></td>
            </tr>
            <tr>
                <td align="left" valign="top" class="text">&nbsp;</td>
            </tr>
            <tr>
                <td align="left" valign="top" class="text">Человек ли вы?:</td>
            </tr>
            <tr>
                <td align="left"><img src="http://ivrplus.ru/protection/codeimage.php" border="0" width="140" height="60" alt="" /></td>
            </tr>
            <tr>
                <td align="left" valign="top" class="inputfld" style="padding:3px 0px 0px 0px;"><input type="Text" name="tProtCode" id="tProtCode" maxlength="6" size="30" class="txtfio" value="" /></td>
            </tr>
            <tr>
                <td align="left" valign="top" class="subtext">Введите код, изображенный на рисунке</td>
            </tr>
            <tr>
                <td align="left" valign="top" class="text">&nbsp;</td>
            </tr>
            <tr>
                <td align="left" width="100%" valign="top" class="button"><input type="Submit" class="sendbtn" value="Отправить заказ" border="0" /></td>
            </tr>
        </tbody>
    </table>
</form>



{% endblock %}
