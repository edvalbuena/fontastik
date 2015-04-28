     <div class="text-center p-3">
        {% ilazy class="fa fa-spinner fa-spin fa-3x" action={update target="update_onnet_widget_calls_list"
                                                                    template="onnet_widget_calls_list_worker.tpl"
                                                                    headline=headline
                                                                    idname=idname
                                                                    direction=direction
                                                                    operator=operator
                                                                    startDayInput=startDayInput
                                                                    endDayInput=endDayInput
                                                                    monthInput=monthInput
                                                            }
        %}
      </div>
