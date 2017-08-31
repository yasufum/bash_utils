# bash utils

## What is this

Utility functions for bash.

Activate all functions by adding it to your `.bashrc`

```sh
# .bashrc

for fp in `\find /path/to/bash_utils/*.sh -type f`; do
 source $fp
done
```

or load directly if you do not use all of them.

```sh
# .bashrc

source /path/to/bash_utils/wf.sh
...
```

After loading scripts, you can call functions in your terminal.

```sh
$ wf
Usage: wf [-i] [-c] [-d path] word
```

## Functions

### 1. wf

Find files including given word.

#### Example

Find files including "rte_ether" in lib/ from
DPDK's source code.

```sh
$ pwd
/path/to/dpdk
$ wf -d lib rte_ether
lib/librte_ether/Makefile:42:EXPORT_MAP := rte_ether_version.map
lib/librte_ether/rte_eth_ctrl.h:39:#include "rte_ether.h"
lib/librte_ether/rte_ethdev.c:68:#include "rte_ether.h"
lib/librte_ether/rte_ethdev.h:183:#include "rte_ether.h"
```

#### Options
  * i: Ignore case
  * c: Enable color mode to easily find given word from output
       (Do not use if you pass output via pipeline, for exp 'wf .. | less')
  * d: Target directory

### 2. proxy

Enable/disable proxy settings

#### Example

If you define variables for proxy, you can enable/disable it as following.

```sh
# disable 
$ proxy off 

# enable
$ proxy on
```

To show usage and current status, simply type 'proxy'.

```sh
$ proxy
Usage: proxy on|off

http_proxy=[your_http_proxy]
https_proxy=[your_https_proxy]
no_proxy=[your_no_proxy]
```
