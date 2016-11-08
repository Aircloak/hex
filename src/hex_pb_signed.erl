%% Automatically generated, do not edit
%% Generated by gpb_compile version 3.23.0
-module(hex_pb_signed).

-export([encode_msg/2, encode_msg/3]).
-export([decode_msg/2]).
-export([merge_msgs/3]).
-export([verify_msg/2]).
-export([get_msg_defs/0]).
-export([get_msg_names/0]).
-export([get_enum_names/0]).
-export([find_msg_def/1, fetch_msg_def/1]).
-export([find_enum_def/1, fetch_enum_def/1]).
-export([enum_symbol_by_value/2, enum_value_by_symbol/2]).
-export([get_service_names/0]).
-export([get_service_def/1]).
-export([get_rpc_names/1]).
-export([find_rpc_def/2, fetch_rpc_def/2]).
-export([get_package_name/0]).
-export([gpb_version_as_string/0, gpb_version_as_list/0]).



encode_msg(Msg, MsgName) ->
    encode_msg(Msg, MsgName, []).


encode_msg(Msg, MsgName, _Opts) ->
    verify_msg(Msg, MsgName),
    case MsgName of 'Signed' -> e_msg_Signed(Msg) end.


e_msg_Signed(Msg) -> e_msg_Signed(Msg, <<>>).


e_msg_Signed(#{payload := F1} = M, Bin) ->
    B1 = begin
	   TrF1 = id(F1), e_type_bytes(TrF1, <<Bin/binary, 10>>)
	 end,
    case M of
      #{signature := F2} ->
	  TrF2 = id(F2), e_type_bytes(TrF2, <<B1/binary, 18>>);
      _ -> B1
    end.



e_type_bytes(Bytes, Bin) ->
    Bin2 = e_varint(byte_size(Bytes), Bin),
    <<Bin2/binary, Bytes/binary>>.

e_varint(N, Bin) when N =< 127 -> <<Bin/binary, N>>;
e_varint(N, Bin) ->
    Bin2 = <<Bin/binary, (N band 127 bor 128)>>,
    e_varint(N bsr 7, Bin2).



decode_msg(Bin, MsgName) when is_binary(Bin) ->
    case MsgName of 'Signed' -> d_msg_Signed(Bin) end.



d_msg_Signed(Bin) ->
    dfp_read_field_def_Signed(Bin, 0, 0, id('$undef'),
			      id('$undef')).

dfp_read_field_def_Signed(<<10, Rest/binary>>, Z1, Z2,
			  F1, F2) ->
    d_field_Signed_payload(Rest, Z1, Z2, F1, F2);
dfp_read_field_def_Signed(<<18, Rest/binary>>, Z1, Z2,
			  F1, F2) ->
    d_field_Signed_signature(Rest, Z1, Z2, F1, F2);
dfp_read_field_def_Signed(<<>>, 0, 0, F1, F2) ->
    S1 = #{payload => F1},
    if F2 == '$undef' -> S1;
       true -> S1#{signature => F2}
    end;
dfp_read_field_def_Signed(Other, Z1, Z2, F1, F2) ->
    dg_read_field_def_Signed(Other, Z1, Z2, F1, F2).

dg_read_field_def_Signed(<<1:1, X:7, Rest/binary>>, N,
			 Acc, F1, F2)
    when N < 32 - 7 ->
    dg_read_field_def_Signed(Rest, N + 7, X bsl N + Acc, F1,
			     F2);
dg_read_field_def_Signed(<<0:1, X:7, Rest/binary>>, N,
			 Acc, F1, F2) ->
    Key = X bsl N + Acc,
    case Key of
      10 -> d_field_Signed_payload(Rest, 0, 0, F1, F2);
      18 -> d_field_Signed_signature(Rest, 0, 0, F1, F2);
      _ ->
	  case Key band 7 of
	    0 -> skip_varint_Signed(Rest, 0, 0, F1, F2);
	    1 -> skip_64_Signed(Rest, 0, 0, F1, F2);
	    2 -> skip_length_delimited_Signed(Rest, 0, 0, F1, F2);
	    5 -> skip_32_Signed(Rest, 0, 0, F1, F2)
	  end
    end;
dg_read_field_def_Signed(<<>>, 0, 0, F1, F2) ->
    S1 = #{payload => F1},
    if F2 == '$undef' -> S1;
       true -> S1#{signature => F2}
    end.

d_field_Signed_payload(<<1:1, X:7, Rest/binary>>, N,
		       Acc, F1, F2)
    when N < 57 ->
    d_field_Signed_payload(Rest, N + 7, X bsl N + Acc, F1,
			   F2);
d_field_Signed_payload(<<0:1, X:7, Rest/binary>>, N,
		       Acc, _, F2) ->
    Len = X bsl N + Acc,
    <<Bytes:Len/binary, Rest2/binary>> = Rest,
    NewFValue = binary:copy(Bytes),
    dfp_read_field_def_Signed(Rest2, 0, 0, NewFValue, F2).


d_field_Signed_signature(<<1:1, X:7, Rest/binary>>, N,
			 Acc, F1, F2)
    when N < 57 ->
    d_field_Signed_signature(Rest, N + 7, X bsl N + Acc, F1,
			     F2);
d_field_Signed_signature(<<0:1, X:7, Rest/binary>>, N,
			 Acc, F1, _) ->
    Len = X bsl N + Acc,
    <<Bytes:Len/binary, Rest2/binary>> = Rest,
    NewFValue = binary:copy(Bytes),
    dfp_read_field_def_Signed(Rest2, 0, 0, F1, NewFValue).


skip_varint_Signed(<<1:1, _:7, Rest/binary>>, Z1, Z2,
		   F1, F2) ->
    skip_varint_Signed(Rest, Z1, Z2, F1, F2);
skip_varint_Signed(<<0:1, _:7, Rest/binary>>, Z1, Z2,
		   F1, F2) ->
    dfp_read_field_def_Signed(Rest, Z1, Z2, F1, F2).


skip_length_delimited_Signed(<<1:1, X:7, Rest/binary>>,
			     N, Acc, F1, F2)
    when N < 57 ->
    skip_length_delimited_Signed(Rest, N + 7, X bsl N + Acc,
				 F1, F2);
skip_length_delimited_Signed(<<0:1, X:7, Rest/binary>>,
			     N, Acc, F1, F2) ->
    Length = X bsl N + Acc,
    <<_:Length/binary, Rest2/binary>> = Rest,
    dfp_read_field_def_Signed(Rest2, 0, 0, F1, F2).


skip_32_Signed(<<_:32, Rest/binary>>, Z1, Z2, F1, F2) ->
    dfp_read_field_def_Signed(Rest, Z1, Z2, F1, F2).


skip_64_Signed(<<_:64, Rest/binary>>, Z1, Z2, F1, F2) ->
    dfp_read_field_def_Signed(Rest, Z1, Z2, F1, F2).






merge_msgs(Prev, New, MsgName) ->
    case MsgName of
      'Signed' -> merge_msg_Signed(Prev, New)
    end.

merge_msg_Signed(#{payload := PFpayload} = PMsg,
		 #{payload := NFpayload} = NMsg) ->
    S1 = #{payload =>
	       if NFpayload =:= undefined -> PFpayload;
		  true -> NFpayload
	       end},
    case {PMsg, NMsg} of
      {_, #{signature := NFsignature}} ->
	  S1#{signature => NFsignature};
      {#{signature := PFsignature}, _} ->
	  S1#{signature => PFsignature};
      _ -> S1
    end.



verify_msg(Msg, MsgName) ->
    case MsgName of
      'Signed' -> v_msg_Signed(Msg, ['Signed']);
      _ -> mk_type_error(not_a_known_message, Msg, [])
    end.


v_msg_Signed(#{payload := F1} = M, Path) ->
    v_type_bytes(F1, [payload | Path]),
    case M of
      #{signature := F2} ->
	  v_type_bytes(F2, [signature | Path]);
      _ -> ok
    end,
    ok;
v_msg_Signed(M, Path) when is_map(M) ->
    mk_type_error({missing_fields,
		   [payload] -- maps:keys(M), 'Signed'},
		  M, Path);
v_msg_Signed(X, Path) ->
    mk_type_error({expected_msg, 'Signed'}, X, Path).

v_type_bytes(B, _Path) when is_binary(B) -> ok;
v_type_bytes(X, Path) ->
    mk_type_error(bad_binary_value, X, Path).

-spec mk_type_error(_, _, list()) -> no_return().
mk_type_error(Error, ValueSeen, Path) ->
    Path2 = prettify_path(Path),
    erlang:error({gpb_type_error,
		  {Error, [{value, ValueSeen}, {path, Path2}]}}).


prettify_path([]) -> top_level;
prettify_path(PathR) ->
    list_to_atom(string:join(lists:map(fun atom_to_list/1,
				       lists:reverse(PathR)),
			     ".")).



-compile({nowarn_unused_function,id/1}).
-compile({inline,id/1}).
id(X) -> X.

-compile({nowarn_unused_function,cons/2}).
-compile({inline,cons/2}).
cons(Elem, Acc) -> [Elem | Acc].

-compile({nowarn_unused_function,lists_reverse/1}).
-compile({inline,lists_reverse/1}).
'lists_reverse'(L) -> lists:reverse(L).

-compile({nowarn_unused_function,'erlang_++'/2}).
-compile({inline,'erlang_++'/2}).
'erlang_++'(A, B) -> A ++ B.



get_msg_defs() ->
    [{{msg, 'Signed'},
      [#{name => payload, fnum => 1, rnum => 2, type => bytes,
	 occurrence => required, opts => []},
       #{name => signature, fnum => 2, rnum => 3,
	 type => bytes, occurrence => optional, opts => []}]}].


get_msg_names() -> ['Signed'].


get_enum_names() -> [].


fetch_msg_def(MsgName) ->
    case find_msg_def(MsgName) of
      Fs when is_list(Fs) -> Fs;
      error -> erlang:error({no_such_msg, MsgName})
    end.


-spec fetch_enum_def(_) -> no_return().
fetch_enum_def(EnumName) ->
    erlang:error({no_such_enum, EnumName}).


find_msg_def('Signed') ->
    [#{name => payload, fnum => 1, rnum => 2, type => bytes,
       occurrence => required, opts => []},
     #{name => signature, fnum => 2, rnum => 3,
       type => bytes, occurrence => optional, opts => []}];
find_msg_def(_) -> error.


find_enum_def(_) -> error.


-spec enum_symbol_by_value(_, _) -> no_return().
enum_symbol_by_value(E, V) ->
    erlang:error({no_enum_defs, E, V}).


-spec enum_value_by_symbol(_, _) -> no_return().
enum_value_by_symbol(E, V) ->
    erlang:error({no_enum_defs, E, V}).



get_service_names() -> [].


get_service_def(_) -> error.


get_rpc_names(_) -> error.


find_rpc_def(_, _) -> error.



-spec fetch_rpc_def(_, _) -> no_return().
fetch_rpc_def(ServiceName, RpcName) ->
    erlang:error({no_such_rpc, ServiceName, RpcName}).


get_package_name() -> undefined.



gpb_version_as_string() ->
    "3.23.0".

gpb_version_as_list() ->
    [3,23,0].