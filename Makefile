pkg=ThemeTemplate
keystore=/home/kyle/android/laddk_relese.keystore
alias=laddk_release


.PHONY: clean debug release install

debug:
	ant debug

release:
	ant release
	jarsigner -verbose -sigalg MD5withRSA -digestalg SHA1 -keystore $(keystore) bin/$(pkg)-release-unsigned.apk $(alias)
	zipalign -v 4 bin/$(pkg)-release-unaligned.apk bin/$(pkg).apk

install:
	adb install -r bin/$(pkg)-debug.apk

clean:
	$(RM) bin/*.apk
