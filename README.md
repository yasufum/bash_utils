# bash utils

## What is this

Utility commands for bash.

Activate all commands in your `.bashrc`. Here is an example.


```sh
# .bashrc

for fp in `\find $HOME/bash_utils/*.sh -type f`; do
 source $fp
done
```

Or load each of scripts if you do not use all of them.

```sh
# .bashrc

source /path/to/bash_utils/wf.sh
...
```

After activating scripts, you can call commands.

```sh
$ wf
Usage: wf [-i] [-c] [-d path] word
```

## Commands

### 1. wf

Find files including given word.

#### Example

Find files including `rte_ether` in `lib/` directory from
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

  * d: Target directory.
  * i: Ignore case.
  * c: Enable color mode to easily find given word from output.
       (Do not use if you pass output via pipeline, for exp 'wf .. | less')
  * e: Exclude specific extension, for example, `txt`, `map` or so.
  * b: Include binary files for searching.
  * h: Show help message.


### 2. proxy

Enable/disable proxy setting.

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
