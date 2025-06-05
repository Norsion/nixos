{ config, lib, pkgs, ... }:

{

  i18n = {                                          # basic locale config  
	defaultLocale = "en_US.UTF-8";              # default locale
	extraLocaleSettings = {			    # locale optinos, see https://wiki.archlinux.org/title/Locale
        	LC_ADDRESS        = "ru_RU.UTF-8";
        	LC_IDENTIFICATION = "ru_RU.UTF-8";
	        LC_MEASUREMENT    = "ru_RU.UTF-8";
        	LC_MONETARY       = "ru_RU.UTF-8";
        	LC_NAME           = "ru_RU.UTF-8";
        	LC_PAPER          = "ru_RU.UTF-8";
        	LC_TELEPHONE      = "ru_RU.UTF-8";
	};

	supportedLocales = [ "all" ];
	
  }; 
  

  console = {                    # vconsole locales
    colors       = [ ];          # vconsole colors
    enable       = false;         # toggle for enabling vconsole
    font         = "cyr-sun16";  
    keyMap       = "us";
    useXkbConfig = true;        # use xkb.options in tty.
  };
}
