docker container inspect $(docker container ls -aq) | 
  jq -r '.[] | {"name":(.Name|.[1:]), "status":.State.Status, "ip":[.NetworkSettings.Networks.mynet.IPAddress | if . == null or . == "" then "999" end] | .[]}'|
  jq -rs 'sort_by(.ip | split(".")[] | tonumber) | map([.name,.status,.ip|if . == "999" then "-" end]) | .[] | @tsv'|
  expand -t14
