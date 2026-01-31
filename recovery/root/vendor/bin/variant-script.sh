#!/system/bin/sh
# This script is needed to automatically set device props.

LOG_PATH=/tmp/recovery.log

setdevicename() {
    resetprop "ro.product.name" "$1"
    resetprop "ro.build.product" "$1"
    resetprop "ro.vendor.product.device" "$1"
    resetprop "ro.system.product.device" "$1"
    resetprop "ro.system_ext.product.device" "$1"
    resetprop "ro.odm.product.device" "$1"
    resetprop "ro.product.device" "$1"
    resetprop "ro.product.product.device" "$1"
    resetprop "ro.product.bootimage.device" "$1"
    resetprop "ro.product.odm.device" "$1"
    resetprop "ro.product.system.device" "$1"
    resetprop "ro.product.system_ext.device" "$1"
    resetprop "ro.product.vendor.device" "$1"
    resetprop "ro.product.board" "$1"
}

setdevicemodel() {
    resetprop "ro.product.model" "$1"
    resetprop "ro.product.vendor.model" "$1"
    resetprop "ro.product.odm.model" "$1"
    resetprop "ro.product.system.model" "$1"
    resetprop "ro.product.system_ext.model" "$1"
    resetprop "ro.product.product.model" "$1"
}

load_dandelion()
{
    echo "I:Variant-Script: Loaded dandelion variant" | tee -a $LOG_PATH
    setdevicename "dandelion"
   
    sku=$(getprop ro.boot.product.hw.sku) 
    
    case $sku in
        "std")
            setdevicemodel "Redmi 9A"
             ;;
        "hcg")
             setdevicemodel "Redmi 9i"
             ;;
        "pro")
             setdevicemodel "Redmi 9AT"
             ;;
        *)
             setdevicemodel "Redmi 10A"
             ;;
    esac
    #
}

load_angelica()
{
    echo "I:Variant-Script: Loaded angelica variant" | tee -a $LOG_PATH
    setdevicename "angelica"
    setdevicemodel "Redmi 9C"
}

load_cattail()
{
    echo "I:Variant-Script: Loaded cattail variant" | tee -a $LOG_PATH
    setdevicename "cattail"
    setdevicemodel "Redmi 9 Activ"
}

load_angelican()
{
    echo "I:Variant-Script: Loaded angelican variant" | tee -a $LOG_PATH
    setdevicename "angelican"
    setdevicemodel "Redmi 9C NFC"
}

load_angelicain()
{
    echo "I:Variant-Script: Loaded angelicain variant" | tee -a $LOG_PATH
    setdevicename "angelicain"
    setdevicemodel "POCO C31"
}


variant=$(resetprop ro.boot.hwname)

case $variant in
     "angelica")
           load_angelica
           ;;
     "angelican")
           load_angelican
           ;;
     "angelicain")
           load_angelicain
           ;;
     "cattail")
           load_cattail
           ;;
     "dandelion")
           load_dandelion
           ;;
      *)
           load_angelica
           ;;
esac
# -------------------------------------------->
exit 0
#
