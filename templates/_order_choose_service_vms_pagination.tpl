                {% wire id="choose_service_next"
                        action={add_class class="hide" target="choose_service_div"}
                        action={remove_class class="hide" target="contact_info_div"}
                %}
                <ul class="pager">
                    <li id="choose_service_back" class="previous disabled">
                        <a href="#">&larr; {_ Back _}</a>
                    </li>
                    <li id="choose_service_next" class="next hide">
                        <a href="#">{_ Next _} &rarr;</a>
                    </li>
                </ul>
