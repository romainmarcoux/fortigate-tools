#!/bin/bash
# Syntax : ./split_vdom.sh fortigate_conf_file_with_VDOM.conf
conf_file=$1
# Split conf file into vdom_X file
awk 'BEGIN {f="vdom_0"} /config vdom/ {close(f); f="vdom_" ++i; print $0 > f; next} {print > f}' $conf_file

# Renaming the start of the conf file before the VDOMs
mv vdom_0 vdomHeaders
mv vdom_1 vdomGlobal

# Rename splited files with VDOM name
for file in vdom_*; do
  if [ -f "$file" ]; then
    mv $file vdom_$(grep -Po 'edit \K.*$' $file | head -n1)
  fi
done

