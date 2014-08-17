      <div class="row">
        <div class="col-md-12">
          <div class="services">
            <ul>
                <li id="sr-hostedpbx">
                  {% wire id="sr-hostedpbx" action={redirect dispatch="vpbx"} %}
                  <i class="fa fa-gears fa-3x"></i>
                  <p>{_ Hosted PBX _}<br /><a href="/vpbx">{_ Details _}...</a></p>
                </li>
                <li id="sr-virtualoffice">
                  {% wire id="sr-virtualoffice" action={redirect dispatch="virtualoffice"} %}
                  <i class="fa fa-phone fa-3x"></i>
                  <p>{_ Virtual Office _}<br /><a href="/virtualoffice">{_ Details _}...</a></p>
                </li>
                <li id="sr-phonenumbers">
                  {% wire id="sr-phonenumbers" action={redirect dispatch="phonenumbers"} %}
                  <i class="fa fa-slack fa-3x"></i>
                  <p>{_ Phone Numbers _}<br /><a href="/phonenumbers">{_ Choose _}...</a></p>
                </li>
                <li id="sr-virtualserver">
                  {% wire id="sr-virtualserver" action={redirect dispatch="virtualserver"} %}
                  <i class="fa fa-database fa-3x"></i>
                  <p>{_ Virtual Server _}<br /><a href="/virtualserver">{_ Details _}...</a></p>
                </li>
                <li id="sr-cloudstorage">
                  {% wire id="sr-cloudstorage" action={redirect dispatch="cloudstorage"} %}
                  <i class="fa fa-dropbox fa-3x"></i>
                  <p>{_ Cloud Storage _}<br /><a href="/cloudstorage">{_ Details _}...</a></p>
                </li>
            </ul>
            <div class="clearfix"></div>
          </div>
        </div>
      </div>

