{erl_opts, [debug_info, {parse_transform, lager_transform}]}.

{deps, [
       {riak_core, "3.0.2", {pkg, riak_core_ng}}
]}.

{relx, [{release, { {{ name }} , "0.1.0"},
         [{{ name }},
          cuttlefish,
          sasl]},

        {dev_mode, true},
        {include_erts, false},

        {overlay_vars, "config/vars.config"},
        {overlay, [
            {mkdir, "etc"},
            {mkdir, "bin"},
            {mkdir, "data/ring"},
            {mkdir, "log/sasl"},
            {template, "./config/admin_bin", "bin/{{ name }}-admin"},
            {template, "./config/advanced.config", "etc/advanced.config"}
        ]}
]}.

{plugins, [
    {rebar3_run, {git, "git://github.com/tsloughter/rebar3_run.git", {branch, "master"}}}
]}.

{project_plugins, [{rebar3_cuttlefish, {git, "git://github.com/tsloughter/rebar3_cuttlefish.git", {branch, "master"}}}]}.

{profiles, [
    {prod, [{relx, [{dev_mode, false}, {include_erts, true}]}]},
    {dev1, [{relx, [{overlay_vars, ["config/vars.config", "config/vars_dev1.config"]}]}]},
    {dev2, [{relx, [{overlay_vars, ["config/vars.config", "config/vars_dev2.config"]}]}]},
    {dev3, [{relx, [{overlay_vars, ["config/vars.config", "config/vars_dev3.config"]}]}]}
]}.
