#!/bin/bash

# <bitbar.title>SD-Card-Mounter</bitbar.title>
# <bitbar.version>v0.1</bitbar.version>
# <bitbar.author>ManuGithubSteam</bitbar.author>
# <bitbar.author.github>citoki</bitbar.author.github>
# <bitbar.desc>This plugin will let you mount your SD-Card on the Xainomi Pro 15.6</bitbar.desc>
# <bitbar.image>https://i.imgur.com/vsCWLwX.png</bitbar.image>
# <bitbar.dependencies></bitbar.dependencies>


SD_ON="iVBORw0KGgoAAAANSUhEUgAAABEAAAAMCAYAAACEJVa/AAAACXBIWXMAAABpAAAAaQFxoZjYAAAAGXRFWHRTb2Z0d2FyZQB3d3cuaW5rc2NhcGUub3Jnm+48GgAAAFh0RVh0Q29weXJpZ2h0AENDMCBQdWJsaWMgRG9tYWluIERlZGljYXRpb24gaHR0cDovL2NyZWF0aXZlY29tbW9ucy5vcmcvcHVibGljZG9tYWluL3plcm8vMS4wL8bjvfkAAAG7SURBVCiRndCxaxNhGMfx7/Pe6/Vyl7sYSycHCdHQCIpYDW76F4jg7uAg/g8OzhmdHPwranXTTRqHglNRWjoITSCkjXchl7eXXO51qAkVHbTP+Hvgw/P8pNO8+Rprn3P+eSOfb2yYqHXHy4dDdKVC+vUbojX+tauMd3fxGw2KyQQcB1GCUw5JtjtnkRMtthDlreA31zna3KL64D6IMPzwkah1l6C5TtbtoXyf2fEx4ihUqURhzAIRjXacPI7Juj3CjdvE2x1EO0T3WuQ/YgZvt3DX1pgbgw5DlOedBQCUfLp+6ztinXM3YmWu3z18dDkIfEcpheu6GGNYXb3EZGLQ2qHfH+C6FwiCAK0d4niEtQV5Pl8wuQZsmk6o1a5QrV5ERNjfP6Ber2Gtpd8f4HkejUadLJsShmW01uztHSyP0YAtlTxmsxndbo8sm1KpRAwGR1hrAUjTlJ2dL0RRRBSVybIpIvBrfYoYc8LhYW8px3Hy29vzeQFAURRk2ZTxOEUptcw1YP+1wyQZkSSjP/L/QQzIC7DpIrCWkVKnxb4CngAeUAEUYKzlmcjKe2uztlI8Lgp52m6/3Pyb/hM50bhDn8ITaAAAAABJRU5ErkJggg=="



SD_OFF="iVBORw0KGgoAAAANSUhEUgAAABgAAAARCAYAAADHeGwwAAAACXBIWXMAAACTAAAAkwEr+6uQAAAAGXRFWHRTb2Z0d2FyZQB3d3cuaW5rc2NhcGUub3Jnm+48GgAAAFh0RVh0Q29weXJpZ2h0AENDMCBQdWJsaWMgRG9tYWluIERlZGljYXRpb24gaHR0cDovL2NyZWF0aXZlY29tbW9ucy5vcmcvcHVibGljZG9tYWluL3plcm8vMS4wL8bjvfkAAAJ6SURBVDiNtZLbS1RRFIe/fS4zZ67eGpkZSagEFRpKoscoKYoewqwQgp6S6N/wcf4LwccIuj1EENFD4aQkIVoxOow0OqMcb3Oc5jiXc04P5jDmmFH2g81mLdb6fay1t0h0xwYcwSjQwtEqLxDDYrwnlgPCR2y+K10Bgu1Dd7AMg+1vGfxnYghJZuXRYxzLInzvLhV9lc137+l4+IDc6BitV6+AEGy8eUv77UFK2SyF6RnMVOpXgFcCpO30AmoohKRpFD5NU5ybx90RRW1ro5RZZO3lKyTNQymzSMuli0guF+5IGOt7gfLyMvqTZwTO9TWaQFIAhKqCbSO53XhOnUTIMlsfp3BsG1c4TNv1a0geD4XZz/h6eyivrKA/fU6g7yxKayuhwQGMxERDgBjviZUA1xHuvV5lxZblnIOj/A93gagqL27c7AD2AGRZxrKs2r2vUezUgMC2LWzbOYhRVgAHoLu7i3K5gsfjweVSWV/foKkpSD5vEI2GURSVRGKCatVClhX6+y8gyzLJ5DyGsUUg4KdQKKDra3sI0i4gm10GoLm5CVVViUTCJJMpotEIAJZloWlardE0TYrFIrZt4/N5kSQJVd3/lLXVBIMBVFVlbi5FKHSMVCpNV9cJdH0Vx3HQNDemadZgk5NTCCHw+/0EAn4URUaSREOADbC0lKsldX0VgNnZrw0X6zgOpVIZgM7O41iWRSazhNfrOXiCv1U6vbBjpChsbuYbAg78An+iSqW6524EsP/Bfwv4UBebwHZdXFUAA/AdYjQDfAF6gdM/c2XgVjw+8vp3jZLjiGEgCWzUHaOuZkzTOB+PjwxVq1wGcjs14v5h5gA/ACtm73u+DeoeAAAAAElFTkSuQmCC"

function get_sd_state {
  mount | grep mmcblk &> /dev/null;
  
  mounted=$(echo $?)

  # set state
  if [ $mounted = 1 ]; then
    state="SD-Card not mounted";
    COLOR="blue"
  else
    state="SD-Card mounted";
    COLOR="green"
  fi
}

function set_program_icon {
  get_sd_state;

  if [[ "$state" = "" ]]; then
    icon="img-sd-mount";
  else
    icon="img-sd-umount";
  fi
}


if [ "$1" = "start" ]; then
  state="working, please wait";
  COLOR="yellow"
  USERM=$(/bin/bash -c who | head -n1 | cut -d' ' -f1)
  /usr/bin/sudo -u $USERM -i bash -c "/Users/$USERM/Virtual\ Machines.localized/Tiny.vmwarevm/sd-mount.sh &"
  exit
fi

if [ "$1" = "stop" ]; then
  open .
  exit
fi

# set program icon to default: 'not active state'
set_program_icon;

if [ -f $HOME/Virtual\ Machines.localized/Tiny.vmwarevm/mountinprogress.file ]; then
    echo "| templateImage=$SD_OFF"
    echo "---"
    echo "mounting, please wait | color=yellow"
    echo "---"
    exit
fi

if [ $mounted = 1 ]; then
    echo "| templateImage=$SD_ON"
    echo "---"
    echo "${state} | color=$COLOR"
    echo "---"
    echo "Mount SD-Card | bash='$0' param1=start terminal=false refresh=true"
  else
    echo "| templateImage=$SD_ON"
    echo "---"
    echo "${state} | color=$COLOR"
    echo "---"
    echo "Umount in Finder | bash='$0' param1=stop terminal=false refresh=true"
  fi


