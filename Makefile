REPO_URLS=\
	  git@github.com:Maps4HTML/Web-Map-Custom-Element.git \
	  git@github.com:WICG/ua-client-hints.git \
	  git@github.com:WICG/webpackage.git \
	  git@github.com:WebAssembly/WASI.git \
	  git@github.com:WebAssembly/spec.git \
	  git@github.com:WebAudio/web-audio-api.git \
	  git@github.com:immersive-web/webxr.git \
	  git@github.com:mdn/content.git \
	  git@github.com:tc39/ecma262.git \
	  git@github.com:w3c/IndexedDB.git \
	  git@github.com:w3c/ServiceWorker.git \
	  git@github.com:w3c/aria-practices.git \
	  git@github.com:w3c/aria.git \
	  git@github.com:w3c/automotive.git \
	  git@github.com:w3c/chinese-ig.git \
	  git@github.com:w3c/clreq.git \
	  git@github.com:w3c/css-houdini-drafts.git \
	  git@github.com:w3c/csswg-drafts.git \
	  git@github.com:w3c/did-core.git \
	  git@github.com:w3c/did-spec-registries.git \
	  git@github.com:w3c/epub-specs.git \
	  git@github.com:w3c/i18n-drafts.git \
	  git@github.com:w3c/manifest.git \
	  git@github.com:w3c/media-source.git \
	  git@github.com:w3c/mediacapture-main.git \
	  git@github.com:w3c/payment-request.git \
	  git@github.com:w3c/permissions.git \
	  git@github.com:w3c/respec.git \
	  git@github.com:w3c/sdw.git \
	  git@github.com:w3c/sensors.git \
	  git@github.com:w3c/trace-context.git \
	  git@github.com:w3c/uievents.git \
	  git@github.com:w3c/vc-data-model.git \
	  git@github.com:w3c/w3process.git \
	  git@github.com:w3c/wai-about-wai.git \
	  git@github.com:w3c/wai-audiences.git \
	  git@github.com:w3c/wai-intro-wcag.git \
	  git@github.com:w3c/wai-tutorials.git \
	  git@github.com:w3c/wai-website.git \
	  git@github.com:w3c/wcag.git \
	  git@github.com:w3c/web-advertising.git \
	  git@github.com:w3c/web-nfc.git \
	  git@github.com:w3c/web-performance.git \
	  git@github.com:w3c/web-share.git \
	  git@github.com:w3c/webappsec-csp.git \
	  git@github.com:w3c/webappsec-trusted-types.git \
	  git@github.com:w3c/webappsec.git \
	  git@github.com:w3c/webauthn.git \
	  git@github.com:w3c/webcodecs.git \
	  git@github.com:w3c/webcrypto.git \
	  git@github.com:w3c/webdriver.git \
	  git@github.com:w3c/webidl2.js.git \
	  git@github.com:w3c/webrtc-pc.git \
	  git@github.com:w3c/wot-thing-description.git \
	  git@github.com:w3c/wot.git \
	  git@github.com:web-platform-tests/wpt.git \
	  git@github.com:whatwg/dom.git \
	  git@github.com:whatwg/fetch.git \
	  git@github.com:whatwg/html.git \
	  git@github.com:whatwg/streams.git \
	  git@github.com:whatwg/url.git \
	  git@github.com:whatwg/webidl.git

rank:
	node tools/git-pulse-rank.js

clones:
	mkdir build || true; \
	cd build; \
	for url in $(REPO_URLS); do \
		git clone $$url || true; \
	done

snapshots:
	cd build; \
	for dir in */; do \
		cd $$dir && git pull && time bash ../../tools/git-pulse; \
		cp *-pulse.* ../..; \
		cd ..; \
	done;

