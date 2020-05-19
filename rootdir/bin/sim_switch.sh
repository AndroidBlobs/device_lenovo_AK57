Log() {
    log -p d -t gpio $1
    echo $1
}

Log "Start SIM Switch..."


PROP_SIM_SWITCH_RES="vendor.ril.sim_switch_result"
setprop $PROP_SIM_SWITCH_RES 0

PVAL=$(getprop persist.vendor.radio.slot.idx)

function sim_switch() {
    max_retry=10
    retry=0
    while [ $retry -lt $max_retry ]
    do
        echo 510 > /sys/class/gpio/export
        sleep 0.1
        echo out > /sys/class/gpio/gpio510/direction
        echo $1 > /sys/class/gpio/gpio510/value

        state=$(cat /sys/class/gpio/gpio510/value)
        Log "gpio510 state: $state"
        if [ "$state" = $1 ];then
            Log "gpio510 exported."
            return 1
        fi
        let $retry++
        Log "gpio510 exporting - $retry"
    done
    return -1
}

function check_switch_result() {
    Log "switch_result: $1"
    setprop $PROP_SIM_SWITCH_RES $1
    if [ "$1" = "1" ]; then
        Log "SIM $PVAL enabled!"
    else
        Log "Failed to enable SIM $PVAL!"
    fi
}

if [ "$PVAL" = "2" ]; then
    sim_switch 0
    RES=$?
    check_switch_result $RES
fi

if [ "$PVAL" = "3" ]; then
    sim_switch 1
    RES=$?
    check_switch_result $RES
fi

Log "Finish SIM Switch "
