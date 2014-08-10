-module(onnet_analytics).
-author("Kirill Sysoev <kirill.sysoev@gmail.com>").

%% interface functions
-export([
     get_call_attempts_by_date/3
    ,get_call_attempts_by_retrodays/4
    ,get_call_attempts_by_retrodays/5
]).

-include_lib("zotonic.hrl").

get_call_attempts_by_date(PhoneNumOrig, {Year, Month, Day}, Context) ->
    PhoneNum = string:right(PhoneNumOrig,7),
    TodayTableName = io_lib:format("tel001~w~2..0w~2..0w", [Year, Month, Day]),
    QueryCheckTableString = io_lib:format("show tables like '~s'", [TodayTableName]),
    case z_mydb:q(QueryCheckTableString, Context) of
        [] -> QueryResult = [<<"0">>, <<"0">>];
        _  ->
              QueryString = io_lib:format("select cast(count(distinct(numfrom)) as char), cast(count(numfrom) as char) from ~s where numto like ~p", [TodayTableName, PhoneNum]),
              [QueryResult] = z_mydb:q(QueryString, Context)
    end,
    [[lists:flatten(io_lib:format("~w-~2..0w-~2..0w", [Year, Month, Day])) | QueryResult]].


get_call_attempts_by_retrodays(PhoneNum, {Year, Month, Day}, DaysAmount, Context) ->
    get_call_attempts_by_retrodays(PhoneNum, {Year, Month, Day}, DaysAmount, Context, []).

get_call_attempts_by_retrodays(PhoneNum, {Year, Month, Day}, DaysAmount, Context, Acc) ->
    if
       DaysAmount < 0 ->
           lists:reverse(Acc);
       DaysAmount >= 0 ->
           AccNew = Acc ++ get_call_attempts_by_date(PhoneNum, zonnet_util:countdown_day({Year, Month, Day}, DaysAmount), Context),
           get_call_attempts_by_retrodays(PhoneNum, {Year, Month, Day}, DaysAmount - 1, Context, AccNew)
    end.
    

