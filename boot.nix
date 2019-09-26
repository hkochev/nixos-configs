{ config, pkgs, ... }:
{
    # Use the GRUB 2 boot loader.
    loader.grub.enable = true;
    loader.grub.version = 2;
    # boot.loader.grub.efiSupport = true;
    # boot.loader.grub.efiInstallAsRemovable = true;
    # boot.loader.efi.efiSysMountPoint = "/boot/efi";
    
    # Define on which hard drive you want to install Grub.
    loader.grub.device = "/dev/sda"; # or "nodev" for efi only
    # kernelModules = [ "tun" "virtio" "cpufreq_stats"  "acpi" "thinkpad-acpi" "tp_acpi" ];
    kernelParams = [
      # Kernel GPU Savings Options (NOTE i915 chipset only)
      # "drm.debug=0" "drm.vblankoffdelay=1" "i915.semaphores=1" "i915.modeset=1"
      # "i915.use_mmio_flip=1" 
      # "i915.powersave=1" 
      # "i915.enable_ips=1"
      # "i915.disable_power_well=1" "i915.enable_hangcheck=1"
      # "i915.enable_cmd_parser=1" "i915.fastboot=0" "i915.enable_ppgtt=1"
      # "i915.reset=0" "i915.lvds_use_ssc=0" "i915.enable_psr=0" "vblank_mode=0"
      # "i915.i915_enable_fbc=1"
      # "i915.i915_enable_rc6=1"
      # "i915.i915_semaphores=1"
      # X1 power tweeks
      "intel_pstate=no_hwp" 
      # Frameboofer
      # "i915.enable_fbc=1"
      # SSD with NOOP
      "elevetor=noop"
      # ACPI options
      # "i915.enable_dhcd_backlight=1"
      # "acpi_backlight=video"
      # "acpi_backlight=vendor"
      # "acpi_backlight=native"
      # "acpi_backlight=none"
    ];
    
    initrd.kernelModules = ["acpi" "thinkpad-acpi" "tp_acpi" "tpacpi-bat"];
    
    extraModulePackages = [
      # pkgs.linuxPackages.virtualbo
      # config.boot.kernelPackages.tp_smapi
      config.boot.kernelPackages.acpi_call
      # config.boot.kernelPackages.tpacpi_bat

    ];
 
      #    blacklistedKernelModules = [
      # Kernel GPU Savings Options (NOTE i915 chipset only)
      #  "sierra_net" "cdc_mbim" "cdc_ncm" "btusb"
      # "kvm-intel"	
      #    ];
}
