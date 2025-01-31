summit_supplicant:
	@[ $(SOCFAMILY) != IMX ] && exit || \
	 $(call fbprint_d,$(repo_summit_supplicant_tar_url)) && \
	 mkdir -p $(PKGDIR)/apps/connectivity/summit_supplicant && cd $(PKGDIR)/apps/connectivity/summit_supplicant && \
	 echo Installing Summit Supplicant && \
	 wget -q $(repo_summit_supplicant_tar_url) -O summit_supplicant.tar.gz && \
	 tar xf summit_supplicant.tar.gz --strip-components 1; \
	 cd $(PKGDIR)/apps/connectivity/summit_supplicant/wpa_supplicant && \
	 cp -f config_openssl .config && \
	 $(MAKE) -j4 && \
	 $(MAKE) install && \
	 $(CROSS_COMPILE)objcopy -v -O binary wpa_supplicant sdcsupp && \
	 $(call fbprint_d,"summit_supplicant")
